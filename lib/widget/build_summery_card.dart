import 'package:flutter/material.dart';

class BuildSummeryCard extends StatelessWidget {
  final String title;
  final double amount;
  final Color cardColor;

  const BuildSummeryCard({
    super.key,
    required this.title,
    required this.amount,
    required this.cardColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      color: cardColor,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              amount.toString(),
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
