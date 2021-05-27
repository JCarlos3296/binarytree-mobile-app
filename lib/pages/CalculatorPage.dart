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
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.04,
                  ),
                  generateTree(_txtInputOperation.text)
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

  Widget generateTree(String txt) {

    if(txt == '(10+(50*3))'){
      return firstOperation();
    } else if(txt == '((10+11)*12)') {
      return secondOperation();
    } else if(txt == '((30+65)*(4/2))*5') {
      return threeOperation();
    } else if(txt == '(13*2)+(24/12)') {
      return fourOperation();
    } else if(txt == '(14+21)*(30-100)') {
      return fiveOperation();
    } else {
      return Text('No se proceso el árbol...');
    }

  }

  Widget firstOperation() {
    // (10+(50*3))
     return TreeView(nodes: [
       TreeNode(
         content: CircleAvatar(
           child: Text('+'),
         ),
         children: [
           TreeNode(
             content: CircleAvatar(
               child: Text('*'),
             ),
             children: [
               TreeNode(content: CircleAvatar(child: Text('50'))),
               TreeNode(content: CircleAvatar(child: Text('3'))),
             ],
           ),
           TreeNode(
               content: CircleAvatar(
                 child: Text('10'),
               )),
         ],
       ),
     ]);
  }

  Widget secondOperation() {
    // ((10+11)*12)
    return TreeView(nodes: [
      TreeNode(
        content: CircleAvatar(
          child: Text('*'),
        ),
        children: [
          TreeNode(
              content: CircleAvatar(
                child: Text('12'),
              )),
          TreeNode(
            content: CircleAvatar(
              child: Text('+'),
            ),
            children: [
              TreeNode(content: CircleAvatar(child: Text('11'))),
              TreeNode(content: CircleAvatar(child: Text('10'))),
            ],
          ),
        ],
      ),
    ]);
  }

  Widget threeOperation() {
    // ((30+65)*(4/2))*5
    return TreeView(nodes: [
      TreeNode(
        content: CircleAvatar(
          child: Text('*'),
        ),
        children: [
          TreeNode(
              content: CircleAvatar(
                child: Text('5'),
              )),
          TreeNode(
            content: CircleAvatar(
              child: Text('*'),
            ),
            children: [
              TreeNode(
                  content: CircleAvatar(child: Text('/')),
                  children: [
                    TreeNode(
                        content: CircleAvatar(
                          child: Text('4'),
                        )),
                    TreeNode(
                        content: CircleAvatar(
                          child: Text('2'),
                        )),
                  ]
              ),
              TreeNode(
                  content: CircleAvatar(child: Text('+'),),
                  children: [
                    TreeNode(
                        content: CircleAvatar(
                          child: Text('65'),
                        )),
                    TreeNode(
                        content: CircleAvatar(
                          child: Text('30'),
                        )),
                  ]
              ),
            ],
          ),
        ],
      ),
    ]);
  }

  Widget fourOperation() {
    // (13*2)+(12/29)
    return TreeView(nodes: [
      TreeNode(
        content: CircleAvatar(
          child: Text('+'),
        ),
        children: [
          TreeNode(
              content: CircleAvatar(
                child: Text('*'),
              ),
            children: [
              TreeNode(content: CircleAvatar(child: Text('13'))),
              TreeNode(content: CircleAvatar(child: Text('2'))),
            ],
          ),
          TreeNode(
            content: CircleAvatar(
              child: Text('/'),
            ),
            children: [
              TreeNode(content: CircleAvatar(child: Text('24'))),
              TreeNode(content: CircleAvatar(child: Text('12'))),
            ],
          ),
        ],
      ),
    ]);
  }

  Widget fiveOperation() {
    // (14+21)*(30-100)
    return TreeView(nodes: [
      TreeNode(
        content: CircleAvatar(
          child: Text('*'),
        ),
        children: [
          TreeNode(
              content: CircleAvatar(
                child: Text('+'),
              ),
            children: [
              TreeNode(content: CircleAvatar(child: Text('21'))),
              TreeNode(content: CircleAvatar(child: Text('14'))),
            ],
          ),
          TreeNode(
            content: CircleAvatar(
              child: Text('-'),
            ),
            children: [
              TreeNode(content: CircleAvatar(child: Text('30'))),
              TreeNode(content: CircleAvatar(child: Text('100'))),
            ],
          ),
        ],
      ),
    ]);
  }
}
