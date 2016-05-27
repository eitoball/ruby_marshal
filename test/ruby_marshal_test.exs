defmodule RubyMarshalTest do
  use ExUnit.Case
  doctest RubyMarshal

  test "load nil" do
    assert RubyMarshal.load(<<4, 8, 48>>) == nil
  end

  test "load true" do
    assert RubyMarshal.load(<<4, 8, 84>>) == true
  end

  test "load false" do
    assert RubyMarshal.load(<<4, 8, 70>>) == false
  end

  test "load Fixnum 0" do
    assert RubyMarshal.load(<<4, 8, 105, 0>>) == 0
  end

  test "load Fixnum 1" do
    assert RubyMarshal.load(<<4, 8, 105, 6>>) == 1
  end

  test "load Fixnum 122" do
    assert RubyMarshal.load(<<4, 8, 105, 127>>) == 122
  end

  test "load Fixnum -1" do
    assert RubyMarshal.load(<<4, 8, 105, 250>>) == -1
  end

  test "load Fixnum -123" do
    assert RubyMarshal.load(<<4, 8, 105, 128>>) == -123
  end

  test "load Fixnum 123" do
    assert RubyMarshal.load(<<4, 8, 105, 1, 123>>) == 123
  end

  test "load Fixnum 255" do
    assert RubyMarshal.load(<<4, 8, 105, 1, 255>>) == 255
  end

  test "load Fixnum 256" do
    assert RubyMarshal.load(<<4, 8, 105, 2, 0, 1>>) == 256
  end

  test "load Fixnum 65535" do
    assert RubyMarshal.load(<<4, 8, 105, 2, 255, 255>>) == 65535
  end

  test "load Fixnum 65536" do
    assert RubyMarshal.load(<<4, 8, 105, 3, 0, 0, 1>>) == 65536
  end

  test "load Fixnum 16777215" do
    assert RubyMarshal.load(<<4, 8, 105, 3, 255, 255, 255>>) == 16777215
  end

  test "load Fixnum 16777216" do
    assert RubyMarshal.load(<<4, 8, 105, 4, 0, 0, 0, 1>>) == 16777216
  end

  test "load Fixnum 4294967295" do
    assert RubyMarshal.load(<<4, 8, 105, 4, 255, 255, 255, 255>>) == 4294967295
  end

  test "load Fixnum -124" do
    assert RubyMarshal.load(<<4, 8, 105, 255, 132>>) == -124
  end

  test "load Fixnum -256" do
    assert RubyMarshal.load(<<4, 8, 105, 255, 0>>) == -256
  end

  test "load Fixnum -257" do
    assert RubyMarshal.load(<<4, 8, 105, 254, 255, 254>>) == -257
  end

  test "load Fixnum -65536" do
    assert RubyMarshal.load(<<4, 8, 105, 254, 0, 0>>) == -65536
  end

  test "load Fixnum -65537" do
    assert RubyMarshal.load(<<4, 8, 105, 253, 255, 255, 254>>) == -65537
  end

  test "load Fixnum -16777216" do
    assert RubyMarshal.load(<<4, 8, 105, 253, 0, 0, 0>>) == -16777216
  end

  test "load Fixnum -16777217" do
    assert RubyMarshal.load(<<4, 8, 105, 252, 255, 255, 255, 254>>) == -16777217
  end

  test "load Fixnum -4294967296" do
    assert RubyMarshal.load(<<4, 8, 105, 252, 0, 0, 0, 0>>) == -4294967296
  end
end
