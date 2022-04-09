// Builtin & ThirdParty Imports
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

// Custom Made Imports
import 'package:todolist_with_firebase/provider/todos.dart';
import 'package:todolist_with_firebase/pages/home_page.dart';
import 'package:todolist_with_firebase/utils/app_routes.dart';
import 'package:todolist_with_firebase/widgets/app_themes.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static const String _title = "TodoList Application";

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TodosProvider(),

      child: MaterialApp(
        title: _title,
        debugShowCheckedModeBanner: false,

        themeMode: ThemeMode.system,
        theme: AppTheme.lightTheme(context),
        darkTheme: AppTheme.darkTheme(context),
        
        initialRoute: Routes.home,
        routes: {
          "/": (context) => const HomePage(title: _title),
          Routes.home: (context) => const HomePage(title: _title),
          // Routes.login: (context) => LoginPage(),
        },
      )
    );
  }
}
