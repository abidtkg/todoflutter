import 'package:flutter/material.dart';

class TodoFromWidget extends StatelessWidget {

  final String title;
  final String description;
  final ValueChanged<String> onChangeTitle;
  final ValueChanged<String> onChangeDescription;
  final VoidCallback onSavedTodo;


  const TodoFromWidget({
    Key? key,
    this.title = '',
    this.description = '',
    required this.onChangeTitle,
    required this.onChangeDescription,
    required this.onSavedTodo,
  }): super(key: key);
  
  @override
  Widget build(BuildContext context) => SingleChildScrollView(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        buildTitle(),
        buildDescription(),
        buildButton()
      ],
    ),
  );

  Widget buildTitle() => TextFormField(
    initialValue: title,
    onChanged: onChangeTitle,
    validator: (title) {
      if(title!.isEmpty){
        return 'the title can\'t be empty';
      }
      return null;
    },
    decoration: const InputDecoration(
      border: UnderlineInputBorder(),
      label: Text('Title')
    ),
  );

  Widget buildDescription() => TextFormField(
    maxLines: 3,
    initialValue: description,
    onChanged: onChangeDescription,
    validator: (description) {
      if(description!.isEmpty){
        return 'the description can\'t be empty';
      }
      return null;
    },
    decoration: const InputDecoration(
      border: UnderlineInputBorder(),
      label: Text('Description')
    ),
  );

  Widget buildButton() => SizedBox(
    width: double.infinity,
    child: ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.black)
      ), child: Text('Save'),
      onPressed: onSavedTodo,
    ),
  );
}