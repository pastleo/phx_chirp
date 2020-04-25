defmodule PhxChirpWeb.PostLive.PostComponent do
  use PhxChirpWeb, :live_component

  def render(assigns) do
    ~L"""
    <div id="post-<%= @post.id %>" class="post">
      <div class="row">
        <div class="column column-10">
          <div class="post-avatar"></div>
        </div>
        <div class="column column-90 post-body">
          <b>@<%= @post.username %></b>
          <br />
          <%= @post.body %>
        </div>
      </div>

      <div class="row">
        <div class="column">
          💟 <%= @post.likes_count %>
        </div>
        <div class="column">
          🔄 <%= @post.reposts_count %>
        </div>
        <div class="column">
          <%= live_patch to: Routes.post_index_path(@socket, :edit, @post.id) do %>
            ✏️
          <% end %>
          <%= link to: "#", phx_click: "delete", phx_value_id: @post.id, data: [confirm: "Are you sure?"] do %>
            ❌
          <% end %>
        </div>
      </div>
    </div>
    """
  end
end