import 'package:asp/asp.dart';
import 'package:flutter/material.dart';
import 'package:routefly/routefly.dart';
import 'package:self_tasks/app/features/login/interector/actions/login_actions.dart';
import 'package:self_tasks/app/features/login/interector/atom/login_atom.dart';
import 'package:self_tasks/routes.g.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with HookStateMixin {
  @override
  Widget build(BuildContext context) {
    final obscure = useAtomState(obscurePassword);
    final isLogged = useAtomState(loginState);
    final loginError = useAtomState(loginStateError);
    String userName = '';
    String password = '';
    if (isLogged) {
      Routefly.navigate(routePaths.home.path);
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              onChanged: (value) {
                userName = value;
              },
              decoration: InputDecoration(
                label: const Text('User'),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                prefix: const Icon(
                  Icons.person,
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              onChanged: (value) {
                password = value;
              },
              decoration: InputDecoration(
                label: const Text('Password'),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                suffix: IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: obscurePasswordAction.call,
                    icon: obscure
                        ? const Icon(
                            Icons.visibility_off,
                          )
                        : const Icon(
                            Icons.visibility,
                          )),
                prefix: const Icon(
                  Icons.lock,
                ),
              ),
              obscureText: obscure,
            ),
            const SizedBox(height: 32),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  final credentials = (userName: userName, password: password);
                  loginAction(credentials);

                  if (loginError.message.isNotEmpty && isLogged == false) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(loginError.message),
                      ),
                    );
                  }
                },
                child: const Text(
                  'Login',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
