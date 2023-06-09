import 'package:flutter/material.dart';

///import 'pages.dart'; //using stateful
///import 'package:google_nav_bar/google_nav_bar.dart';
///flutter_launcher_icons: ^0.13.1 //for icon under ""dependencies:""
///flutter_icons: //for icon under ""dev_dependencies:""
//  image_path: "logoo/logo.png"
//run on terminal
///flutter pub get
///flutter pub run flutter_launcher_icons:main

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

      ///////////////////////dual theme
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.cyan,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 12),
            // textStyle: const TextStyle(
            //   fontSize: 16,
            //   fontWeight: FontWeight.w600,
            //   letterSpacing: .6,
            // ),
          ),
        ),
      ),
      darkTheme: ThemeData(
        primarySwatch: Colors.blueGrey,
        brightness: Brightness.dark,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 12),
            // textStyle: const TextStyle(
            //   fontSize: 16,
            //   fontWeight: FontWeight.w600,
            //   letterSpacing: .6,
            // ),
          ),
        ),
      ),
      themeMode: ThemeMode.light, //  you can change theme by changing value .light/.dark
      /////////////////////////////////////////
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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BottomNavigationBar(
              backgroundColor: Colors.amber,
              iconSize: 24,
              selectedItemColor: Colors.green,
              currentIndex: 1,
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home), label: "Page 1"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.sailing), label: "Page 2"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.people), label: "Page 3"),
              ],
              onTap: (int index) {
                //setState(() {
                // _currentIndex = index;
              }),
        ),
      ),
/////////////////////////////////////////////
      ///
///////////////////////drawer
      drawer: Drawer(
          child: Container(
        color: const Color.fromARGB(255, 10, 29, 66).withAlpha(2000),
        child: ListView(children: [
          DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.red,
                ),
                accountName: Text(
                  'muj',
                  style: TextStyle(fontSize: 44, color: Colors.white70),
                ),
                accountEmail: Text('mio'),
                currentAccountPicture: Image.asset('images/favicon.png'),
              )),
          ListTile(
              iconColor: Colors.white,
              textColor: Colors.white,
              leading: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Icon(Icons.home),
              ),
              title: Text("Page 1"),
              onTap: () {
                //setState(() {
                //  _currentIndex = 0;
                //  Navigator.pop(context);
              }),
        ]),
      )),

      //////////////////////////////////////
      

      body: SingleChildScrollView(
        child: Align(
          alignment: Alignment.topCenter, // Adjust the alignment as per your requirement
          child: Column(
            children: [
              Image.network('https://dartpad.dev/dart-192.png'),
              InkWell(
                splashColor: Color.fromARGB(255, 13, 238, 5),
                onTap: () => MySnackBar("MSI Logo", context),
                child: Image.network('https://storage-asset.msi.com/frontend/imgs/2021-msi-series_logo-gaming.png')),
              ElevatedButton(
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
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "type num here",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(100))
                  ),
                ),
              ),
              TextField(),
              TextField(),
              TextField(),
              TextField(),
              TextField(),
            ],
          ),
        ),
      ),
    );
  }
}
