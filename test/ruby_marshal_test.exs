defmodule RubyMarshalTest do
  use ExUnit.Case
  doctest RubyMarshal

  test "dump nil" do
    assert RubyMarshal.dump(nil) == "\x04\b0"
  end

  test "dump true" do
    assert RubyMarshal.dump(true) == "\x04\bT"
  end

  test "dump false" do
    assert RubyMarshal.dump(false) == "\x04\bF"
  end
end
