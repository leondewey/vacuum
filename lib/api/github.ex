defmodule Vacuum.Api.Github do
  use Maru.Router

  namespace "github" do
    params do
      optional :action

      optional :issue, type: Map do
        requires :url
        requires :number
      end

      # optional :issue, type: Map
      optional :repository, type: Map
      optional :sender, type: Map
    end
    post do
      data = params |> IO.inspect
      conn |> json(data)
    end
  end

end
