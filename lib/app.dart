import 'package:flutter/material.dart';
import 'package:money_management/ui/task_home_page.dart';
import 'home_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MoneyManagement',
        home: TaskHomePage(),
        theme: ThemeData(
          useMaterial3: true,
          appBarTheme: AppBarThemeData(
            backgroundColor: Colors.amberAccent,
            centerTitle: true,
            foregroundColor: Colors.black,
            // elevation: 5,
          )
        ),
      ),
    );
  }
}
