import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({Key? key, this.pid}) : super(key: key);

  final String? pid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Page ${pid ?? 'ID Not Found'}'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: ElevatedButton(
          child: const Text('Details Page'),
          onPressed: () => context.pushNamed('details', params: {'pid': pid!}),
        ),
      ),
    );
  }
}
