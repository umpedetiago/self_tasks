import 'package:asp/asp.dart';
import 'package:flutter/material.dart';
import 'package:routefly/routefly.dart';
import 'package:self_tasks/app/features/todos/interactor/actions/todos_actions.dart';
import 'package:self_tasks/routes.g.dart';

import '../../features/todos/interactor/atoms/todos_atom.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with HookStateMixin {
  @override
  void initState() {
    super.initState();
    todosAction('getTodos');
  }

  @override
  Widget build(BuildContext context) {
    final todos = useAtomState(todosState);
    final todosDetailsError = useAtomState(todosStateDerailsError);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Self Tasks',
            style: TextStyle(fontWeight: FontWeight.w900)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      'Item ${todos[index].title}',
                      style: const TextStyle(fontWeight: FontWeight.w700),
                    ),
                    onTap: () {
                      Routefly.push(routePaths.home.todosDetails);
                      todosDetailsAction(todos[index]);
                      if (todosDetailsError.message.isNotEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(todosDetailsError.message),
                        ));
                      }
                    },
                    leading: IconButton(
                      onPressed: () {
                        todosCompletedAction(todos[index]);
                      },
                      icon: todos[index].completed
                          ? const Icon(Icons.check_box, color: Colors.green)
                          : const Icon(Icons.check_box_outline_blank),
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        todosFavoriteAction(todos[index]);
                      },
                      icon: todos[index].isFavorite
                          ? const Icon(Icons.star, color: Colors.yellow)
                          : const Icon(Icons.star_border_outlined),
                    ),
                  );
                },
                itemCount: todos.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
