import 'package:asp/asp.dart';
import 'package:flutter/material.dart';
import 'package:self_tasks/app/features/todos/interactor/actions/todos_actions.dart';
import 'package:self_tasks/app/features/todos/interactor/atoms/todos_atom.dart';

class TodosDetailsPage extends StatefulWidget {
  const TodosDetailsPage({super.key});

  @override
  State<TodosDetailsPage> createState() => _TodosDetailsPageState();
}

class _TodosDetailsPageState extends State<TodosDetailsPage>
    with HookStateMixin {
  @override
  Widget build(BuildContext context) {
    final todos = useAtomState(todosStateDetails);
    final loading = useAtomState(todosStateLoading);
    if (todos == null) {
      return Scaffold(
        appBar: AppBar(),
        body: const Center(
          child: Text('Todos not found'),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              todosDetailsFavoriteAction(todos);
            },
            icon: todos.isFavorite
                ? const Icon(Icons.star, color: Colors.yellow)
                : const Icon(Icons.star_border),
          ),
        ],
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Self Tasks',
            style: TextStyle(fontWeight: FontWeight.w900)),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(todos.title,
                    style: const TextStyle(fontWeight: FontWeight.w700)),
                const SizedBox(height: 8),
                Text(todos.body ?? 'Post body not found'),
              ],
            ),
          ),
          loading
              ? Container(
                  color: Colors.grey[200],
                  child: const Center(child: CircularProgressIndicator()))
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
