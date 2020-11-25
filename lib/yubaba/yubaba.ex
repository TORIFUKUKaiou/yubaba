defmodule Yubaba.Yubaba do
  def new_name(""), do: "千"

  def new_name(name) do
    if String.contains?(name, "千") do
      "千"
    else
      String.codepoints(name) |> Enum.random()
    end
  end
end
