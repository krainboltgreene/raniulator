defmodule Raniulator.Roms.Rom do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "roms" do
    field :name, :string
    field :url, :string

    timestamps()
  end

  @doc false
  def changeset(rom, attrs) do
    rom
    |> cast(attrs, [:name, :url])
    |> validate_required([:name, :url])
  end
end
