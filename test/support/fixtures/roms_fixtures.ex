defmodule Raniulator.RomsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Raniulator.Roms` context.
  """

  @doc """
  Generate a rom.
  """
  def rom_fixture(attrs \\ %{}) do
    {:ok, rom} =
      attrs
      |> Enum.into(%{
        name: "some name",
        url: "some url"
      })
      |> Raniulator.Roms.create_rom()

    rom
  end
end
