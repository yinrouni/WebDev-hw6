defmodule Timesheet.Tasks.Task do
  use Ecto.Schema
  import Ecto.Changeset

  alias Timesheet.Jobs.Job

  schema "tasks" do
    field :hours, :integer
    field :notes, :string
    belongs_to :job, Timesheet.Jobs.Job
    belongs_to :sheet, Timesheet.Sheets.Sheet
    timestamps()
  end

  @doc false
  def changeset(task, attrs) do
    attrs = attrs_help(attrs)
    task
    |> cast(attrs, [:hours, :notes, :job_id])
    |> validate_required([:hours, :job_id])
    |> case do
    %{valid?: false, changes: changes} = changeset when changes == %{} ->
      # If the changeset is invalid and has no changes, it is
      # because all required fields are missing, so we ignore it.
      %{changeset | action: :ignore}
    changeset ->
      changeset
  end
  end
def validate_repo_existence(%{valid?: false} = changeset), do: changeset
  def attrs_help(attrs) do
    if (attrs["task"] != "" && attrs["task"] != nil) do 
      attrs = Map.put(attrs, "job_id", Timesheet.Jobs.get_job_by_job_code(attrs["task"]).id)
      attrs
    else
      attrs = Map.put(attrs, "hours", "")

      attrs
    end 
  end
  
end
