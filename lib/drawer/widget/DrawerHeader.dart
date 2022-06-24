import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

Widget createDrawerHeader() {
  CollectionReference users = FirebaseFirestore.instance.collection('');
  return DrawerHeader(
    margin: EdgeInsets.zero,
    padding: EdgeInsets.zero,
    child: FutureBuilder<DocumentSnapshot>(
      future: users.doc("").get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;

          return Material(
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      //showDialogFunc(context, data["url"]);
                    },
                    child: Align(
                      alignment: Alignment.center,
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.white, width: 5),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(30),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  spreadRadius: 0,
                                  blurRadius: 20,
                                  color: Colors.black.withOpacity(0),
                                  offset: Offset(5, 15),
                                )
                              ],
                            ),
                            child: ClipOval(
                              child: Image.network(
                                "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png",
                                width: 60,
                                height: 60,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "${data['First Name']} ${data['Last Name']}",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text("${data["Email"]}"),
                ],
              ),
            ),
          );
        }

        return Center(
          child: CircularProgressIndicator(),
        );
      },
    ),
  );
}
