defmodule ConsecutiveKPrimesTest do
  use ExUnit.Case

  defp dotest(numtest, k, arr, sol) do
    IO.puts("Test #{numtest}")
    assert ConsecutiveKPrimes.consec_Kprimes(k, arr) == sol
  end

  test "multiple/1" do
    assert ConsecutiveKPrimes.multiples(10) == [2, 5]
  end

  test "consec_Kprimes" do
    dotest(
      1,
      2,
      [
        10081,
        10071,
        10077,
        10065,
        10060,
        10070,
        10086,
        10083,
        10078,
        10076,
        10089,
        10085,
        10063,
        10074,
        10068,
        10073,
        10072,
        10075
      ],
      2
    )

    dotest(2, 6, [10064], 0)
    dotest(3, 1, [10054, 10039, 10053, 10051, 10047, 10043, 10037, 10034], 0)

    dotest(
      4,
      3,
      [10158, 10182, 10184, 10172, 10179, 10168, 10156, 10165, 10155, 10161, 10178, 10170],
      5
    )

    dotest(
      5,
      2,
      [10110, 10102, 10097, 10113, 10123, 10109, 10118, 10119, 10117, 10115, 10101, 10121, 10122],
      7
    )
  end
end
