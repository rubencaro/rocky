defmodule RockyTest do
  use ExUnit.Case
  doctest Rocky

  test "greets the world" do
    assert Rocky.hello() == :world
  end
end
