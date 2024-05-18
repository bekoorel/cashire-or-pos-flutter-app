import 'package:flutter/material.dart';
import 'package:possingle/pos.dart';
import 'package:possingle/printpos.dart';
import 'package:possingle/splash.dart';

import 'widgthis.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/splash",
      routes: {
        "/pos": (context) => pos(),
        "/posprint": (context) => printpos(),
        "/splash": (context) => splash(),
        "/widgthis": ((context) => widgthis())
      },
    );
  }
}
