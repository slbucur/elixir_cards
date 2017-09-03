defmodule Cards do
  @moduledoc """
  Provides methods for creating and handling a deck of cards
  ## Example usage
      iex> deck = Cards.create_deck
      iex> {hand, deck} = Cards.deal(deck, 1)
      iex> hand
      ["Ace of spades"]
  """

  @doc """
  Creates an array that represents a deck of cards

  ## Examples
  ```
  Cards.create_deck
  ["Ace of Spades", "Two of Spades", "Three of Spades", "Four of Spades",
  "Five of Spades", "Ace of Clubs", "Two of Clubs", "Three of Clubs",
  "Four of Clubs", "Five of Clubs", "Ace of Hearts", "Two of Hearts",
  "Three of Hearts", "Four of Hearts", "Five of Hearts", "Ace of Diamonds",
  "Two of Diamonds", "Three of Diamonds", "Four of Diamonds", "Five of Diamonds"]
  ```
  """
  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

    for suit <- suits, value <- values do
      "#{value} of #{suit}"
    end

  end

  @doc """
  Shuffles a deck randomly
  """
  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  @doc """
  Checks if a deck contains a card
  """
  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  @doc """
  Takes `hand_size` cards out of the deck and returns two arrays:

  * one with `hand_size` cards
  * another one with the remaining deck

  ## Examples

      iex> deck = Cards.create_deck
      iex> {hand, deck} = Cards.deal(deck, 1)
      iex> hand
      ["Ace of spades"]
  """
  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  @doc """
  Saves a deck to disk in binary format
  """
  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  @doc """
  Loads a binary saved deck from disk.
  """
  def load(filename) do
    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term(binary)
      {:error, _ } -> :error
    end
  end

  @doc """
  Creates a deck, shuffles it, and deals one hand of `hand_size`
  """
  def create_hand(hand_size) do
    Cards.create_deck
    |> Cards.shuffle
    |> Cards.deal(hand_size)
  end
end
