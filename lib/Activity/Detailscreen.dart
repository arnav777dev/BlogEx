import 'dart:ffi';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:some/constraints.dart';
import 'package:some/apidata.dart';
import 'package:some/SavedData.dart';



class Detailscreen extends StatefulWidget {
  final Map<String?, String?> data;

  Detailscreen(this.data);

  @override
  _DetailscreenState createState() => _DetailscreenState();
}

class _DetailscreenState extends State<Detailscreen> {
  bool isSaved = false;

  @override
  void initState() {
    super.initState();
    // Check if the item is already saved when the screen is first loaded
    // _checkSavedStatus();
  }

  // Future<void> _checkSavedStatus() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String? savedImageUrl = prefs.getString('savedImageUrl');
  //   String? savedTitle = prefs.getString('savedTitle');
  //
  //   if (savedImageUrl == widget.data["image"] &&
  //       savedTitle == widget.data["title"]) {
  //     setState(() {
  //       isSaved = true;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    // The build method remains the same as in your original code
    // ...
    final savedData = Provider.of<SavedData>(context);
    return Scaffold(
      backgroundColor: kDescBGColor,
      body: Column(
        children: [
          Stack(children: [
            Hero(
              tag: "blogimage",
              child: Image.network(
                widget.data["image"] ?? "",
                height: 300,
                fit: BoxFit.cover,
              ),
              flightShuttleBuilder: (BuildContext flightContext,
                  Animation<double> animation,
                  HeroFlightDirection flightDirection,
                  BuildContext fromHeroContext,
                  BuildContext toHeroContext) {
                // Adjust the animation duration as needed to make it slower
                const Duration _kHeroFlightDuration =
                Duration(milliseconds: 1000);
                return AnimatedBuilder(
                  animation: animation,
                  builder: (BuildContext context, Widget? child) {
                    return Opacity(
                      opacity: animation.value,
                      child: child,
                    );
                  },
                );
              },
            ),
            Positioned(
              top: 10,
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 40, left: 10),
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                        color: kButtonBGColor.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(100)),
                    child: GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: Icon(
                        Icons.arrow_back,
                        size: 30,
                        color: kLightColor,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 40, left: 320),
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: kButtonBGColor.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: GestureDetector(
                      onTap: () async {
                        SharedPreferences prefs = await SharedPreferences.getInstance();
                        List<String>? savedData = prefs.getStringList('savedData') ?? [];

                        // Get the current status of isSaved
                        isSaved = savedData.contains("${widget.data["image"]}|${widget.data["title"]}|true");

                        if (!isSaved) {
                          // Save the data along with the isSaved status
                          savedData.add("${widget.data["image"]}|${widget.data["title"]}|true");
                          await prefs.setStringList('savedData', savedData);
                        } else {
                          // Remove the saved data if it's already saved
                          savedData.remove("${widget.data["image"]}|${widget.data["title"]}|true");
                          await prefs.setStringList('savedData', savedData);
                        }

                        setState(() {
                          isSaved = isSaved ? false : true; // Toggle the isSaved status
                        });
                      },
                      child: Icon(
                        isSaved ? Icons.bookmark : Icons.bookmark_add_outlined,
                        size: 30,
                        color: kLightColor,
                      ),
                    ),

                  )
                ],
              ),
            ),
          ]),
          // SizedBox(height: 20,),

          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 24.0),
                child: Column(
                  children: [
                    Text(
                      widget.data["title"]!,
                      style: TextStyle(
                          fontSize: 25,
                          color: kLightColor,
                          fontFamily: "Mulish",
                          fontWeight: FontWeight.bold),
                      softWrap: true,
                    ),
                    Divider(
                      thickness: 1,
                      color: kLightColor.withOpacity(0.2),
                      height: 32,
                    ),
                    Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusm"
                          "od tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim ve"
                          "niam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo"
                          " consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillu"
                          "m dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, s"
                          "unt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusm"
                          "od tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim ve"
                          "niam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo"
                          " consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillu"
                          "m dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, s"
                          "unt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusm"
                          "od tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim ve"
                          "niam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo"
                          " consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillu"
                          "m dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, s"
                          "unt in culpa qui officia deserunt mollit anim id est laborum.",
                      style: TextStyle(
                          color: kLightColor.withOpacity(0.8),
                          fontFamily: "Muish_SemiBold",
                          fontSize: 15),
                    ),
                    Divider(
                      thickness: 1,
                      color: kLightColor.withOpacity(0.2),
                      height: 32,
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}











