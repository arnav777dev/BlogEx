import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:some/constraints.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kHomeBGColor,
      body: Center(
          child: Column(
        children: [
          SizedBox(height: 100,),
          Icon(
            Icons.person,
            size: 200,
            color: kLightColor.withOpacity(0.8),
          ),
          Text("Profile", style: TextStyle(fontSize: 20, fontFamily: "Muliish", fontWeight: FontWeight.bold, color: kLightColor.withOpacity(0.8)),)
        ],
      )),
    );
  }
}
