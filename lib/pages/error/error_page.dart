import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page not found'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: const Text('Page not found'),
      ),
    );
  }
}
