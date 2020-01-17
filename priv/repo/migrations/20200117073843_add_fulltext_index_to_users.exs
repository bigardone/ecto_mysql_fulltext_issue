defmodule FulltextIssue.Repo.Migrations.AddFulltextIndexToUsers do
  use Ecto.Migration

  def change do
    execute("ALTER TABLE users add FULLTEXT (email,first_name,last_name);")
  end
end
