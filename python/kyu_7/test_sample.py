# content of test_sample.py
def func(x):
    [].count()
    return x + 1


########
# TEST #
########


def test_answer():
    assert func(4) == 5
