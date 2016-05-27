defmodule RubyMarshal do
  def load(<<4, 8, 48>>), do: nil
  def load(<<4, 8, 84>>), do: true
  def load(<<4, 8, 70>>), do: false

  def load(<<4, 8, 105, _::binary>> = src), do: load_fixnum(src)

  defp load_fixnum(<<4, 8, 105, n::signed-size(8)>>) when n == 0, do: 0
  defp load_fixnum(<<4, 8, 105, n::signed-size(8)>>) when n in 6..127, do: n - 5
  defp load_fixnum(<<4, 8, 105, n::signed-size(8)>>) when n in -128..-1, do: n + 5
  defp load_fixnum(<<4, 8, 105, 1, n::unsigned-size(8)>>), do: n
  defp load_fixnum(<<4, 8, 105, 2, n::little-unsigned-size(16)>>), do: n
  defp load_fixnum(<<4, 8, 105, 3, n::little-unsigned-size(24)>>), do: n
  defp load_fixnum(<<4, 8, 105, 4, n::little-unsigned-size(32)>>), do: n
  defp load_fixnum(<<4, 8, 105, 255, n::unsigned-size(8)>>), do: n - 0x100
  defp load_fixnum(<<4, 8, 105, 254, n::little-unsigned-size(16)>>), do: n - 0x10000
  defp load_fixnum(<<4, 8, 105, 253, n::little-unsigned-size(24)>>), do: n - 0x1000000
  defp load_fixnum(<<4, 8, 105, 252, n::little-unsigned-size(32)>>), do: n - 0x100000000
end
