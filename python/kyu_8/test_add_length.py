def add_length(str_):
    return ["{} {}".format(i, len(i)) for i in str_.split(" ")]


def test_answer():
    assert add_length("apple ban") == ["apple 5", "ban 3"]


