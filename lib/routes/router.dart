import 'package:go_router/go_router.dart';

import '../pages/pages.dart';

final router = GoRouter(
  initialLocation: '/',
  debugLogDiagnostics: true,
  urlPathStrategy: UrlPathStrategy.path,
  routes: [
    GoRoute(
      path: '/',
      name: 'home',
      builder: (context, state) => const HomePage(),
      routes: [
        GoRoute(
          path: 'product/:pid',
          name: 'product',
          builder: (context, state) => ProductPage(pid: state.params['pid']),
        ),
        GoRoute(
          path: 'product/:pid/details',
          name: 'details',
          builder: (context, state) => DetailsPage(
            pid: state.params['pid'],
          ),
        ),
      ],
    ),
  ],
  errorBuilder: (context, state) => const ErrorPage(),
);
