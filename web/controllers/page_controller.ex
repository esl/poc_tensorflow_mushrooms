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

    {x, _} =
      System.cmd(
        "python",
        [
          "-m",
          "scripts.label_image",
          "--graph=/Users/b/repos/my-tensorflow-for-poets/tf_files/retrained_graph.pb",
          "--image=/tmp/output",
          "--labels=/Users/b/repos/my-tensorflow-for-poets/tf_files/retrained_labels.txt"
        ],
        env: [{"PYTHONPATH", "/Users/b/repos/my-tensorflow-for-poets/"}]
      )

    output = Regex.replace(~r/\n/, x, "\n")

    html(conn, """
       <html>
          <head>
             <title>Passing an Id</title>
          </head>
          <body>
            <pre>Results #{output}</pre>
          </body>
        </html>
    """)
  end
end
