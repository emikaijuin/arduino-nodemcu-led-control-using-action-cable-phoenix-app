defmodule PhoenixApp.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias PhoenixApp.Repo

  schema "users" do
    field :confirmation_token, :string
    field :email, :string
    field :first_name, :string
    field :last_name, :string
    field :password, :string, virtual: true
    field :password_digest, :string
    field :remember_token, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs \\ %{}) do
    user
    |> cast(attrs, [
      :first_name,
      :last_name,
      :email,
      :password_digest,
      :confirmation_token,
      :remember_token
    ])
    |> validate_required([
      :first_name,
      :last_name,
      :email,
      :password_digest,
      :confirmation_token,
      :remember_token
    ])
  end
end
