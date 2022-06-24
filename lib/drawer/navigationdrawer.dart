import 'package:directoryapp/Utils/Routes.dart';
import 'package:directoryapp/drawer/widget/DrawerHeader.dart';
import 'package:directoryapp/drawer/widget/DrawerItem.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class navigationDrawer extends StatefulWidget {
  @override
  State<navigationDrawer> createState() => _navigationDrawerState();
}

class _navigationDrawerState extends State<navigationDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[\
          createDrawerHeader(),
          createDrawerBodyItem(
            icon: Icons.home,
            text: 'Home',
            onTap: () =>
                Navigator.pushReplacementNamed(context, MyRoutes.initialRoute),
          ),
          createDrawerBodyItem(
            icon: Icons.account_circle,
            text: 'Profile',
            onTap: () =>
                Navigator.pushReplacementNamed(context, MyRoutes.initialRoute),
          ),
          createDrawerBodyItem(
            icon: Icons.reorder,
            text: 'MyOrders',
            onTap: () =>
                Navigator.pushReplacementNamed(context, MyRoutes.initialRoute),
          ),
          createDrawerBodyItem(
            icon: Icons.history,
            text: 'History',
            onTap: () =>
                Navigator.pushReplacementNamed(context, MyRoutes.initialRoute),
          ),
          createDrawerBodyItem(
              icon: Icons.feedback, text: 'Feedback', onTap: () {}),
          Divider(),
          createDrawerBodyItem(
            icon: Icons.exit_to_app,
            text: 'Logout',
            onTap: () {},
          ),
          SizedBox(
            height: 250,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: ListTile(
              title: Text('App version 1.0.0'),
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}
