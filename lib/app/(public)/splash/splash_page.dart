import 'package:flutter/material.dart';
import 'package:routefly/routefly.dart';
import 'package:self_tasks/routes.g.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller)
      ..addListener(() {
        setState(() {});
      });

    _controller.forward();

    _controller.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        await Routefly.navigate(routePaths.login);
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Center(
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Opacity(
                opacity: _animation.value,
                child: const SizedBox(
                  width: 200,
                  height: 200,
                  child: Text('Self Tasks',
                      style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 75,
                          fontFamily: AutofillHints.creditCardSecurityCode)),
                ));
          },
        ),
      ),
    );
  }
}
