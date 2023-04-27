class ToDo {
  String? id;
  String? todoText;
  bool isDone;

  ToDo({
    required this.id,
    required this.todoText,
    this.isDone = false,
  });

  static List<ToDo> todoList() {
    return [
      ToDo(id: '1', todoText: 'Morning Exercise', isDone: true),
      ToDo(
        id: '2',
        todoText: 'Check email',
      ),
      ToDo(
        id: '3',
        todoText: 'Grocery shopping',
      ),
      ToDo(id: '4', todoText: 'Team Meeting', isDone: true),
      ToDo(
        id: '5',
        todoText: 'Daily test',
      ),
      ToDo(id: '1', todoText: 'Morning Exercise', isDone: true),
      ToDo(
        id: '2',
        todoText: 'Check email',
      ),
      ToDo(
        id: '3',
        todoText: 'Grocery shopping',
      ),
      ToDo(id: '4', todoText: 'Team Meeting', isDone: true),
      ToDo(
        id: '5',
        todoText: 'Daily test',
      ),
    ];
  }
}
