defmodule PhoenixApp.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :first_name, :string
      add :last_name, :string
      add :email, :string
      add :password_digest, :string
      add :confirmation_token, :string
      add :remember_token, :string

      timestamps()
    end

  end
end
