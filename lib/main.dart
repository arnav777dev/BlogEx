import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Import Provider
import 'Activity/BottomNavBar.dart';
import 'package:some/constraints.dart';
import 'SavedData.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider( // Add the ChangeNotifierProvider here
      create: (_) => SavedData(), // Initialize SavedData
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'BlogEx',
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: kHomeBGColor),
            useMaterial3: false,
            fontFamily: "Mulish"
        ),
        home: BottomNavBar(),
      ),
    );
  }
}
