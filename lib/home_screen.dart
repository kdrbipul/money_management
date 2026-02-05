import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:money_management/widget/build_list.dart';
import 'package:money_management/widget/build_summery_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, dynamic>> earning = [];
  final List<Map<String, dynamic>> expense = [];

  double get totalEarning => earning.fold(0, (sum, item) => sum + double.parse(item['amount']));
  double get totalExpense => expense.fold(0, (sum, item) => sum + double.parse(item['amount']));
  double get balance => totalEarning - totalExpense;



  void _showOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  Navigator.pop(context);
                  _showForm(true);
                },
                child: Text('Add Earning'),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  Navigator.pop(context);
                  _showForm(false);
                },
                child: Text('Add Expense'),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showForm(bool isEarning) {
    final TextEditingController titleController = TextEditingController();
    final TextEditingController amountController = TextEditingController();
    final DateTime entryDate = DateTime.now();

    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  isEarning ? 'Add Earning' : 'Add Expense',
                  style: TextStyle(fontSize: 24),
                ),
                TextFormField(
                  controller: titleController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Title',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: amountController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Amount',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                      if(isEarning){
                        earning.add({
                          'title': titleController.text,
                          'amount': double.tryParse(amountController.text),
                          'date': entryDate,
                        });
                        setState(() {});
                      }else{
                        expense.add({
                          'title': titleController.text,
                          'amount': double.tryParse(amountController.text),
                          'date': entryDate,
                        });
                        setState(() {});
                      }
                    },
                    child: Text('Submit'),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

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
                  amount: totalEarning,
                  cardColor: Colors.green,
                ),
                BuildSummeryCard(
                  title: 'Expense',
                  amount: totalExpense,
                  cardColor: Colors.red,
                ),
                BuildSummeryCard(
                  title: 'Balance',
                  amount: balance,
                  cardColor: Colors.blue,
                ),
              ],
            ),
            SizedBox(height: 10),
            Expanded(
              child: TabBarView(
                children: [
                  buildList(items: earning, isEarning: true),
                  buildList(items: expense, isEarning: false),
                ],
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
          onPressed: () => _showOptions(context),
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
