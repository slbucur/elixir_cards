defmodule Cards do
  @moduledoc """
  Documentation for Cards.
  """

  @doc """
  Creates an array that represents a deck of cards

  ## Examples
  Cards.create_deck => returns ["Ace", "Two", "Three"]
  """
  def create_deck do
    ["Ace", "Two", "Three"]
  end

  def shuffle(deck) do
    if length(deck) <= 1 do
      deck
    else
      {elem, rem} = List.pop_at(deck, :rand.uniform(length(deck) - 1))
      [elem | shuffle(rem)]
    end

  end

  def contains(deck, card) do
    if length(deck) == 0 do
      false
      else
        [head | tail] = deck
        if head == card do
          true
        else
          contains(tail, card)
        end
    end
  end

end
