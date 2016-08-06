defmodule Vacuum.GithubController do
  use Vacuum.Web, :controller

  def create(conn, params) do
    text conn, params["action"]
  end

end
