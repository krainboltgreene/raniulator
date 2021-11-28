defmodule RaniulatorWeb.BoxController do
  use RaniulatorWeb, :controller

  def create(conn, %{"box" => %{"link" => link}}) do

    DropboxClient.pull_files(link)

    conn
    |> put_flash(:info, "Box imported, enjoy.")
    |> redirect(to: Routes.rom_path(conn, :index))
  end
end
