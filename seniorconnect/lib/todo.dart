import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TodoListPage extends StatefulWidget {
  @override
  _TodoListPageState createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  List<String> tasks = [];
  late SharedPreferences _prefs;
  TextEditingController _taskController = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadTasks();
  }

  void loadTasks() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      tasks = _prefs.getStringList('tasks') ?? [];
    });
  }

  void saveTasks() async {
    await _prefs.setStringList('tasks', tasks);
  }

  void addTask(String task) {
    setState(() {
      tasks.add(task);
      saveTasks();
    });
  }

  void completeTask(int index) {
    setState(() {
      tasks[index] = tasks[index].startsWith('✓ ')
          ? tasks[index].substring(2)
          : '✓ ' + tasks[index];
      saveTasks();
    });
  }

  void deleteTask(int index) {
    setState(() {
      tasks.removeAt(index);
      saveTasks();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To-Do List'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 4.0,
                  color: Colors.blueGrey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: ListTile(
                    leading: IconButton(
                      icon: tasks[index].startsWith('✓ ')
                          ? Icon(Icons.check_circle, color: Colors.green)
                          : Icon(Icons.circle_outlined),
                      onPressed: () {
                        completeTask(index);
                      },
                    ),
                    title: Text(
                      tasks[index].startsWith('✓ ')
                          ? tasks[index].substring(2)
                          : tasks[index],
                      style: TextStyle(
                        decoration: tasks[index].startsWith('✓ ')
                            ? TextDecoration.lineThrough
                            : null,
                      ),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      color: Colors.red,
                      onPressed: () {
                        deleteTask(index);
                      },
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Add a task...',
                suffixIcon: IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    String newTask = _taskController.text.trim();
                    if (newTask.isNotEmpty) {
                      addTask(newTask);
                    }
                    _taskController.clear();
                  },
                ),
              ),
              controller: _taskController,
              onSubmitted: (value) {
                String newTask = _taskController.text.trim();
                if (newTask.isNotEmpty) {
                  addTask(newTask);
                }
                _taskController.clear();
              },
            ),
          ),
        ],
      ),
    );
  }
}
