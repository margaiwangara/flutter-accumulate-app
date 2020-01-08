import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wakelock/wakelock.dart';
import 'package:accumulate/ui/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Wakelock.enable();
    // apptheme

    final ThemeData appTheme = ThemeData(
        primaryColor: Color(0xFF443742),
        accentColor: Color(0xFFCEA07E),
        textTheme: GoogleFonts.ralewayTextTheme(Theme.of(context).textTheme));
    return MaterialApp(
      title: "Accumulate",
      theme: appTheme,
      home: HomePage(),
    );
  }
}
