defmodule LeetCode.AddTwoNumbers.Solution do
  @spec run(l1 :: [integer], l2 :: integer) :: [integer]
  def run(l1, l2) do
    process(l1, l2) |> Enum.reverse()
  end

  @spec process(l1 :: [integer], l2 :: [integer], overflow :: integer, result :: [integer]) :: [
          integer
        ]
  defp process(_l1, _l2, overflow \\ 0, result \\ [])
  defp process([], [], 0, result), do: result
  defp process([], [], overflow, result), do: [overflow | result]
  defp process(l1, [], overflow, result), do: process(l1, [0], overflow, result)
  defp process([], l2, overflow, result), do: process(l2, [0], overflow, result)

  defp process([n1 | t1], [n2 | t2], overflow, result) do
    sum = n1 + n2 + overflow
    process(t1, t2, div(sum, 10), [rem(sum, 10) | result])
  end
end
