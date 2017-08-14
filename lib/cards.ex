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
    values = ["Ace", "Two", "Three", "Four", "Five"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

    for suit <- suits, value <- values do
      "#{value} of #{suit}"
    end

  end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

end
