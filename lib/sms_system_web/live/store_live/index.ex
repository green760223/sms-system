defmodule SmsSystemWeb.StoreLive.Index do
  use SmsSystemWeb, :live_view

  alias SmsSystem.StoresManagement
  alias SmsSystem.StoresManagement.Store
  alias SmsSystem.Repo

  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :stores, StoresManagement.list_stores())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Store")
    |> assign(:store, StoresManagement.get_store!(id))
    |> assign(:products, StoresManagement.list_products())
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Store")
    |> assign(:store, %Store{})
    |> assign(:products, StoresManagement.list_products())
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Stores")
    |> assign(:store, nil)
  end

  @impl true
  def handle_info({SmsSystemWeb.StoreLive.FormComponent, {:saved, store}}, socket) do
    {:noreply, stream_insert(socket, :stores, store |> Repo.preload(:product, force: true))}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    store = StoresManagement.get_store!(id)
    {:ok, _} = StoresManagement.delete_store(store)

    {:noreply, stream_delete(socket, :stores, store)}
  end
end
