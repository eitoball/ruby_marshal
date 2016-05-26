defmodule RubyMarshal do
  @version_header <<4, 8>>

  def dump(val) when is_nil(val) do
    @version_header <> "0"
  end

  def dump(val) when is_boolean(val) do
    @version_header <> if(val, do: "T", else: "F")
  end
end
