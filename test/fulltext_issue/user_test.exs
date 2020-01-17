defmodule FulltextIssue.User.Test do
  use FulltextIssue.DataCase, async: true

  alias FulltextIssue.User

  describe "fulltext_search/1" do
    test "it returns the matching users" do
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

      assert [user_1, user_2] = User.fulltext_search("smith")
    end
  end
end
