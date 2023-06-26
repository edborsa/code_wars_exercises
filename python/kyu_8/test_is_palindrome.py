# content of test_sample.py
def is_palindrome(input):
    return input.lower() == input[::-1].lower()


########
# TEST #
########


def test_answer():
    assert is_palindrome("Aba") == True
