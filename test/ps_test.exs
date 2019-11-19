defmodule PSTest do
  use ExUnit.Case
  doctest PS

  test "greets the world" do
    assert PS.hello() == :world
  end
end
