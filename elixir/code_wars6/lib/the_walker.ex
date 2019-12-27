defmodule TheWalker do
  def solve(a, b, c, alpha, beta, gamma) do
    pi = 3.14159265358979323846
    aa = alpha * pi / 180.0
    bb = beta * pi / 180.0
    cc = gamma * pi / 180.0
    x = a * :math.cos(aa) - b * :math.sin(bb) - c * :math.cos(cc)
    y = a * :math.sin(aa) + b * :math.cos(bb) - c * :math.sin(cc)
    r = :math.sqrt(x * x + y * y)
    theta = trunc(:math.acos(x / r) * 180 * 3600 / pi)
    d = div(theta, 3600)
    mm = rem(theta, 3600)
    m = div(mm, 60)
    s = rem(mm, 60)
    [round(r), d, m, s]
  end
end
