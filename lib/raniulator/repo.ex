defmodule Raniulator.Repo do
  use Ecto.Repo,
    otp_app: :raniulator,
    adapter: Ecto.Adapters.Postgres
end
