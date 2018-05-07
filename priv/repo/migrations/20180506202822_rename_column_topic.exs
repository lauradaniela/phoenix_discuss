defmodule Discuss.Repo.Migrations.RenameColumnTopic do
  use Ecto.Migration

  def change do
    rename table("topics"), :topic, to: :title
  end
end
