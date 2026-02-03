import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:money_management/widget/build_summery_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Money Management'),
          bottom: ButtonsTabBar(
            contentPadding: EdgeInsets.symmetric(horizontal: 10),
            labelSpacing: 10,
            center: false,
            contentCenter: false,
            elevation: 3,
            backgroundColor: Colors.green,
            unselectedBackgroundColor: Colors.grey.shade300,
            splashColor: Colors.pinkAccent,
            unselectedLabelStyle: TextStyle(color: Colors.black),
            labelStyle: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            tabs: const [
              Tab(icon: Icon(Icons.savings_outlined), text: "Earning"),
              Tab(icon: Icon(Icons.exposure_neg_1), text: "Expense"),
            ],
          ),
        ),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                BuildSummeryCard(
                  title: 'Earning',
                  amount: 500,
                  cardColor: Colors.green,
                ),
                BuildSummeryCard(
                  title: 'Expense',
                  amount: 500,
                  cardColor: Colors.red,
                ),
                BuildSummeryCard(
                  title: 'Balance',
                  amount: 500,
                  cardColor: Colors.blue,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
