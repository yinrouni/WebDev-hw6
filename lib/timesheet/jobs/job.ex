defmodule Timesheet.Jobs.Job do
  use Ecto.Schema
  import Ecto.Changeset

  schema "jobs" do
    field :desc, :string
    field :hours, :integer
    field :job_code, :string
    field :name, :string
    belongs_to :user, Timesheet.Users.User
    has_many :tasks, Timesheet.Tasks.Task
    timestamps()
  end

  @doc false
  def changeset(job, attrs) do
    job
    |> cast(attrs, [:job_code, :hours, :name, :desc])
    |> validate_required([:job_code, :hours, :name, :desc])
  end
end
