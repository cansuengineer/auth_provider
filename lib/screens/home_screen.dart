import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CRUD"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        alignment: Alignment.center,
        margin: EdgeInsets.all(5),
        child: Column(
          children: [Text("Anket ekle")],
        ),
      ),
    );
  }
}
