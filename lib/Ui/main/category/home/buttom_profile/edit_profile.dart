import 'package:flutter/material.dart';

class edit extends StatelessWidget {
  const edit({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('edit Page')),
      body: const Center(child: Text('This is the edit page.')),
    );
  }
}
