// Builtin & ThirdParty Imports
import 'package:cloud_firestore/cloud_firestore.dart';

// Custom Made Imports
import 'package:todolist_with_firebase/model/todo.dart';

class FirebaseApi {
  static Future<String> createTodo(Todo todo) async {
    try {
      final docTodo = FirebaseFirestore.instance.collection('todo').doc();
      todo.id = docTodo.id;
      await docTodo.set(todo.toJson());
      return docTodo.id;
    } 
    catch (e) {
      return "ERROR";
    }
  }

  static Stream<List<Todo>> readTodos2() async* {
    List<Todo> list = []; 
    
    FirebaseFirestore.instance
      .collection('todo')
      .orderBy('createdTime', descending: true)
      .get()    
      .then((QuerySnapshot querySnapshot) {
        for (var doc in querySnapshot.docs) {
          list.add(Todo(
            id: doc['id'],
            title: doc['title'],
            createdTime: doc['createdTime'].toDate(),
            description: doc['description'],
            isCompleted: doc['isCompleted'],
          ));
        }
      });

      yield list;
  }

  static Stream<QuerySnapshot> readTodos() {    
    return FirebaseFirestore.instance
      .collection('todo')
      .orderBy('createdTime', descending: true)
      .snapshots();
  }

  static Future updateTodo(Todo todo) async {
    final docTodo = FirebaseFirestore.instance.collection('todo').doc(todo.id);

    await docTodo.update(todo.toJson());
  }

  static Future deleteTodo(Todo todo) async {
    final docTodo = FirebaseFirestore.instance.collection('todo').doc(todo.id);

    await docTodo.delete();
  }
}
