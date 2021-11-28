# DropboxClient.list_files("https://www.dropbox.com/sh/0d4q2gv92t8coep/AABZsrK-4z6e5M53g_NlXGSaa")
defmodule DropboxClient do
  @token "sl.A9JXwZ3KPPAS40PFXO5FsdCZqULAqVN2cGolGoPUiAI_jV8J-RzeVmQTJhrgR37-WRT_UdcqBP3t1xth-YEZ4PGuYLtyI7Fi5_kcLo0PvS6R2ANgxZzuBX2m1E-Op9F0czfLN1E"

  def pull_files(link) do
    {:ok, response} = Finch.build(
      :post,
      "https://api.dropboxapi.com/2/files/list_folder",
      [
        {"Authorization", "Bearer #{@token}"},
        {"Content-Type", "application/json"}
      ],
      %{
          "path" => "",
          "recursive" => false,
          "include_media_info" => false,
          "include_deleted" => false,
          "include_has_explicit_shared_members" => false,
          "include_mounted_folders" => true,
          "include_non_downloadable_files" => false,
          "shared_link" => %{
            "url" => link
          }
      } |> Jason.encode!()) |> Finch.request(__MODULE__)

      response
      |> Map.get(:body)
      |> Jason.decode!()
      |> Map.get("entries")
      |> Enum.map(&download(&1, link))
  end

  def download(%{"name" => name, "content_hash" => hash}, link) do
    {:ok, response} = Finch.build(
      :post,
      "https://content.dropboxapi.com/2/sharing/get_shared_link_file",
      [
        {"Authorization", "Bearer #{@token}"},
        {"Dropbox-API-Arg", %{"url" => link, "path" => "/#{name}"} |> Jason.encode!()}
      ]
    )
    |> Finch.request(__MODULE__)

    Raniulator.Roms.create_rom(%{
      name: name,
      body: response.body,
      hash: hash
    })
  end
end
# curl -X POST  \
#     --header "Authorization: Bearer " \
#     --header "Dropbox-API-Arg: {\"url\": \"https://www.dropbox.com/s/2sn712vy1ovegw8/Prime_Numbers.txt?dl=0\",\"path\": \"/Prime_Numbers.txt\"}"
