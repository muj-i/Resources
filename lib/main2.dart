import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Activity(),
    );
  }
}

///////////////////////////SnackBar
MySnackBar(message, context) {
  return ScaffoldMessenger.of(context)
      .showSnackBar(SnackBar(content: (Text(message))));
}
//////////////////////////////////////////////////////

class Activity extends StatelessWidget {
/////json
  var jsonItems = [
    {
      'img':
          'https://lh3.googleusercontent.com/a/AAcHTtepn_l7UbUPKA_1CoBzcptgpXaMEhYgq56U6dx7=s96-c-rg-br100',
      'title': 'mee'
    }
  ];
/////
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Resouces',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.pink,
      ),

      //////////////////////////////////////

      body: ListView.builder(
        itemCount: jsonItems.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.all(10),
              width: double.infinity,
              child: Image.network(
                jsonItems[index]['img']!,
              ),
            ),
          );
        },
      ),
    );
  }
}
