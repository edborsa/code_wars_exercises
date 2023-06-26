def second_symbol(s, symbol):
    char_dict = {}
    for index, char in enumerate(s):
        if char in char_dict and char == symbol:
            return index
        else:
            char_dict[char] = 1

    return -1


########
# TEST #
########


def test_answer():
    assert second_symbol("Hello world!!!", "l") == 3
