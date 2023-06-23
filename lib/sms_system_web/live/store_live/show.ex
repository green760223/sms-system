defmodule SmsSystemWeb.StoreLive.Show do
  use SmsSystemWeb, :live_view

  alias SmsSystem.StoresManagement

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  # @impl true
  # def handle_params(%{"id" => id}, _, socket) do
  #   {:noreply,
  #     socket
  #     |> assign(:page_title, page_title(socket.assigns.live_action))
  #     |> assign(:store, StoresManagement.get_store!(id))}
  # end

  @impl true
  @spec handle_params(map, any, %{
          :assigns => atom | %{:live_action => :edit | :show, optional(any) => any},
          optional(any) => any
        }) :: {:noreply, map}
  def handle_params(%{"id" => id}, _, socket) do
    store = StoresManagement.get_store!(id)
    IO.inspect(store, label: "---store---:")
    products = StoresManagement.list_products(store)

    {:noreply,
      socket
      |> assign(:page_title, page_title(socket.assigns.live_action))
      |> assign(:store, store)
      |> assign(:products, products)
    }
  end


  defp page_title(:show), do: "Show Store"
  defp page_title(:edit), do: "Edit Store"
end
