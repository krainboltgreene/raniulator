defmodule RaniulatorWeb.RomController do
  use RaniulatorWeb, :controller

  def index(conn, _params) do
    roms = Raniulator.Roms.list_roms()
    render(conn, "index.html", roms: roms)
  end

  def create(conn, %{"rom" => rom_params}) do
    case Raniulator.Roms.create_rom(rom_params) do
      {:ok, rom} ->
        conn
        |> put_flash(:info, "Rom created successfully.")
        |> redirect(to: Routes.rom_path(conn, :show, rom))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  @spec show(Plug.Conn.t(), map) :: Plug.Conn.t()
  def show(conn, %{"id" => id}) do
    rom = Raniulator.Roms.get_rom!(id)
    render(conn, "show.html", rom: rom)
  end
end
