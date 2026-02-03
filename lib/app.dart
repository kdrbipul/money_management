import 'package:flutter/material.dart';
import 'home_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MoneyManagement',
        home: HomeScreen(),
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
