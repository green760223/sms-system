defmodule SmsSystemWeb.ProductLive.Index do
  use SmsSystemWeb, :live_view

  alias SmsSystem.StoresManagement
  alias SmsSystem.StoresManagement.Product
  alias SmsSystem.Repo

  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :products, StoresManagement.list_products())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    IO.inspect(id)
    socket
    |> assign(:page_title, "Edit Product")
    |> assign(:product, StoresManagement.get_product!(id) |> IO.inspect())
    |> assign(:stores, StoresManagement.list_stores())
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Product")
    |> assign(:product, %Product{})
    |> assign(:stores, StoresManagement.list_stores())
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Products")
    |> assign(:product, nil)
  end

  @impl true
  def handle_info({SmsSystemWeb.ProductLive.FormComponent, {:saved, product}}, socket) do
    IO.inspect(product, label: "IN HANDLE INFO")
    # selected_store_id = socket.assigns.selected_store_id
    # updated_product = %{product | store_id: selected_store_id}
    # Repo.update!(updated_product)
    # {:noreply, stream_insert(socket, :products, updated_product |> Repo.preload(:store, force: true))}
    {:noreply, stream_insert(socket, :products, product |> Repo.preload(:store, force: true))}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    product = StoresManagement.get_product!(id)
    {:ok, _} = StoresManagement.delete_product(product)

    {:noreply, stream_delete(socket, :products, product)}
  end

  def get_store_name_by_product(product) do
    # IO.inspect(product, label: "Product")
    store = Repo.preload(product, :store)
    IO.inspect(store, label: "Store")
    product.store.name
    # IO.inspect(store.name, label: "Store Name")
  end

  # def get_store_name_by_product(product_id) do
  #   product =
  #     Repo.get(Product, product_id)
  #     |> Repo.preload(:store)
  #   store = product.store
  #   store.name
  # end

end
