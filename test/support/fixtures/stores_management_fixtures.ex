defmodule SmsSystem.StoresManagementFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `SmsSystem.StoresManagement` context.
  """

  @doc """
  Generate a store.
  """
  def store_fixture(attrs \\ %{}) do
    {:ok, store} =
      attrs
      |> Enum.into(%{
        city: "some city",
        name: "some name",
        state: "some state",
        store_id: "some store_id",
        street: "some street",
        zipcode: "some zipcode"
      })
      |> SmsSystem.StoresManagement.create_store()

    store
  end

  @doc """
  Generate a product.
  """
  def product_fixture(attrs \\ %{}) do
    {:ok, product} =
      attrs
      |> Enum.into(%{
        inventory_count: 42,
        name: "some name",
        retail_price: "120.5",
        vendor: "some vendor",
        wholesale_price: "120.5"
      })
      |> SmsSystem.StoresManagement.create_product()

    product
  end
end
