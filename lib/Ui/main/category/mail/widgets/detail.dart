import 'package:flutter/material.dart';

class Detailpage extends StatelessWidget {
  const Detailpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detail Page")),
      body: Center(
        child: Text("This is the detail page", style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
