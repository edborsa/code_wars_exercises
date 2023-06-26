# content of test_sample.py
def get_middle(input):
    divmod()
    char_list = []
    char_list[:] = input
    len_char_list = len(char_list)
    if len_char_list % 2 == 0:
        return f"{char_list[round(len_char_list / 2) - 1]}{char_list[round(len_char_list / 2)]}"
    else:
        return f"{char_list[round(len_char_list / 2 - 0.1)]}"


""" quocient, remainder = divmod(len(input), 2) """
""" return input[index] if remainder else input[index - 1 : index + 1] """

########
# TEST #
########


def test_answer():
    assert get_middle("test") == "es"
    assert get_middle("XdwZGYckrOsUw") == "c"
    assert get_middle("testing") == "t"
