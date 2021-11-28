defmodule Raniulator.RomsTest do
  use Raniulator.DataCase

  alias Raniulator.Roms

  describe "roms" do
    alias Raniulator.Roms.Rom

    import Raniulator.RomsFixtures

    @invalid_attrs %{name: nil, url: nil}

    test "list_roms/0 returns all roms" do
      rom = rom_fixture()
      assert Roms.list_roms() == [rom]
    end

    test "get_rom!/1 returns the rom with given id" do
      rom = rom_fixture()
      assert Roms.get_rom!(rom.id) == rom
    end

    test "create_rom/1 with valid data creates a rom" do
      valid_attrs = %{name: "some name", url: "some url"}

      assert {:ok, %Rom{} = rom} = Roms.create_rom(valid_attrs)
      assert rom.name == "some name"
      assert rom.url == "some url"
    end

    test "create_rom/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Roms.create_rom(@invalid_attrs)
    end

    test "update_rom/2 with valid data updates the rom" do
      rom = rom_fixture()
      update_attrs = %{name: "some updated name", url: "some updated url"}

      assert {:ok, %Rom{} = rom} = Roms.update_rom(rom, update_attrs)
      assert rom.name == "some updated name"
      assert rom.url == "some updated url"
    end

    test "update_rom/2 with invalid data returns error changeset" do
      rom = rom_fixture()
      assert {:error, %Ecto.Changeset{}} = Roms.update_rom(rom, @invalid_attrs)
      assert rom == Roms.get_rom!(rom.id)
    end

    test "delete_rom/1 deletes the rom" do
      rom = rom_fixture()
      assert {:ok, %Rom{}} = Roms.delete_rom(rom)
      assert_raise Ecto.NoResultsError, fn -> Roms.get_rom!(rom.id) end
    end

    test "change_rom/1 returns a rom changeset" do
      rom = rom_fixture()
      assert %Ecto.Changeset{} = Roms.change_rom(rom)
    end
  end
end
