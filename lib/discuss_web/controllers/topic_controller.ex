defmodule DiscussWeb.TopicController do
  use DiscussWeb, :controller

  alias Discuss.Charla
  alias Discuss.Charla.Topic

  def new(conn, params) do
    changeset = Charla.Topic.changeset(%Topic{}, params)

    render conn, "new.html", changeset: changeset
  end 

  def create(conn, %{"topic" => topic_params}) do
    with {:ok, %Topic{} = topic} <- Charla.create_topic(topic_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", topic_path(conn, :show, topic))
      |> render("new.html", topic: topic)
    end
  end

end
