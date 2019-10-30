defmodule Timesheet.Sheets.Sheet do
  use Ecto.Schema
  import Ecto.Changeset

  schema "sheets" do
    field :date, :date
    field :status, :string
    belongs_to :user, Timesheet.Users.User, foreign_key: :worker_id
    timestamps()
  end

  @doc false
  def changeset(sheet, attrs) do
    sheet
    |> cast(attrs, [:date, :status, :worker_id])
    |> validate_required([:date, :worker_id])
  end
end
