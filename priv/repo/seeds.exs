# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     FulltextIssue.Repo.insert!(%FulltextIssue.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias FulltextIssue.{Repo, User}

Repo.delete_all(User)

users = [
  %{email: "john@gmail.com", first_name: "John", last_name: "Smith", is_admin: true},
  %{email: "sam@gmail.com", first_name: "Sam", last_name: "Smith", is_admin: false},
  %{email: "tom@gmail.com", first_name: "Tom", last_name: "Jackson", is_admin: false}
]

for params <- users do
  params
  |> User.changeset()
  |> Repo.insert!()
end
