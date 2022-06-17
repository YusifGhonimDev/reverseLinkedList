void main() {
  LinkedList linkedList = LinkedList(10);
  print(linkedList.toString());
  linkedList.append(5);
  print(linkedList.toString());
  linkedList.append(16);
  print(linkedList.toString());
  linkedList.prepend(1);
  print(linkedList.toString());
  linkedList.insert(index: 1, value: 2);
  print(linkedList.toString());
  linkedList.remove(1);
  print(linkedList.toString());
  linkedList.reverse();
  print(linkedList.toString());
}

class Node {
  final int value;
  Node? next;

  Node(this.value, {this.next = null});
}

class LinkedList {
  int length = 1;
  final int value;
  Node? head;
  Node? tail;

  LinkedList(this.value) {
    this.head = Node(value);
    this.tail = this.head;
  }

  void append(int value) {
    Node newNode = Node(value);
    this.tail!.next = newNode;
    this.tail = newNode;
    this.length++;
  }

  void prepend(int value) {
    Node newNode = Node(value);
    newNode.next = this.head;
    this.head = newNode;
    this.length++;
  }

  void insert({required int index, required int value}) {
    if (index > this.length) {
      throw Exception('Index out of bounds');
    } else if (index == 0) {
      this.prepend(value);
    } else if (index == this.length) {
      this.append(value);
    } else {
      Node current = this.head!;
      for (int i = 0; i < index - 1; i++) {
        current = current.next!;
      }
      Node newNode = Node(value);
      newNode.next = current.next;
      current.next = newNode;
      this.length++;
    }
  }

  void remove(int index) {
    if (index > this.length) {
      throw Exception('Index out of bounds');
    } else if (index == 0) {
      this.head = this.head!.next;
    } else if (index == this.length - 1) {
      this.tail = this.tail!.next;
    } else {
      Node current = this.head!;
      for (int i = 0; i < index - 1; i++) {
        current = current.next!;
      }
      current.next = current.next!.next;
      this.length--;
    }
  }

  void reverse() {
    Node? previous = null;
    Node? current = this.head;
    while (current != null) {
      Node? next = current.next;
      current.next = previous;
      previous = current;
      current = next;
    }
    this.head = previous;
  }

  @override
  String toString() {
    String result = "";
    Node? current = this.head;
    while (current != null) {
      result += current.value.toString() + "->";
      current = current.next;
    }
    return result;
  }
}
