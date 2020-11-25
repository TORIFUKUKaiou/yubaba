defmodule YubabaWeb.YubabaLive do
  use YubabaWeb, :live_view

  def mount(_params, _session, socket) do
    socket = assign(socket, name: "", submitted: false, new_name: "")
    {:ok, socket}
  end

  def render(assigns) do
    ~L"""
    <h1>湯婆婆</h1>
    <%= if @submitted do %>
      <img src="images/chihiro017.jpg">
    <% else %>
      <img src="images/chihiro016.jpg">
    <% end %>

    <%= if @submitted do %>
    <pre>
    フン。<%= @name %>というのかい。贅沢な名だねぇ。
    今からお前の名前は<%= @new_name %>だ。いいかい、<%= @new_name %>だよ。分かったら返事をするんだ、<%= @new_name %>!!
    </pre>
    <% end %>
    <form phx-submit="yubaba">
      <input type="text" name="name" value="<%= @name %>"
        placeholder="契約書だよ。そこに名前を書きな。"
        autofocus autocomplete="off" />

      <button type="submit">
        回答
      </button>
      <%= if @submitted do %>
        <a href="/yubaba">もう一度</a>
      <% end %>
    </form>
    """
  end

  def handle_event("yubaba", %{"name" => name}, socket) do
    new_name = Yubaba.Yubaba.new_name(name)

    {:ok, %Yubaba.Accounts.User{}} =
      Yubaba.Accounts.create_user(%{name: name, new_name: new_name})

    socket =
      assign(socket,
        name: name,
        new_name: new_name,
        submitted: true
      )

    {:noreply, socket}
  end
end
