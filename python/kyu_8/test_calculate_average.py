def find_average(numbers):
    if len(numbers) == 0:
        return 0
    else:
        return sum(numbers) / len(numbers)


def test_answer():
    assert find_average([1, 2, 3]) == 2
    assert find_average([]) == 0
    assert find_average([1, 2]) == 1.5
