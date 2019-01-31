defmodule FileUpload.PageController do
  use FileUpload.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end


def foretell(conn, %{"name" => name}) do
    prophecies = [
      "Nothing will be good, #{name}",
      "You don't need to think about the future, #{name}. You don't have any"
    ]
    
    text conn, Enum.random(prophecies)
end
end
