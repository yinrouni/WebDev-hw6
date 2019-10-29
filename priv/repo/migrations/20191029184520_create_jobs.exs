defmodule Timesheet.Repo.Migrations.CreateJobs do
  use Ecto.Migration

  def change do
    create table(:jobs) do
      add :job_code, :string
      add :hours, :integer
      add :name, :string
      add :desc, :text
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:jobs, [:user_id])
  end
end
