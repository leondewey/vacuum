defmodule Vacuum.Event do
  use Vacuum.Web, :model

  schema "events" do
    field :payload, :map

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:payload])
    |> validate_required([:payload])
  end
end
