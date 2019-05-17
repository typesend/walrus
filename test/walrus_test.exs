defmodule WalrusTest do
  use ExUnit.Case
  doctest Walrus

  test "greets the world" do
    assert Walrus.hello() == :world
  end
end
