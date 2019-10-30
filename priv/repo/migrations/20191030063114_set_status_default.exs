defmodule Timesheet.Repo.Migrations.SetStatusDefault do
  use Ecto.Migration

  def change do
    alter table("sheets") do
       modify :status, :string, default: "pending", null: false
    end

  end
end
