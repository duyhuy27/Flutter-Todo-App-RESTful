import 'package:flutter/material.dart';
import 'package:todo_app_api/screen/add_todo.dart';
import 'package:todo_app_api/service/todo_service.dart';
import 'package:todo_app_api/utils/snack_bars.dart';
import 'package:todo_app_api/widget/todo_Cart.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({super.key});

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  @override
  void initState() {
    super.initState();
    fetchTodo();
  }

  List items = [];
  bool isLoad = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
      ),
      body: Visibility(
        visible: isLoad,
        replacement: RefreshIndicator(
          onRefresh: fetchTodo,
          child: Visibility(
            visible: items.isNotEmpty,
            replacement: Center(
              child: Text(
                'No Todo Item',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index] as Map;
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ToDoCard(
                      index: index,
                      item: item,
                      navigateToEditPage: navigateToEditPage,
                      deleteById: deleteById),
                );
              },
            ),
          ),
        ),
        child: const Center(
          child: CircularProgressIndicator(
            color: Colors.blue,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: navigateToAddPage,
        label: const Text('Add New Task'),
        backgroundColor: Colors.blue,
      ),
    );
  }

  Future<void> navigateToAddPage() async {
    final route = MaterialPageRoute(
      builder: (context) => AddTodoPage(),
    );
    await Navigator.push(context, route);
    setState(() {
      isLoad = true;
    });
    fetchTodo();
  }

  Future<void> navigateToEditPage(Map item) async {
    final route = MaterialPageRoute(
      builder: (context) => AddTodoPage(todo: item),
    );
    await Navigator.push(context, route);
    setState(() {
      isLoad = true;
    });
    fetchTodo();
  }

  Future<void> fetchTodo() async {
    final reponse = await ToDoService.fetchTodo();

    if (reponse != null) {
      setState(() {
        items = reponse;
      });
    } else {}

    setState(() {
      isLoad = false;
    });
  }

  Future<void> deleteById(String id) async {
    final result = await ToDoService.deleteById(id);

    if (result) {
      //TODO remove item from the list
      final fillterd = items.where((element) => element['_id'] != id).toList();
      setState(() {
        items = fillterd;
      });
      // ignore: use_build_context_synchronously
      showSuccessfullyMessage(context,
          message: 'Delete Successfully the task !');
    } else {
      //ERROR show error message for user
      // ignore: use_build_context_synchronously
      showErrorMessage(context,
          message: 'Delete the task faied ! Please try again');
    }
  }
}
