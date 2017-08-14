defmodule CardsTest do
  use ExUnit.Case
  doctest Cards

  test "deck is created" do
    assert length(Cards.create_deck) == 5 * 4
  end

  test "deck is shuffled" do
    deck = Cards.create_deck()
    shuffled = Cards.shuffle(deck)
    assert MapSet.new(deck) == MapSet.new(shuffled)
  end

  test "card contains works" do
    deck = Cards.create_deck()
    elem = Enum.at(deck, 0)
    assert Cards.contains?(deck, elem)
    assert not Cards.contains?(deck, "ElementThatShouldn'tExistInTheDeck")
  end
end
