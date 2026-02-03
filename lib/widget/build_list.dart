import 'package:flutter/material.dart';

class buildList extends StatelessWidget {
  final List<Map<String, dynamic>> items;
  final bool isEarning;
  const buildList({super.key, required this.items, required this.isEarning,});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 3,
          child: ListTile(
            title: Text(items[index]['title']),
            subtitle: Text(items[index]['date'].toString()),
            trailing: Text(
              items[index]['amount'],
              style: TextStyle(fontSize: 22, color: Colors.green),
              textAlign: TextAlign.end,
            ),
            leading: CircleAvatar(
              backgroundColor: Colors.green,
              child: Icon(Icons.arrow_upward, color: Colors.white,),
            )
          ),
        );
      },
    );
  }
}
