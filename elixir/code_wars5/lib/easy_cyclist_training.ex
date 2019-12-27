defmodule EasyCyclistTraining do
  @gravity_acc 9.81 * 3.6 * 60.0
  @drag 60.0 * 0.3 / 3.6
  @delta_t 1.0 / 60.0
  @d_watts 0.5
  @g_thrust 60.0 * 3.6 * 3.6
  @mass 80.0
  @watts0 225

  defp temps_aux(v, _, _, _, _, _) when v - 3.0 <= 1.0e-2 do
    -1
  end

  defp temps_aux(_, _, d_tot, d, t, _) when d > d_tot do
    round(t)
  end

  defp temps_aux(v, slope, d_tot, d, t, watts) do
    slopeGravityAcc = -1 * @gravity_acc * :math.sin(:math.atan(slope / 100.0))
    tt = t + @delta_t
    wwatts = watts - @d_watts * @delta_t
    gamma = slopeGravityAcc - @drag * abs(v) * abs(v) / @mass

    ggamma =
      if wwatts > 0.0 && v > 0.0 do
        gamma + @g_thrust * wwatts / (v * @mass)
      else
        gamma
      end

    vv =
      if abs(ggamma) <= 1.0e-5 do
        v
      else
        v + ggamma * @delta_t
      end

    dd = d + v * @delta_t / 60.0
    temps_aux(vv, slope, d_tot, dd, tt, wwatts)
  end

  def temps(v, slope, d_tot) do
    temps_aux(v, slope, d_tot, 0.0, 0.0, @watts0)
  end
end
