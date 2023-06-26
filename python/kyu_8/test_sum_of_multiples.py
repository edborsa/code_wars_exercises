def sum_mul(lower_boundary, upper_boundary):
    if lower_boundary > 0 and upper_boundary > 0:
        return sum(range(lower_boundary, upper_boundary, lower_boundary))
    else:
        return "INVALID"


def test_answer():
    assert sum_mul(2, 9) == 20
    assert sum_mul(0, 0) == "INVALID"
    assert sum_mul(4, -7) == "INVALID"
