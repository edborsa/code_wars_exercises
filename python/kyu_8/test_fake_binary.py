def fake_bin(input):
    return "".join("0" if int(c) < 5 else "1" for c in input)


def test_answer():
    assert fake_bin("45385593107843568") == "01011110001100111"
