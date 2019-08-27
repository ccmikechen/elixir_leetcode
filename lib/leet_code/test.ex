defmodule LeetCode.Test do
  defmacro __using__(module: module) do
    quote do
      import LeetCode.Test, only: [test_cases: 1]
      @module unquote(module)
    end
  end

  defmacro test_cases(data) do
    quote do
      @spec test() :: LeetCode.Test.Result.t()
      def test do
        result =
          Enum.reduce(
            unquote(data),
            %LeetCode.Test.Result{},
            fn {input, expected}, result ->
              {runtime, output} = :timer.tc(fn -> apply(@module, :run, input) end)

              cond do
                output == expected ->
                  %LeetCode.Test.Result{
                    result
                    | total: result.total + 1,
                      passed: result.passed + 1,
                      runtime: result.runtime + runtime
                  }

                true ->
                  case result do
                    %{failed: nil} ->
                      %{
                        result
                        | failed: %{
                            input: input,
                            output: output,
                            expected: expected
                          }
                      }

                    _ ->
                      result
                  end
                  |> Map.merge(%{total: result.total + 1})
              end
            end
          )

        case result do
          %{failed: nil} ->
            %LeetCode.Test.Result{result | runtime: result.runtime / result.total}

          _ ->
            %LeetCode.Test.Result{result | runtime: nil}
        end
      end
    end
  end
end
