import 'package:flutter/material.dart';

class todolist extends StatefulWidget {
  const todolist({Key? key}) : super(key: key);

  @override
  State<todolist> createState() => _ToDoListState();
}

class _ToDoListState extends State<todolist> {
  final List<String> _toDoItems = [];
  final TextEditingController _textFieldController = TextEditingController();

  void _addToDoItem(String task) {
    if (task.isNotEmpty) {
      setState(() {
        _toDoItems.add(task);
      });
      _textFieldController.clear();
    }
  }

  void _removeToDoItem(int index) {
    setState(() {
      _toDoItems.removeAt(index);
    });
  }

  Widget _buildToDoList() {
    return ListView.builder(
      itemCount: _toDoItems.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            title: Text(_toDoItems[index]),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () => _removeToDoItem(index),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text('To do List'),
          backgroundColor: Colors.lightBlue,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: _textFieldController,
                decoration: const InputDecoration(
                  labelText: 'Masukkan task',
                ),
                onSubmitted: _addToDoItem,
              ),
              const SizedBox(height: 20),
              Expanded(
                child: _buildToDoList(),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _addToDoItem(_textFieldController.text),
          tooltip: 'Add task',
          backgroundColor: Colors.lightBlue,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
