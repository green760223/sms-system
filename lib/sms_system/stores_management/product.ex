defmodule SmsSystem.StoresManagement.Product do
  use Ecto.Schema
  import Ecto.Changeset

  alias SmsSystem.StoresManagement.Store

  schema "products" do
    field :inventory_count, :integer
    field :name, :string
    field :retail_price, :decimal
    field :vendor, :string
    field :wholesale_price, :decimal
    belongs_to :store, Store

    timestamps()
  end

  @doc false
  def changeset(product, attrs) do
    product
    |> cast(attrs, [:name, :vendor, :wholesale_price, :retail_price, :inventory_count, :store_id])
    |> validate_required([:name, :vendor, :wholesale_price, :retail_price, :inventory_count, :store_id])
  end

end
