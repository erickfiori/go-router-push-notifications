import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_mobile/main.dart';
import 'package:go_router_mobile/services/notifications/custom_notification.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text('Product Page'),
              onPressed: () => context.pushNamed('product', params: {'pid': '123'}),
            ),
            ElevatedButton(
              child: const Text('Show Notification'),
              onPressed: () {
                setState(() {
                  notificationsService.showNotification(
                    CustomNotification(
                      id: 1,
                      title: 'Notification Test',
                      body: 'This is a test for local notifications.',
                      payload: 'product',
                    ),
                  );
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
