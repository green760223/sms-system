defmodule SmsSystem.StoresManagementTest do
  use SmsSystem.DataCase

  alias SmsSystem.StoresManagement

  describe "stores" do
    alias SmsSystem.StoresManagement.Store

    import SmsSystem.StoresManagementFixtures

    @invalid_attrs %{city: nil, name: nil, state: nil, store_id: nil, street: nil, zipcode: nil}

    test "list_stores/0 returns all stores" do
      store = store_fixture()
      assert StoresManagement.list_stores() == [store]
    end

    test "get_store!/1 returns the store with given id" do
      store = store_fixture()
      assert StoresManagement.get_store!(store.id) == store
    end

    test "create_store/1 with valid data creates a store" do
      valid_attrs = %{city: "some city", name: "some name", state: "some state", store_id: "some store_id", street: "some street", zipcode: "some zipcode"}

      assert {:ok, %Store{} = store} = StoresManagement.create_store(valid_attrs)
      assert store.city == "some city"
      assert store.name == "some name"
      assert store.state == "some state"
      assert store.store_id == "some store_id"
      assert store.street == "some street"
      assert store.zipcode == "some zipcode"
    end

    test "create_store/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = StoresManagement.create_store(@invalid_attrs)
    end

    test "update_store/2 with valid data updates the store" do
      store = store_fixture()
      update_attrs = %{city: "some updated city", name: "some updated name", state: "some updated state", store_id: "some updated store_id", street: "some updated street", zipcode: "some updated zipcode"}

      assert {:ok, %Store{} = store} = StoresManagement.update_store(store, update_attrs)
      assert store.city == "some updated city"
      assert store.name == "some updated name"
      assert store.state == "some updated state"
      assert store.store_id == "some updated store_id"
      assert store.street == "some updated street"
      assert store.zipcode == "some updated zipcode"
    end

    test "update_store/2 with invalid data returns error changeset" do
      store = store_fixture()
      assert {:error, %Ecto.Changeset{}} = StoresManagement.update_store(store, @invalid_attrs)
      assert store == StoresManagement.get_store!(store.id)
    end

    test "delete_store/1 deletes the store" do
      store = store_fixture()
      assert {:ok, %Store{}} = StoresManagement.delete_store(store)
      assert_raise Ecto.NoResultsError, fn -> StoresManagement.get_store!(store.id) end
    end

    test "change_store/1 returns a store changeset" do
      store = store_fixture()
      assert %Ecto.Changeset{} = StoresManagement.change_store(store)
    end
  end

  describe "products" do
    alias SmsSystem.StoresManagement.Product

    import SmsSystem.StoresManagementFixtures

    @invalid_attrs %{inventory_count: nil, name: nil, retail_price: nil, vendor: nil, wholesale_price: nil}

    test "list_products/0 returns all products" do
      product = product_fixture()
      assert StoresManagement.list_products() == [product]
    end

    test "get_product!/1 returns the product with given id" do
      product = product_fixture()
      assert StoresManagement.get_product!(product.id) == product
    end

    test "create_product/1 with valid data creates a product" do
      valid_attrs = %{inventory_count: 42, name: "some name", retail_price: "120.5", vendor: "some vendor", wholesale_price: "120.5"}

      assert {:ok, %Product{} = product} = StoresManagement.create_product(valid_attrs)
      assert product.inventory_count == 42
      assert product.name == "some name"
      assert product.retail_price == Decimal.new("120.5")
      assert product.vendor == "some vendor"
      assert product.wholesale_price == Decimal.new("120.5")
    end

    test "create_product/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = StoresManagement.create_product(@invalid_attrs)
    end

    test "update_product/2 with valid data updates the product" do
      product = product_fixture()
      update_attrs = %{inventory_count: 43, name: "some updated name", retail_price: "456.7", vendor: "some updated vendor", wholesale_price: "456.7"}

      assert {:ok, %Product{} = product} = StoresManagement.update_product(product, update_attrs)
      assert product.inventory_count == 43
      assert product.name == "some updated name"
      assert product.retail_price == Decimal.new("456.7")
      assert product.vendor == "some updated vendor"
      assert product.wholesale_price == Decimal.new("456.7")
    end

    test "update_product/2 with invalid data returns error changeset" do
      product = product_fixture()
      assert {:error, %Ecto.Changeset{}} = StoresManagement.update_product(product, @invalid_attrs)
      assert product == StoresManagement.get_product!(product.id)
    end

    test "delete_product/1 deletes the product" do
      product = product_fixture()
      assert {:ok, %Product{}} = StoresManagement.delete_product(product)
      assert_raise Ecto.NoResultsError, fn -> StoresManagement.get_product!(product.id) end
    end

    test "change_product/1 returns a product changeset" do
      product = product_fixture()
      assert %Ecto.Changeset{} = StoresManagement.change_product(product)
    end
  end
end
