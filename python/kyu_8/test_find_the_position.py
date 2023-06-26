def position(input):
    alphabet = [chr(x) for x in range(97, 123)]
    counter = 1

    for letter in alphabet:
        if letter == input:
            return f"Position of alphabet: {counter}"
        else:
            counter = counter + 1


########
# TEST #
########


def test_answer():
    assert position("a") == "Position of alphabet: 1"
    assert position("b") == "Position of alphabet: 2"
