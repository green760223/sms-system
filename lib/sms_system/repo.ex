defmodule SmsSystem.Repo do
  use Ecto.Repo,
    otp_app: :sms_system,
    adapter: Ecto.Adapters.Postgres
end
