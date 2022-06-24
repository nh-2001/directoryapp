import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:directoryapp/drawer/navigationdrawer.dart';
import 'package:flutter/material.dart';

class Home_Page extends StatefulWidget {
  const Home_Page({Key? key}) : super(key: key);

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  final myController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: navigationDrawer(),
      body: Column(
        children: [
          TextFormField(
            controller: myController,
          ),
          ElevatedButton(
              onPressed: () async {
                await FirebaseFirestore.instance
                    .collection("Users")
                    .add({"Name": myController.text});
              },
              child: Text("Click"))
        ],
      ),
    );
  }
}
