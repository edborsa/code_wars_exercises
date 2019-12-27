defmodule ReverseInsideParentheses do
  def reverse_in_parens(test) do
    String.graphemes(test)
    |> Enum.reduce({:forward, "", []}, &process/2)
    |> case do
      {:forward, output, []} -> output
    end
  end

  defp process("(", {:forward, output, stack}) do
    {:backward, "", [output | stack]}
  end

  defp process(")", {:backward, reversed, [output | stack]}) do
    {:forward, output <> "(" <> reversed <> ")", stack}
  end

  defp process("(", {:backward, reversed, stack}) do
    {:forward, "", [reversed | stack]}
  end

  defp process(")", {:forward, forward, [reversed | stack]}) do
    {:backward, "(" <> forward <> ")" <> reversed, stack}
  end

  defp process(c, {:forward, output, stack}) do
    {:forward, output <> c, stack}
  end

  defp process(c, {:backward, output, stack}) do
    {:backward, c <> output, stack}
  end
end
