defmodule LeetCode.TwoSum.Solution do
  @spec run(nums :: [integer], target :: integer) :: [integer]
  def run(nums, target) do
    nums_with_index = Enum.with_index(nums)

    map =
      Enum.reduce(nums_with_index, %{}, fn {num, index}, acc ->
        Map.put(acc, num, index)
      end)

    Enum.reduce(nums_with_index, nil, fn {num, index}, acc ->
      cond do
        acc -> acc
        pair = Map.get(map, target - num) -> [index, pair]
        true -> acc
      end
    end)
  end
end
