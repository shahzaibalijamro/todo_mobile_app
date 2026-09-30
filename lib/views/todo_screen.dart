import 'package:flutter/material.dart';
import 'package:todo_app/models/todo_model.dart';

class TodoScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  List<Todo> todoList = [
    Todo(title: "First Todo"),
    Todo(title: "Second Todo"),
    Todo(title: "Third Todo"),
    Todo(title: "Fourth Todo"),
  ];

  Todo newTodo = Todo(title: "new Todo");

  void addTodo() {
    setState(() {
      todoList.add(newTodo);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addTodo();
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.green,
        title: Text(
          "Todo App",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        leading: Padding(
          padding: EdgeInsets.all(5),
          child: CircleAvatar(
            backgroundImage: AssetImage("assets/images/image.png"),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(20),
              itemBuilder: (context, index) {
                Todo currentTodo = todoList[index];
                return Padding(
                  padding: EdgeInsetsGeometry.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 15,
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage("assets/images/image.png"),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("${currentTodo.title}"),
                          Text(
                            "${currentTodo.description != null ? currentTodo.description : "No description"}",
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
              itemCount: todoList.length,
            ),
          ),
        ],
      ),
    );
  }
}
