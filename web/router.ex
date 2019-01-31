defmodule FileUpload.Router do
  use FileUpload.Web, :router

  pipeline :browser do
    plug(:accepts, ["html"])
    plug(:fetch_session)
    plug(:fetch_flash)
    plug(:protect_from_forgery)
    plug(:put_secure_browser_headers)
  end

  pipeline :api do
    plug(:accepts, ["json"])
  end

  scope "/", FileUpload do
    # Use the default browser stack
    pipe_through(:browser)

    get("/", PageController, :index)
    post("/", PageController, :upload)
  end

  # Other scopes may use custom stacks.
  # scope "/api", FileUpload do
  #   pipe_through :api
  # end
end
