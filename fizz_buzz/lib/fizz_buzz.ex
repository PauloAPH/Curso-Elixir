defmodule FizzBuzz do
  def build(file_name) do
    file_name
    |> File.read()
    |> handle_file_read()
  end

  def fizz_buzz_lenght(l) do

    list = 1..l
    Enum.to_list(list)
    |> Enum.map(&evaluate_numbers/1)
  end

  defp handle_file_read({:ok, result}) do
    result =
      result
      |> String.split(",")
      |> Enum.map(fn n -> convert_and_evaluate_numbers(n) end)
      {:ok, result}
  end

  defp handle_file_read({:error, reason}), do: {:error, "Error reading the file: #{reason}"}


  defp convert_and_evaluate_numbers(elem) do
    elem
    |> String.to_integer()
    |> evaluate_numbers()

  end

  defp evaluate_numbers(number) when rem(number, 3) == 0 and rem(number,5) == 0, do: :Fizzbuzz
  defp evaluate_numbers(number) when rem(number, 3) == 0, do: :Fizz
  defp evaluate_numbers(number) when rem(number, 5) == 0, do: :buzz
  defp evaluate_numbers(number), do: number
end
