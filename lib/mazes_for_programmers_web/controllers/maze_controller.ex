defmodule MazesForProgrammersWeb.MazeController do
  use MazesForProgrammersWeb, :controller

  def index(conn, _params) do
    render(conn, :index)
  end
end
