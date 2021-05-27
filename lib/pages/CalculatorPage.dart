import 'package:binarytree_mobile_app/logic/Nodo.dart';
import 'package:binarytree_mobile_app/logic/expressionTree.dart';
import 'package:binarytree_mobile_app/logic/operations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_simple_treeview/flutter_simple_treeview.dart';
import 'package:lottie/lottie.dart';

class CalculatorPage extends StatefulWidget {
  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  final _txtInputOperation = TextEditingController();
  int total = 0;

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Arbol Binario'),
        actions: [
          IconButton(
              icon: Icon(Icons.people_alt_sharp),
              onPressed: () {
                Navigator.pushNamed(context, '/info');
              })
        ],
      ),
      body: SafeArea(
        child: Container(
            padding: EdgeInsets.only(
                left: size.height * 0.05, right: size.height * 0.05),
            height: size.height,
            width: size.width,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: size.height * 0.04,
                  ),
                  Text(
                    'Expresión',
                    textAlign: TextAlign.left,
                  ),
                  TextFormField(
                    controller: _txtInputOperation,
                    decoration: InputDecoration(
                      hintText: 'Escribe tu expresión',
                    ),
                  ),
                  Text(
                    'Resultado: $total',
                    textAlign: TextAlign.left,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: TextButton(
                          onPressed: () {
                            calculateResult();
                          },
                          child: Text('Resultado'),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: TextButton(
                          onPressed: () {
                            calculateResult();
                          },
                          child: Text('Graficar'),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.04,
                  ),
                  TreeView(nodes: [
                    TreeNode(
                      content: CircleAvatar(
                        child: Text('+'),
                      ),
                      children: [
                        TreeNode(
                          content: CircleAvatar(
                            child: Text('^'),
                          ),
                          children: [
                            TreeNode(content: CircleAvatar(child: Text('60'))),
                            TreeNode(content: CircleAvatar(child: Text('3'))),
                          ],
                        ),
                        TreeNode(
                            content: CircleAvatar(
                              child: Text('10'),
                            )),
                      ],
                    ),
                  ]),
                ],
              ),
            )),
      ),
    );
  }

  void calculateResult() {
    Operation opExec = new Operation();

    int result = opExec.evaluateExpression(_txtInputOperation.text.split(''));

    setState(() {
      total = result;
    });

  }

}
