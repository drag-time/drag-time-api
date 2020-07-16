defmodule DragTimeApi.Repo do
  use Ecto.Repo,
    otp_app: :drag_time_api,
    adapter: Ecto.Adapters.Postgres
end
