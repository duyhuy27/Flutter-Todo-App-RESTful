// ignore: file_names
import 'package:flutter/material.dart';

class ToDoCard extends StatelessWidget {
  final int index;
  final Map item;
  final Function(Map) navigateToEditPage;
  final Function(String) deleteById;
  const ToDoCard(
      {super.key,
      required this.index,
      required this.item,
      required this.navigateToEditPage,
      required this.deleteById});

  @override
  Widget build(BuildContext context) {
    final id = item['_id'] as String;
    return Card(
      color: Colors.grey[900],
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.black,
          child: Text('${index + 1}'),
        ),
        title: Text(item['title']),
        subtitle: Text(item['description']),
        trailing: PopupMenuButton(onSelected: (value) {
          if (value == 'edit') {
            //TODO open edit page
            navigateToEditPage(item);
          } else if (value == 'delete') {
            //TODO delete and remove the item from list
            deleteById(id);
          }
        }, itemBuilder: (context) {
          return [
            const PopupMenuItem(
              value: 'edit',
              child: Text('Edit'),
            ),
            const PopupMenuItem(
              value: 'delete',
              child: Text('Delete'),
            ),
          ];
        }),
      ),
    );
  }
}
