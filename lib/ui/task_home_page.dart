import 'package:flutter/material.dart';
class TaskHomePage extends StatefulWidget {
  const TaskHomePage({super.key});

  @override
  State<TaskHomePage> createState() => _TaskHomePageState();
}

class _TaskHomePageState extends State<TaskHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task with DB', 
          style: TextStyle(
            fontSize: 26, 
              color: Colors.white, 
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter Task',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    )
                  ),
                )),
                IconButton(onPressed: (){}, icon: Icon(Icons.add, size: 30,))
              ],
            ),
            SizedBox(height: 10,),
            ListView.builder(
              shrinkWrap: true,
              itemCount: 10,
                itemBuilder: (context, index){
              return Card(
                child: ListTile(
                  title: Text('Task $index'),
                  trailing: Icon(Icons.delete),
                  onTap: (){},
                  onLongPress: (){},
                  leading: Icon(Icons.check_box_outline_blank),
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}
