import 'package:flutter/material.dart';
import 'package:todo_test_app/models/todo.dart';
import 'package:todo_test_app/widgets/todo_item.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  final todosList = ToDo.todoList();

  List<ToDo> foundToDo = [];

  final todoController = TextEditingController();

  @override
  void initState() {
    foundToDo = todosList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFEEEFF5),
        appBar: AppBar(
          backgroundColor: const Color(0xFFEEEFF5),
          elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(
                Icons.menu,
                color: Colors.black54,
                size: 30,
              ),
              Container(
                height: 40,
                width: 40,
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(200),
                  child: Image.asset('assets/images/girl.jpg'),
                ),
              )
            ],
          ),
        ),
        body: ListView(
          children: [
            searchbar(),
            taskList(handleToDoChange, handleToDoDeleteItem),
            // addTaskBar(),
          ],
        ),
        bottomNavigationBar: Row(
          // color: const Color.fromARGB(255, 192, 192, 192),
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 305,
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 15.0, // soften the shadow
                            spreadRadius: 5.0, //extend the shadow
                            offset: Offset(
                              5.0, // Move to right 5  horizontally
                              5.0, // Move to bottom 5 Vertically
                            ),
                          )
                        ],
                      ),
                      child: TextField(
                        controller: todoController,
                        decoration: const InputDecoration(
                          prefixIconConstraints: BoxConstraints(
                            maxHeight: 20,
                            minWidth: 25,
                          ),
                          // border: InputBorder.none,
                          hintText: 'Add Tasks',
                        ),
                      ),
                    ),
                    FloatingActionButton(
                      splashColor: Colors.green,
                      onPressed: () {
                        addToDoItem(todoController.text);
                      },
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }

  void handleToDoChange(ToDo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void handleToDoDeleteItem(String id) {
    setState(() {
      todosList.removeWhere((item) => item.id == id);
    });
  }

  void addToDoItem(String todo) {
    setState(() {
      todosList.add(ToDo(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          todoText: todo));
    });
    todoController.clear();
  }

  void runFilter(String enteredKeyword) {
    List<ToDo> results = [];
    if (enteredKeyword.isEmpty) {
      results = todosList;
    } else {
      results = todosList
          .where((item) => item.todoText!
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    setState(() {
      foundToDo = results;
    });
  }

  searchbar() {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.white),
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: TextField(
          onChanged: (value) => runFilter(value),
          decoration: const InputDecoration(
            prefixIcon: Icon(
              Icons.search,
              color: Colors.black,
              size: 20,
            ),
            prefixIconConstraints: BoxConstraints(
              maxHeight: 20,
              minWidth: 25,
            ),
            border: InputBorder.none,
            hintText: 'Search',
          ),
        ),
      ),
    );
  }

  taskList(handleToDoChange, handleToDoDeleteItem) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(25, 20, 0, 0),
                child: const Text(
                  'All To Dos',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 28,
                  ),
                ),
              ),
            ],
          ),
        ),
        for (ToDo todo in foundToDo.reversed)
          ToDoItem(
            todo: todo,
            onToDoChanged: handleToDoChange,
            onToDoDelete: handleToDoDeleteItem,
          ),
      ],
    );
  }

  addTaskBar() {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: Container(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: const TextField(
              decoration: InputDecoration(
                fillColor: Colors.white,
              ),
            ),
          ),
        ),
        FloatingActionButton(
          onPressed: () {
            addToDoItem(todoController.text);
          },
        )
      ],
    );
  }
}
