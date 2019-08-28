defmodule LeetCode.LongestSubstringWithoutRepeatingCharacters.Solution do
  def run(s) do
    process(s)
  end

  @spec process(str :: String.t()) :: integer
  defp process(str) when is_binary(str), do: process(String.to_charlist(str))

  @spec process(
          list :: charlist,
          map :: %{required(integer) => integer},
          left :: integer,
          curr :: integer,
          length :: integer
        ) :: integer
  defp process(_, map \\ %{}, left \\ 0, curr \\ 0, length \\ 0)
  defp process([], _, _, _, length), do: length

  defp process([n | rest], map, left, curr, length) do
    i = Map.get(map, n) || -1
    new_map = Map.put(map, n, curr)
    new_left = Enum.max([i + 1, left])
    new_length = Enum.max([length, curr - new_left + 1])
    process(rest, new_map, new_left, curr + 1, new_length)
  end
end
