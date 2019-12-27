defmodule DurationFormater do
  def format_final(str) do
    {last, prior} =
      str
      |> String.split(",")
      |> Enum.map(&String.trim(&1))
      |> Enum.filter(fn x -> x != "" end)
      |> List.pop_at(-1)

    case prior do
      [] ->
        last

      _ ->
        Enum.join(prior, ", ") <> " and " <> last
    end
  end

  def format_duration(0), do: "now"

  def format_duration(n) do
    (case div(n, 60 * 60 * 24 * 365) do
       0 ->
         ""

       1 ->
         "1 year, "

       years ->
         "#{years} years, "
     end <>
       case rem(n, 60 * 60 * 24 * 365) |> div(60 * 60 * 24) do
         0 ->
           ""

         1 ->
           "1 day, "

         days ->
           "#{days} days, "
       end <>
       case rem(n, 60 * 60 * 24 * 365) |> rem(60 * 60 * 24) |> div(60 * 60) do
         0 ->
           ""

         1 ->
           "1 hour, "

         hours ->
           "#{hours} hours, "
       end <>
       case rem(n, 60 * 60 * 24 * 365) |> rem(60 * 60 * 24) |> rem(60 * 60) |> div(60) do
         0 ->
           ""

         1 ->
           "1 minute,"

         minutes ->
           "#{minutes} minutes, "
       end <>
       case rem(n, 60 * 60 * 24 * 365)
            |> rem(60 * 60 * 24)
            |> rem(60 * 60)
            |> rem(60) do
         0 ->
           ""

         1 ->
           "1 second"

         seconds ->
           "#{seconds} seconds, "
       end)
    |> format_final()
  end
end

# """
# defmodule DurationFormatter do
#   @time_units [
#     year:   60 * 60 * 24 * 365,
#     day:    60 * 60 * 24,
#     hour:   60 * 60,
#     minute: 60,
#     second: 1
#   ]
#
#   def format_duration(0), do: "now"
#   def format_duration(s) do
#     @time_units
#     |> Enum.map_reduce(s, fn {unit, v}, s -> {{unit, div(s, v)}, rem(s, v)} end)
#     |> elem(0)
#     |> Enum.filter(fn {_unit, n} -> n > 0 end)
#     |> Enum.map_join(", ", &pluralize/1)
#     |> String.replace(~r/, (?!.*, )/, " and ")
#   end
#
#   defp pluralize({unit, 1}), do: "1 #{unit}"
#   defp pluralize({unit, n}), do: "#{n} #{unit}s"
# end
# """
