import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Integrantes'),
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Container(
              height: size.height * 0.65,
              child: Card(
                child: Column(
                  children: [
                    ListTile(title: Text('Luis Pedro Galicia Castro'), subtitle: Text('5190-18-3450'), leading: Icon(Icons.person),),
                    Divider(),
                    ListTile(title: Text('Lourdes Gisele López Ramírez'), subtitle: Text('5190-18-1041'), leading: Icon(Icons.person)),
                    Divider(),
                    ListTile(title: Text('Carlos Alexander Baeza Boror'), subtitle: Text('5190-11-4867'), leading: Icon(Icons.person)),
                    Divider(),
                    ListTile(title: Text('Brian Josué Archila Hiemann'), subtitle: Text('5190-15-3293'), leading: Icon(Icons.person)),
                    Divider(),
                    ListTile(title: Text('Omar Stuardo Romero Abad'), subtitle: Text('5390-18-9822'), leading: Icon(Icons.person)),
                    Divider(),
                  ],
                ),
              ),
            )
          ),
        ),
      ),
    );
  }
}
