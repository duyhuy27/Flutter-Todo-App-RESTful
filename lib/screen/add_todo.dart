import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddTodoPage extends StatefulWidget {
  final Map? todo;

  const AddTodoPage({super.key, this.todo});

  @override
  State<AddTodoPage> createState() => _AddTodoPageState();
}

class _AddTodoPageState extends State<AddTodoPage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  bool isEdit = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final todo = widget.todo;
    if (todo != null) {
      isEdit = true;
      final title = todo['title'];
      final description = todo['description'];
      titleController.text = title;
      descriptionController.text = description;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isEdit ? 'Edit Todo' : 'Add New Todo'),
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          TextField(
            controller: titleController,
            decoration: const InputDecoration(hintText: 'Title'),
          ),
          const SizedBox(
            height: 20,
          ),
          TextField(
            controller: descriptionController,
            decoration: const InputDecoration(hintText: 'Description'),
            keyboardType: TextInputType.multiline,
            minLines: 5,
            maxLines: 8,
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: isEdit ? updateData : submitData,
            child: Text(
              isEdit ? 'Update' : 'Submit',
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }

  Future<void> updateData() async {
    //get data from form
    final todo = widget.todo;
    if (todo == null) {
      print('You can not call update without todo data');
      return;
    }
    final id = todo['_id'];
    final is_complete = todo['is_completed'];
    final title = titleController.text;
    final description = descriptionController.text;
    final body = {
      "title": title,
      "description": description,
      "is_completed": false
    };

    //submit update data data to server

    final url = 'http://api.nstack.in/v1/todos/$id';
    final uri = Uri.parse(url);
    final reponse = await http.put(uri,
        body: jsonEncode(body), headers: {'Content-Type': 'application/json'});

    // show success or failed message base on status
    if (reponse.statusCode == 200) {
      showSuccessMessage('Update Task Todo Successfully');
    } else {
      showSuccessMessage('Update Task Todo Failed');
    }
  }

  Future<void> submitData() async {
    //get data from form

    final title = titleController.text;
    final description = descriptionController.text;
    final body = {
      "title": title,
      "description": description,
      "is_completed": false
    };

    //submit data to server

    final url = 'http://api.nstack.in/v1/todos';
    final uri = Uri.parse(url);
    final reponse = await http.post(uri,
        body: jsonEncode(body), headers: {'Content-Type': 'application/json'});

    // show success or failed message base on status
    if (reponse.statusCode == 201) {
      titleController.text = '';
      descriptionController.text = '';
      showSuccessMessage('Create Task Todo Successfully');
    } else {
      showSuccessMessage('Create Task Todo Failed');
    }
  }

  void showSuccessMessage(String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
