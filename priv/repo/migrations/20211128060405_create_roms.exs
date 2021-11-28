defmodule Raniulator.Repo.Migrations.CreateRoms do
  use Ecto.Migration

  def change do
    create table(:roms, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :text, null: false
      add :body, :binary, null: false
      add :hash, :text, null: false

      timestamps()
    end

    create unique_index(:roms, [:name, :hash])
  end
end
