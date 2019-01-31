defmodule FileUpload.PageController do
  use FileUpload.Web, :controller

  def index(conn, _params) do
    render(conn, "index.html", token: get_csrf_token())
  end

  def upload(
        conn,
        %{
          "fileToUpload" => %Plug.Upload{
            path: path
          }
        } = params
      ) do
    IO.puts("upload:  #{inspect(path)}")

    File.copy!(path, "/tmp/output")

    html(conn, """
    <html>
       <head>
          <title>Passing an Id</title>
       </head>
       <body>
         <pre>Results #{result}</pre>
       </body>
     </html>
 """
  end
end
