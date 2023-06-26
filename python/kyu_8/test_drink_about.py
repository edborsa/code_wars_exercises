def people_with_age_drink(age):
    if age <= 13:
        return "drink toddy"
    if age <= 17:
        return "drink coke"
    if age < 21:
        return "drink beer"
    return "drink whisky"


def test_answer():
    assert people_with_age_drink(13) == "drink toddy"
    assert people_with_age_drink(17) == "drink coke"
    assert people_with_age_drink(18) == "drink beer"
    assert people_with_age_drink(21) == "drink whisky"
