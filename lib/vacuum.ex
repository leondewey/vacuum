require Vacuum.Api.Github

defmodule Vacuum do
end

defmodule Vacuum.API do
  use Maru.Router

  before do
    plug Plug.Logger
    plug Plug.Parsers,
      pass: ["*/*"],
      json_decoder: Poison,
      parsers: [:urlencoded, :json, :multipart]
  end

  rescue_from Unauthorized, as: e do
    IO.inspect e
    conn
    |> put_status(401)
    |> text("Unauthorized")
  end

  rescue_from :all do
    conn
    |> put_status(500)
    |> text("Server Error")
  end

  mount Vacuum.Api.Github

end
