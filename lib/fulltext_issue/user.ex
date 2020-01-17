defmodule FulltextIssue.User do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query

  alias __MODULE__
  alias FulltextIssue.Repo

  schema "users" do
    field :email, :string
    field :first_name, :string
    field :is_admin, :boolean, default: false
    field :last_name, :string

    timestamps()
  end

  @doc false
  def changeset(user \\ %User{}, attrs) do
    user
    |> cast(attrs, [:email, :first_name, :last_name, :is_admin])
    |> validate_required([:email, :first_name, :last_name, :is_admin])
  end

  def fulltext_search(query \\ User, text) do
    query =
      from(d in query,
        where:
          fragment(
            "MATCH (email,first_name,last_name) AGAINST (? IN NATURAL LANGUAGE MODE)",
            ^text
          )
      )

    Repo.all(query)
  end
end
