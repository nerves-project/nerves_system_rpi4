defmodule TestTest do
  use ExUnit.Case
  doctest Test

  test "greets the world" do
    assert Test.hello() == :world
  end
end
