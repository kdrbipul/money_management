import 'package:flutter/material.dart';

class buildList extends StatelessWidget {
  final List<Map<String, dynamic>> items;
  final bool isEarning;
  final Color cardColor;
  final Color backgroundCardColor;
  final Icon cardIcon;


  const buildList({
    super.key,
    required this.items,
    required this.isEarning,
    required this.cardColor,
    required this.cardIcon,
    required this.backgroundCardColor,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Card(
          color: backgroundCardColor,
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
              backgroundColor: cardColor,
              child: Icon(cardIcon.icon, color: Colors.white),
            ),
          ),
        );
      },
    );
  }
}
