import 'package:flutter/material.dart';


class ShowTabs extends StatefulWidget {
  @override
  _ShowTabsState createState() => _ShowTabsState();
}

class _ShowTabsState extends State<ShowTabs> {

  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
      length: 3,
      child: Scaffold(

          appBar: AppBar(title: Text("Home Screen"),
            automaticallyImplyLeading: false,
            bottom: TabBar(
                tabs: [
                  Tab(text: "Left", icon: Icon(Icons.settings),),
                  Tab(text: "Middle", icon: Icon(Icons.favorite, color: Colors.redAccent,),),
                  Tab(text: "Right", icon: Icon(Icons.contacts),)

                ]
            ),),
          body: TabBarView(
            children: [
              Text("Left Tab data"),
              Text("Middle Tab data"),
              Text("Right Tab data")
            ],
          ),

      ),
    );
  }
}
