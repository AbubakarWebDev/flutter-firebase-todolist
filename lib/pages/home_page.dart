// Builtin & ThirdParty Imports
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// Custom Made Imports
import 'package:todolist_with_firebase/model/todo.dart';
import 'package:todolist_with_firebase/provider/todos.dart';
import 'package:todolist_with_firebase/api/firebase_api.dart';
import 'package:todolist_with_firebase/widgets/todo_dialog_widget.dart';
import 'package:todolist_with_firebase/widgets/todo_list_widget.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({ 
    Key? key, 
    required this.title
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int selectedIndex = 0;
  late Stream<List<Todo>> todoStream;

  @override
  void initState() {
    super.initState();
    todoStream = FirebaseApi.readTodos2();
  }

  @override
  Widget build(BuildContext context) {
    final tabs = [
      TodoListWidget(todos: context.watch<TodosProvider>().todos),
      TodoListWidget(todos: context.watch<TodosProvider>().completedTodos),
    ];

    return Scaffold(
      appBar: AppBar (
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,

        title: Text(
          widget.title,
          textDirection: TextDirection.ltr,
        ),
      ),

      body: StreamBuilder<List<Todo>>(
        stream: todoStream,
        builder: (context, snapshot) { 	
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator()
            );
          } 
          else if (snapshot.connectionState == ConnectionState.active || snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return buildText(snapshot.error.toString());
            }
            else if (snapshot.hasData) {
              final provider = context.read<TodosProvider>();
              final List<Todo>? todo = snapshot.data;
              provider.setTodos(todo!);
              return tabs[selectedIndex];

              /* ------- Using the ReadTodo Function -------
              final model = context.read<TodosProvider>();
              final List<Todo> todo = snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
                  return Todo.fromJson(data);
              }).toList();

              model.setTodos(todo);
              return tabs[selectedIndex]; */
            }
            else {
              return buildText("Empty Data");
            }
          } 
          else {
            return Text('State: ${snapshot.connectionState}');
          }
        },
      ),

      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add, color: Colors.white),
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () => showDialog(
          context: context, 
          builder: (BuildContext context) => const TodoDialogWidget(),
          barrierDismissible: false
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white.withOpacity(0.7),
        selectedItemColor: Colors.white,
        currentIndex: selectedIndex,

        onTap: (index) => setState((){
          selectedIndex = index;
        }),
        
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.fact_check_outlined),
            label: "Todos",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.done, size: 28),
            label: "Completed",
          ),
        ],
      ),
    );
  }

  Widget buildText(String text) => Center(
    child: Text(
      text,
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 24, 
        color: Colors.black
      ),
    ),
  );
}