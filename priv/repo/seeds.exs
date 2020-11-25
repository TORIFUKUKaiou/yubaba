# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Yubaba.Repo.insert!(%Yubaba.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

for i <- 1..50 do
  {:ok, _} =
    Yubaba.Accounts.create_user(%{
      name: "User #{i}",
      new_name: "#{i}"
    })
end
