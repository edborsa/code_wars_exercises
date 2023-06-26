# content of test_sample.py
def is_isogram(string):
    lst = []
    lst[:] = string.lower()
    lst.sort()
    current = -99
    for ch in lst:
        if current == ch:
            return False
        current = ch
    return True


""" return len(string) == len(set(string.lower())) """

""" string = string.lower() """
""" for letter in string: """
"""     if string.count(letter) > 1: return False """
""" return True """

""" #your code here """
"""     char_dict = {} """
"""     string = string.lower() """
"""      """
"""     for char in string: """
"""         if char in char_dict: """
"""             # increment count of this character """
"""             char_dict[char] = char_dict[char] + 1 """
"""         else: """
"""             char_dict[char] = 1 """
"""      """
"""     # loop over the characters in dictionary, if any have """
"""     # more than 1 found, this string is not an isogram, so break """
"""     # the loop and function and return False. """
"""     for key in char_dict: """
"""         if char_dict[key] > 1: """
"""             return False """
"""              """
"""     # If no duplicates were found in the loop directly above, """
"""     # this must be an isogram, so return true! """
"""     return True """

########
# TEST #
########


def test_answer():
    assert is_isogram("Dermatoglyphics") == True
    assert is_isogram("aba") == False
