import 'package:flutter/material.dart';
// import './detailproduk.dart';
import './beranda.dart' as beranda;
import './listmerk.dart' as listmerk;

//Top Level/Root
void main() {
  runApp(new MaterialApp(
    title: "Modi App",
    home: new MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin{
  TabController controller;
  @override

  void initState(){
    controller = new TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose(){
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new TabBarView(
        controller: controller,
        children: <Widget>[
          new beranda.Beranda(),
          new listmerk.ListMerk(),
        ],
      ),

      bottomNavigationBar: new Material(
        color: Colors.blue,
        child: new TabBar(
          controller: controller,
          tabs: <Widget>[
            new Tab(icon: new Icon(Icons.home)),
            new Tab(icon: new Icon(Icons.list)),
          ],
        )
      ),
    );
  }
}