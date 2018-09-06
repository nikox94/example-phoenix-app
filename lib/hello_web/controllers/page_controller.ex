defmodule HelloWeb.PageController do
  use HelloWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def add(conn, %{"name" => name}) do
    Hello.Repo.insert(%Hello.User{name: name})
    render conn, "show.html", name: name
  end

  def list(conn, _params) do
    all = Hello.Repo.all(Hello.User)
    render conn, "all.html", all: to_string(all)
  end
end
