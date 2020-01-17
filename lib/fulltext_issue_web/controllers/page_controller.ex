defmodule FulltextIssueWeb.PageController do
  use FulltextIssueWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
