defmodule Timesheet.Repo.Migrations.AddManagerEmail do
  use Ecto.Migration

  def change do
 alter table("users") do
      add :manager_email, :string, default: nil, null: true
    end
  end
end
