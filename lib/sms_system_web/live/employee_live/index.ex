defmodule SmsSystemWeb.EmployeeLive.Index do
  use SmsSystemWeb, :live_view

  alias SmsSystem.HumanResources

  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :employees, HumanResources.list_employees())}
  end

end
