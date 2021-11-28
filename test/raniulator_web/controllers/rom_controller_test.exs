defmodule RaniulatorWeb.RomControllerTest do
  use RaniulatorWeb.ConnCase

  import Raniulator.RomsFixtures

  @create_attrs %{name: "some name", url: "some url"}
  @update_attrs %{name: "some updated name", url: "some updated url"}
  @invalid_attrs %{name: nil, url: nil}

  describe "index" do
    test "lists all roms", %{conn: conn} do
      conn = get(conn, Routes.rom_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Roms"
    end
  end

  describe "new rom" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.rom_path(conn, :new))
      assert html_response(conn, 200) =~ "New Rom"
    end
  end

  describe "create rom" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.rom_path(conn, :create), rom: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.rom_path(conn, :show, id)

      conn = get(conn, Routes.rom_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Rom"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.rom_path(conn, :create), rom: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Rom"
    end
  end

  describe "edit rom" do
    setup [:create_rom]

    test "renders form for editing chosen rom", %{conn: conn, rom: rom} do
      conn = get(conn, Routes.rom_path(conn, :edit, rom))
      assert html_response(conn, 200) =~ "Edit Rom"
    end
  end

  describe "update rom" do
    setup [:create_rom]

    test "redirects when data is valid", %{conn: conn, rom: rom} do
      conn = put(conn, Routes.rom_path(conn, :update, rom), rom: @update_attrs)
      assert redirected_to(conn) == Routes.rom_path(conn, :show, rom)

      conn = get(conn, Routes.rom_path(conn, :show, rom))
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, rom: rom} do
      conn = put(conn, Routes.rom_path(conn, :update, rom), rom: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Rom"
    end
  end

  describe "delete rom" do
    setup [:create_rom]

    test "deletes chosen rom", %{conn: conn, rom: rom} do
      conn = delete(conn, Routes.rom_path(conn, :delete, rom))
      assert redirected_to(conn) == Routes.rom_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.rom_path(conn, :show, rom))
      end
    end
  end

  defp create_rom(_) do
    rom = rom_fixture()
    %{rom: rom}
  end
end
