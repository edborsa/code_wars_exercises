class Node(object):
    def __init__(self, data):
        self.data = data
        self.next = None


def get_nth(node, index):
    curr_index = 0
    while node:
        if curr_index == index:
            return node
        curr_index += 1
        node = node.next

    raise ValueError


""" def get_nth(node, index): """
"""   if node and index >= 0: return node if index < 1 else get_nth(node.next, index - 1) """
"""   raise ValueError """


########
# TEST #
########


def test_answer():
    node1 = Node(1)
    node2 = Node(2)
    node3 = Node(3)
    node1.next = node2
    node2.next = node3
    assert get_nth(node1, 0).data == 1
    assert get_nth(node1, 1).data == 2
