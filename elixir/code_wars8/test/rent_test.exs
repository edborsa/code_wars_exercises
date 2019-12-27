defmodule TestRent do
    use ExUnit.Case
    import Rent, only: [rental_car_cost: 1]

    test "works for under 3 days" do
         assert rental_car_cost(1) == 40
         assert rental_car_cost(2) == 80
        end

    test "works for under 7 days" do
          assert rental_car_cost(3) == 100
          assert rental_car_cost(4) == 140
          assert rental_car_cost(5) == 180
          assert rental_car_cost(6) == 220
        end

    test "works for 7 or more days" do
          assert rental_car_cost(7) == 230
          assert rental_car_cost(8) == 270
          assert rental_car_cost(9) == 310
          assert rental_car_cost(10) == 350
        end
  end
