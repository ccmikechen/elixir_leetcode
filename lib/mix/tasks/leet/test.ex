defmodule Mix.Tasks.Leet.Test do
  use Mix.Task

  alias LeetCode.Test.Result

  @impl Mix.Task
  def run([module | []]) do
    test_module =
      LeetCode
      |> Module.concat(module)
      |> Module.concat(Test)

    case test_module.test() do
      %Result{total: total, passed: passed, runtime: runtime, failed: nil} ->
        Mix.shell().info("#{passed} / #{total} test cases passed.\n")
        Mix.shell().info("Average Runtime: #{round(runtime)} μs\n")

      %Result{total: total, passed: passed, failed: failed} ->
        Mix.shell().info("#{passed} / #{total} test cases passed.\n")
        Mix.shell().error("Input:\n")

        Enum.each(failed.input, fn arg ->
          Mix.shell().error("  #{inspect(arg)}")
        end)

        Mix.shell().error("\nOutput:\n")
        Mix.shell().error("  #{inspect(failed.output)}\n")
        Mix.shell().error("Expected:\n")
        Mix.shell().error("  #{inspect(failed.expected)}\n")
    end
  end
end
