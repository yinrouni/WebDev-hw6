defmodule Timesheet.Sheets.Sheet do
  use Ecto.Schema
  import Ecto.Changeset

  schema "sheets" do
    field :date, :date
    field :status, :string
    belongs_to :user, Timesheet.Users.User, foreign_key: :worker_id
    has_many :tasks, Timesheet.Tasks.Task
    timestamps()
  end

  @doc false
  def changeset(sheet, attrs) do
    IO.inspect(sheet.tasks)
    sheet
    |> cast(attrs, [:date, :status, :worker_id])
    |> cast_assoc(:tasks, required: true)
    |> validate_required([:date, :worker_id])
  end
end
