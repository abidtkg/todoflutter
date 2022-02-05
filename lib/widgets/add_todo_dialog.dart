import 'package:flutter/material.dart';
import './todo_form_widget.dart';

class AddTodoDialogWidget extends StatefulWidget {
  
  @override
  _AddTodoDialogWidgetState createState() => _AddTodoDialogWidgetState();
}

class _AddTodoDialogWidgetState extends State<AddTodoDialogWidget> {
  final _fomKey = GlobalKey<FormState>();
  String title = '';
  String description = '';

  @override
  Widget build(BuildContext context) => AlertDialog(
    content: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Create Task', style: TextStyle(color: Colors.black, fontSize: 20),),
        TodoFromWidget(
          onChangeTitle: (title) => setState(() => this.title = title),
          onChangeDescription: (description) => setState(() => this.description = description),
          onSavedTodo: () {},
        )
      ],
    ),
  );
}