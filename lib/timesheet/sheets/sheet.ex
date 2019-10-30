defmodule Timesheet.Sheets.Sheet do
  use Ecto.Schema
  import Ecto.Changeset

  schema "sheets" do
    field :date, :date
    field :status, :string
    field :worker_id, :id

    timestamps()
  end

  @doc false
  def changeset(sheet, attrs) do
    sheet
    |> cast(attrs, [:date, :worker_id])
    |> validate_required([:date, :worker_id])
  end
end
