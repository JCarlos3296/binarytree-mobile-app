import 'dart:io';

import 'package:binarytree_mobile_app/logic/Nodo.dart';
import 'package:binarytree_mobile_app/logic/stack.dart';

class ExpressionTree {
  bool isOperator(String c) {
    if (c == '+' || c == '-' || c == '*' || c == '/' || c == '^') {
      return true;
    }
    return false;
  }

  void inorder(Nodo t) {
    if (t != null) {
      inorder(t.left);
      print(t.value + " ");
      inorder(t.right);
    }
  }

  Nodo constructTree(List<String> postfix) {
    Stack<Nodo> st = new Stack<Nodo>();
    Nodo t, t1, t2;

    for (int i = 0; i < postfix.length; i++) {
      if (!isOperator(postfix[i])) {
        t = new Nodo(postfix[i]);
        st.push(t);
      } else {
        t = new Nodo(postfix[i]);
        t1 = st.pop();
        t2 = st.pop();

        t.right = t1;
        t.left = t2;

        st.push(t);
      }
    }

    t = st.peek();
    st.pop();

    return t;
  }

  void printBinaryTree(Nodo root, int level){
    if(root==null)
      return;
    printBinaryTree(root.right, level+1);
    if(level!=0){
      for(int i=0;i<level-1;i++)
        stdout.write("|\t");
        print("|-------"+root.value);
    }
    else
    print(root.value);
    printBinaryTree(root.left, level+1);
  }
}
