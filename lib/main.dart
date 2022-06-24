import 'package:directoryapp/Pages/DetailsForm.dart';
import 'package:directoryapp/Pages/Home_Page.dart';
import 'package:directoryapp/Utils/Routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      //home: Home_Page(),
      themeMode: ThemeMode.light,
      theme: ThemeData(
        // textTheme: GoogleFonts.questrialTextTheme(
        //   Theme.of(context).textTheme,
        // ),
        primarySwatch: Colors.deepPurple,
      ),

      darkTheme: ThemeData(primarySwatch: Colors.brown),

      routes: {
        MyRoutes.initialRoute: (context) => DetailsForm(),
      },
    );
  }
}
