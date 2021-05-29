import 'package:flutter/material.dart';
import 'customForm.dart';

class Home extends StatefulWidget {
  final String userName ;
  //Home(this.userName);
  Home({Key key, @required this.userName}):super(key:key);
  @override
  _HomeState createState() => _HomeState();
}


class _HomeState extends State<Home> {

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 10, fontWeight: FontWeight.bold);
   List<Widget> _widgetOptions = <Widget>[
     Text(
       'Index 1: Home',
       style: optionStyle,
     ),
    MyCustomForm(),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
      length: 3,
      child: Scaffold(

          appBar: AppBar(title: Text(widget.userName ),
            automaticallyImplyLeading: false,
           ),
          body:  Center(
            child: _widgetOptions.elementAt(_selectedIndex),
          ),
          bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
          ),
          BottomNavigationBarItem(
          icon: Icon(Icons.message),
          label: 'Messages',
          ),
          BottomNavigationBarItem(
          icon: Icon(Icons.school),
          label: 'School',
          ),
          ],
            onTap: (index)=> setState((){_selectedIndex = index;}),
            currentIndex: _selectedIndex,
          )

      ),
    );
  }
}

//
// class SnackBarDemo extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'SnackBar Demo',
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('SnackBar Demo'),
//         ),
//         body: SnackBarPage(),
//       ),
//     );
//   }
// }
//
// class SnackBarPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: ElevatedButton(
//         onPressed: () {
//           final snackBar = SnackBar(
//             content: Text('Login! Successfully'),
//             // action: SnackBarAction(
//             //   label: 'Undo',
//             //   onPressed: () {
//             //     // Some code to undo the change.
//             //   },
//             // ),
//           );
//
//           // Find the ScaffoldMessenger in the widget tree
//           // and use it to show a SnackBar.
//           ScaffoldMessenger.of(context).showSnackBar(snackBar);
//         },
//         child: Text('Show SnackBar'),
//       ),
//     );
//   }
// }