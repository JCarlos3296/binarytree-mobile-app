import 'package:binarytree_mobile_app/logic/stack.dart';

class Operation {

  String strOp = '';

  int evaluateExpression(List<String> exp) {
    Stack<int> vStack = new Stack<int>();
    Stack<String> opStack = new Stack<String>();

    opStack.push('(');

    int pos = 0;
    while(pos <= exp.length) {
      if(pos == exp.length || exp[pos] == ')') {
        processClosingParenthesis(vStack, opStack);
        pos++;
      } else if(_isNumeric(exp[pos]) && int.parse(exp[pos]) >= 0 && int.parse(exp[pos]) <= 9) {
        pos = processInputNumber(exp, pos, vStack);
      } else {
        processInputOperator(exp[pos], vStack, opStack);
        pos++;
      }
    }

    return vStack.pop();
  }

  void processClosingParenthesis(Stack<int> vStack, Stack<String> opStack) {
    while(opStack.peek() != '(') {
      executeOperation(vStack, opStack);
    }
    opStack.pop();
  }

  int processInputNumber(List<String> exp, int pos, Stack<int> vStack) {
    int value = 0;
    while(pos < exp.length && _isNumeric(exp[pos]) && int.parse(exp[pos]) >= 0 && int.parse(exp[pos]) <= 9) {
      value = 10 * value + (int.parse(exp[pos++]) - 0);
    }
    vStack.push(value);
    return pos;
  }

  void processInputOperator(String op, Stack<int> vStack, Stack<String> opStack) {
    while(opStack.length > 0 && operatorCausesEvaluation(op, opStack.peek())) {
      executeOperation(vStack, opStack);
    }

    opStack.push(op);

  }

  bool operatorCausesEvaluation(String op, String prevOp) {
    bool evaluate = false;
    switch(op) {
      case '+':
      case '-':
        evaluate = (prevOp != '(');
        break;
      case '*':
      case '/':
        evaluate = (prevOp == '*' || prevOp == '/');
        break;
      case ')':
        evaluate = true;
        break;
    }

    return evaluate;
  }

  void executeOperation(Stack<int> vStack, Stack<String>  opStack) {

    int rightOperation = vStack.pop();
    int leftOperand = vStack.pop();
    String op = opStack.pop();

    strOp += '$leftOperand$op$rightOperation|';

    int result = 0;
    print('$leftOperand $op $rightOperation');
    switch(op) {
      case '+':
        result = leftOperand + rightOperation;
        break;
      case '-':
        result = leftOperand - rightOperation;
        break;
      case '*':
        result = leftOperand * rightOperation;
        break;
      case '/':
        result = (leftOperand / rightOperation) as int;
    }

    vStack.push(result);

  }

  bool _isNumeric(String str) {
    if(str == null) {
      return false;
    }
    return double.tryParse(str) != null;
  }

}