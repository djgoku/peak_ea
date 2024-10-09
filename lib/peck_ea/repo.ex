defmodule PeckEa.Repo do
  use Ecto.Repo,
    otp_app: :peck_ea,
    adapter: Ecto.Adapters.SQLite3
end
