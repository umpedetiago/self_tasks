import 'package:flutter/material.dart';
import 'package:routefly/routefly.dart';
import 'package:self_tasks/routes.g.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey),
        useMaterial3: true,
      ),
      routerConfig: Routefly.routerConfig(routes: routes),
    );
  }
}
