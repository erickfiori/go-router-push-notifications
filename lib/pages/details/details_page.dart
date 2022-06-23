import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key, this.pid}) : super(key: key);

  final String? pid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details Page'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Text(pid ?? 'Details not found'),
      ),
    );
  }
}
