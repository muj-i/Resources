import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Activity(),
    );
  }
}

/////////////////////////Alert Dialog
MyAletrtDialog(context) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Expanded(
            child: AlertDialog(
          title: Text('Do you want to delete permanently🗑️?'),
          actions: [
            TextButton(onPressed: () {}, child: Text('Yes')),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('No')),
          ],
        ));
      });
}

//////////////////////////////////////////////////////////////////
class Activity extends StatelessWidget {
  const Activity({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resouces'),
        backgroundColor: Colors.pink,
      ),
      body: Center(
        child: ElevatedButton(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Delete',
              style: TextStyle(fontSize: 50),
            ),
          ),
          onPressed: () {
            MyAletrtDialog(context);
          },
        ),
      ),
    );
  }
}
