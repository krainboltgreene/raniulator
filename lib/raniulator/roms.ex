defmodule Raniulator.Roms do
  @moduledoc """
  The Roms context.
  """

  import Ecto.Query, warn: false

  @doc """
  Returns the list of roms.

  ## Examples

      iex> list_roms()
      [%Rom{}, ...]

  """
  def list_roms do
    Raniulator.Repo.all(Raniulator.Roms.Rom)
  end

  @doc """
  Gets a single rom.

  Raises `Ecto.NoResultsError` if the Rom does not exist.

  ## Examples

      iex> get_rom!(123)
      %Rom{}

      iex> get_rom!(456)
      ** (Ecto.NoResultsError)

  """
  def get_rom!(id), do: Raniulator.Repo.get!(Raniulator.Roms.Rom, id)

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking rom changes.

  ## Examples

      iex> change_rom(rom)
      %Ecto.Changeset{data: %Rom{}}

  """
  def change_rom(%Raniulator.Roms.Rom{} = rom, attrs \\ %{}) do
    Raniulator.Roms.Rom.changeset(rom, attrs)
  end

  @doc """
  Creates a rom.

  ## Examples

      iex> create_rom(%{field: value})
      {:ok, %Rom{}}

      iex> create_rom(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_rom(attrs \\ %{}) do
    %Raniulator.Roms.Rom{}
    |> Raniulator.Roms.Rom.changeset(attrs)
    |> Raniulator.Repo.insert()
  end
end
