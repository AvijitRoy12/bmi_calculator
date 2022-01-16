import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'first_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp],);
  runApp(BMICalculator());
}

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF363636),
        scaffoldBackgroundColor: Color(0xFF262424),
      ),
      home: FirstPage(),
    );
  }
}
