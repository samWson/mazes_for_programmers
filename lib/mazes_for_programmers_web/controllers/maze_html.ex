defmodule MazesForProgrammersWeb.MazeHTML do
  use MazesForProgrammersWeb, :html
  import MazesForProgrammers.BinaryTree

  embed_templates "mazes_html/*"
end
