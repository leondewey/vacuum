defmodule Vacuum.Repo.Migrations.CreateEvent do
  use Ecto.Migration

  def change do
    create table(:events) do
      add :payload, :map

      timestamps()
    end

  end
end
