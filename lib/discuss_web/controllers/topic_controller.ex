defmodule DiscussWeb.TopicController do

  use DiscussWeb, :controller
  alias DiscussWeb.Topic
  alias Discuss.Repo

  def new(conn, _params) do
    changeset = Topic.changeset(%Topic{}, %{})
    render conn, "new.html", changeset: changeset
  end

  def create(conn, %{"topic" => title}) do
    changeset = Topic.changeset(%Topic{}, title)

    case Repo.insert(changeset) do
      {:ok, post} -> IO.inspect(post)
      {:error, changeset} ->
          render conn, "new.html", changeset: changeset
    end
  end
end
