# content of test_sample.py
def is_anagram(test, original):
    test.lower()
    original.lower()
    arr1 = []
    arr2 = []
    arr1[:] = test
    arr2[:] = original
    return arr1.sort() == arr2.sort()


########
# TEST #
########


def test_answer():
    assert is_anagram("foefet", "toffee") == True
    assert is_anagram("dumble", "dumble") == False
