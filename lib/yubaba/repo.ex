defmodule Yubaba.Repo do
  use Ecto.Repo,
    otp_app: :yubaba,
    adapter: Ecto.Adapters.Postgres
end
