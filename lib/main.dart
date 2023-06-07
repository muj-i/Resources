import 'package:flutter/material.dart';
///import 'pages.dart'; //using stateful
///import 'package:google_nav_bar/google_nav_bar.dart';

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

///////////////////////////SnackBar
MySnackBar(message, context) {
  return ScaffoldMessenger.of(context)
      .showSnackBar(SnackBar(content: (Text(message))));
}
//////////////////////////////////////////////////////

/////////////////////////Alert Dialog
MyAletrtDialog(context) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Expanded(
            child: AlertDialog(
          title: Text('Do you want to delete permanently🗑️?'),
          actions: [
            TextButton(
                onPressed: () {
                  MySnackBar("done", context);
                },
                child: Text('Yes')),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('No')),
          ],
        ));
      });
}

//////////////////////////////////////////////////


class Activity extends StatelessWidget {
  const Activity({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resouces'),
        backgroundColor: Colors.pink,
      ),

///////////////////////////////////////
/// Using a exter package named google_nav_bar as bottom navigation bar
///import 'package:google_nav_bar/google_nav_bar.dart';
///google_nav_bar: ^5.0.6 //pubspec.yaml
/// int _currentIndex = 1; /// using statefull

/*      bottomNavigationBar: Container(
          color: const Color.fromARGB(255, 10, 29, 66).withAlpha(1000),
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 17),
              child: GNav(
                  backgroundColor:
                      const Color.fromARGB(255, 10, 29, 66).withAlpha(0),
                  color: Colors.white,
                  iconSize: 24,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 9),
                  activeColor: Colors.white,
                  tabBackgroundColor:
                      Color.fromARGB(255, 228, 231, 238).withOpacity(0.1),
                  gap: 8,
                  /////currentIndex: 1,
                  tabs: [
                    GButton(icon: Icons.home, text: "Page 1"),
                    GButton(
                        icon: Icons.business_center_outlined, text: "Page 2"),
                    GButton(icon: Icons.people, text: "Page 3"),
                  ],
                  onTabChange: (int index) {
                    //setState(() {
                    // _currentIndex = index;
                  }))),
*/

////////////////////////////////////

//////////////////////////////////////////
///using default bottom nav bar
bottomNavigationBar: Container(
  color: Colors.black,
  child:   Padding(
    padding: const EdgeInsets.all(16.0),
    child:   BottomNavigationBar(
        backgroundColor:Colors.amber,
        iconSize: 24,
       selectedItemColor: Colors.green,
       currentIndex: 1,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Page 1"),
          BottomNavigationBarItem(icon: Icon(Icons.sailing), label: "Page 2"),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: "Page 3"),
        ],
        onTap: (int index) {
          //setState(() {
          // _currentIndex = index;
        }),
  ),
),
/////////////////////////////////////////////



    body:
    Center(
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
