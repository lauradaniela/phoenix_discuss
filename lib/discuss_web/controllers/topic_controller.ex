defmodule DiscussWeb.TopicController do
  use DiscussWeb, :controller

  alias Discuss.Charla
  alias Discuss.Charla.Topic

  def index(conn, _params) do
    topics = Charla.list_topics()
    render conn, "index.html", topics: topics
  end

  def new(conn, params) do
    changeset = Charla.Topic.changeset(%Topic{}, params)

    render conn, "new.html", changeset: changeset
  end 

  def create(conn, %{"topic" => topic_params}) do
    with {:ok, %Topic{} = topic} <- Charla.create_topic!(topic_params) do
      conn
      |> put_flash(:info, "Topic Created")
      |> redirect(to: topic_path(conn, :index))
    else
      {:error, %{errors: errors}} ->
        conn
        |> put_flash(:error, "Parametros incorrectos")
        |> redirect(to: topic_path(conn, :new))
      end
  end

  def edit(conn, %{"id" => id}) do
    topic = Charla.get_topic!(id)
    changeset = Charla.Topic.changeset(topic)

    render(conn, "edit.html", changeset: changeset, topic: topic)
  end

  def update(conn, %{"id" => topic_id, "topic" => topic_params}) do
    topic = Charla.get_topic!(topic_id)

    with {:ok, %Topic{} = topic} <- Charla.update_topic(topic, topic_params) do
      conn
      |> put_flash(:info, "Topic Updated")
      |> redirect(to: topic_path(conn, :index))
    end
  end

  def delete(conn, %{"id" => topic_id}) do
    topic = Charla.get_topic!(topic_id)

    with {:ok, %Topic{} = topic} <- Charla.delete_topic(topic) do
      conn
      |> put_flash(:info, "Topic Deleted")
      |> redirect(to: topic_path(conn, :index))
    end
  end

end
