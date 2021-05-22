import 'dart:collection';

class Stack<T> {

  final _stack  = Queue<T>();

  int get length => _stack.length;

  void push(T element) {
    _stack.addLast(element);
  }

  T pop() {
    final T lastElement = _stack.last;
    _stack.removeLast();
    return lastElement;
  }

  T peek() => _stack.last;

  void clear() {
    _stack.clear();
  }

  bool get isEmpty => _stack.isEmpty;

}