# content of test_sample.py


def binary_array_to_number(arr):
    arr.reverse()
    counter = 0
    answer = 0
    for num in arr:
        if num == 1:
            answer += pow(2, counter)
        counter += 1
    return answer


########
# TEST #
########


def test_answer():
    assert binary_array_to_number([0, 0, 0, 1]) == 1
    assert binary_array_to_number([0, 0, 1, 0]) == 2
    assert binary_array_to_number([1, 1, 1, 1]) == 15
    assert binary_array_to_number([0, 1, 1, 0]) == 6
