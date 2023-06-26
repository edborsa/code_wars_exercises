# content of test_sample.py
def alternate_case(str):
    answer = ""
    for letter in str:
        if ord(letter) in range(ord("a"), ord("z")):
            answer += chr(ord(letter) - 32)
        elif ord(letter) in range(ord("A"), ord("Z")):
            answer += chr(ord(letter) + 32)
        else:
            answer += letter
    return answer


########
# TEST #
########


def test_answer():
    assert alternate_case("ABC") == "abc"
