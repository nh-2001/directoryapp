import 'package:directoryapp/Pages/Home_Page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:google_fonts/google_fonts.dart';

class Login_Page extends StatefulWidget {
  @override
  _patient_loginState createState() => _patient_loginState();
}

class _patient_loginState extends State<Login_Page> {
  String _userEmail = '';
  String _password = '';
  bool PassShow = true;
  bool clickButton = false;

  _showPassword() {
    setState(() {
      PassShow = !PassShow;
    });
  }

  @override
  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.width;
    var _height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                ClipPath(
                  clipper: OvalBottomBorderClipper(),
                  child: Container(
                    height: 255,
                    padding: EdgeInsets.all(20),
                    color: Colors.deepPurple,
                    alignment: Alignment.center,
                  ),
                ),
                ClipPath(
                  clipper: OvalBottomBorderClipper(),
                  child: Container(
                    height: 250,
                    padding: EdgeInsets.all(20),
                    color: Color.fromARGB(255, 246, 237, 240),
                    alignment: Alignment.center,
                    child: Container(
                      height: 300,
                      child: Image(
                        image: AssetImage("lib/Assets/Images/samaj_logo.png"),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Welcome",
              style: GoogleFonts.greatVibes(
                color: Colors.black,
                fontSize: 30,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Sign in to continue.",
              style: GoogleFonts.greatVibes(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextFormField(
                onTap: () {},
                enabled: true,
                decoration: InputDecoration(
                  isDense: true,
                  border: OutlineInputBorder(),
                  alignLabelWithHint: false,
                  prefixIcon: Icon(Icons.email),
                  labelText: 'Email ',
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter your email address';
                  }
                  // Check if the entered email has the right format
                  if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                    return 'Please enter a valid email address';
                  }
                  // Return null if the entered email is valid
                  return null;
                },
                onChanged: (value) => _userEmail = value,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: TextFormField(
                onTap: () {},
                obscureText: PassShow,
                decoration: InputDecoration(
                  isDense: true,
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: InkWell(
                    onTap: _showPassword,
                    child: Icon(
                      PassShow ? Icons.visibility : Icons.visibility_off,
                    ),
                  ),
                  alignLabelWithHint: false,
                  labelText: 'Password ',
                ),
                onChanged: (value) => _password = value,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'This field is required';
                  }
                  if (value.trim().length < 8) {
                    return 'Password must be at least 8 characters in length';
                  }
                  // Return null if the entered password is valid
                  return null;
                },
              ),
            ),
            SizedBox(
              height: 40,
            ),
            InkWell(
              onTap: () async {
                setState(() {
                  clickButton = true;
                });
                // setState(() {
                //   clickButton = false;
                // });
              },
              child: AnimatedContainer(
                duration: Duration(seconds: 1),
                width: clickButton ? 50 : 380,
                height: 50,
                alignment: Alignment.center,
                child: clickButton
                    ? Icon(
                        Icons.done,
                        color: Colors.white,
                      )
                    : Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(clickButton ? 25 : 10)),
              ),
            ),
            SizedBox(
              height: 170,
            ),
            Text(
              "Made by",
              style: TextStyle(fontWeight: FontWeight.w300),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "Het & Nehansh",
              style: TextStyle(fontWeight: FontWeight.w300),
            ),
            // Padding(
            //   padding: const EdgeInsets.only(top: 15, left: 220),
            //   child: SizedBox(
            //     child: InkWell(
            //       onTap: () {
            //         Navigator.push(
            //           context,
            //           MaterialPageRoute(builder: (context) => Home_Page()),
            //         );
            //       },
            //       child: Text(
            //         "Forgot Password ?",
            //         style: TextStyle(
            //             color: Colors.blueAccent,
            //             fontSize: 15,
            //             fontWeight: FontWeight.bold),
            //       ),
            //     ),
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.only(top: 30),
            //   child: Row(children: <Widget>[
            //     Expanded(
            //       child: new Container(
            //           margin: const EdgeInsets.only(
            //             left: 30.0,
            //             right: 15.0,
            //           ),
            //           child: Divider(
            //             color: Colors.black,
            //             height: 50,
            //           )),
            //     ),
            //     Text("OR"),
            //     Expanded(
            //       child: new Container(
            //           margin: const EdgeInsets.only(left: 15.0, right: 30.0),
            //           child: Divider(
            //             color: Colors.black,
            //             height: 50,
            //           )),
            //     ),
            //   ]),
            // ),
            // Text(
            //   "Sign in with",
            //   style: TextStyle(fontSize: 15, color: Colors.black38),
            // ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 140, vertical: 18),
            //   child: Row(
            //     children: [
            //       InkWell(
            //         onTap: () {},
            //         child: CircleAvatar(
            //             backgroundColor: Colors.white,
            //             radius: 18,
            //             child: Image(
            //               image: AssetImage("assets/google_logo.png"),
            //               height: 30,
            //             )),
            //       ),
            //       SizedBox(
            //         width: 15,
            //       ),
            //       InkWell(
            //         onTap: () {},
            //         child: CircleAvatar(
            //             backgroundColor: Colors.white,
            //             radius: 18,
            //             child: Image(
            //               image: AssetImage("assets/facebook_logo.png"),
            //               height: 30,
            //             )),
            //       ),
            //     ],
            //   ),
            // ),
            // Row(
            //   children: [
            //     Padding(
            //       padding: const EdgeInsets.only(left: 55, right: 4, top: 25),
            //       child: Text(
            //         "Don't have an account ?",
            //         style: TextStyle(fontSize: 18),
            //       ),
            //     ),
            //     Padding(
            //       padding: const EdgeInsets.only(right: 15, top: 25),
            //       child: InkWell(
            //         onTap: () {},
            //         child: Text(
            //           "Sign up",
            //           style: TextStyle(
            //             fontSize: 17,
            //             fontWeight: FontWeight.bold,
            //           ),
            //         ),
            //       ),
            //     ),
            //   ],
            // )
          ],
        ),
      ),
      // floatingActionButton: Align(
      //   alignment: Alignment.bottomRight,
      //   child: FloatingActionButton(
      //     onPressed: () {
      //       Navigator.push(
      //         context,
      //         MaterialPageRoute(builder: (context) => Home_Page()),
      //       );
      //     },
      //     backgroundColor: Colors.deepPurple,
      //     child: Icon(
      //       Icons.arrow_right_alt_sharp,
      //       size: 35,
      //       color: Colors.white,
      //     ),
      //   ),
      // ),
    );
  }
}
