defmodule FulltextIssue.Repo do
  use Ecto.Repo,
    otp_app: :fulltext_issue,
    adapter: Ecto.Adapters.MyXQL
end
