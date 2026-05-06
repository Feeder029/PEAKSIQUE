import 'package:flutter/material.dart';
import 'package:peaksique/pages/splash_screen.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.black, // bottom bar color
      systemNavigationBarIconBrightness: Brightness.light, // icons = white
      statusBarColor: Colors.transparent, // optional (top bar)
      statusBarIconBrightness: Brightness.light,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: HomePage()
      home: SplashScreen()
    );
  }
}