defmodule Yubaba.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :new_name, :string

      timestamps()
    end
  end
end
