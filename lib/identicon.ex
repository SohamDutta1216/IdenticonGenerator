defmodule Identicon do
  def main(input) do
    input
    |> hash_input
    |> pick_color
    |> build_grid
  end

  def build_grid(%Identicon.Image{hex: hex} = image) do
    hex
    |> Enum.chunk(3)
  end

  def mirror_row(row) do
    [first, second | _tail] = row

    row ++ [second, first]

  end
  def pick_color( %Identicon.Image{hex: [r,g,b | _tail]} = image) do
    %Identicon.Image{image | color: {r,g,b} }
  end
  ## JS equivalent
  ##  pick_color : function(image) {
  ##  image.color = {
  ##  r: image.hex[0],
  ##  g: image.hex[1],
  ##  b: image.hex[2]
  ##    }
  ## }

  def hash_input(input) do
   hex = :crypto.hash(:md5, input)
    |> :binary.bin_to_list
%Identicon.Image{hex: hex}
  end
  end
