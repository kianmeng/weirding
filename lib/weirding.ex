defmodule Weirding do
  @moduledoc "README.md"
             |> File.read!()
             |> String.split("<!-- MDOC !-->")
             |> Enum.fetch!(1)

  alias Weirding.Chain

  @external_resource "priv/corpus.txt"
  @dune File.read!("priv/corpus.txt")

  @chain Chain.build(@dune)

  @doc """
  Returns a sentence with the specified number of words.
  """
  def words(n \\ 45)
  def words(n) when n <= 0, do: ""

  def words(n) do
    @chain
    |> Chain.to_stream
    |> Enum.take(n)
    |> Enum.join(" ")
  end
end
