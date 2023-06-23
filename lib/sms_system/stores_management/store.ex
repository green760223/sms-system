defmodule SmsSystem.StoresManagement.Store do
  use Ecto.Schema
  import Ecto.Changeset

  alias SmsSystem.StoresManagement.Product

  schema "stores" do
    field :city, :string
    field :name, :string
    field :state, :string
    field :store_id, :string
    field :street, :string
    field :zipcode, :string
    has_many :products, Product

    timestamps()
  end

  @doc false
  def changeset(store, attrs) do
    store
    |> cast(attrs, [:name, :street, :city, :state, :zipcode, :store_id])
    |> validate_required([:name, :street, :city, :state, :zipcode, :store_id])
  end

end
