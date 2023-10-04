import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constraints.dart';
import 'Detailscreen.dart';
class SavedScreen extends StatefulWidget {
  const SavedScreen({super.key});

  @override
  State<SavedScreen> createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {
  List<Map<String, String>> savedData = [];

  @override
  void initState() {
    super.initState();
    _loadSavedData();
  }

  Future<void> _loadSavedData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? savedDataList = prefs.getStringList('savedData');

    if (savedDataList != null) {
      setState(() {
        savedData = savedDataList.map<Map<String, String>>((item) {
          List<String> parts = item.split('|');
          if (parts.length == 3 && parts[2] == 'true') {
            return {
              "image": parts[0],
              "title": parts[1],
            };
          }
          return {};
        }).where((item) => item.isNotEmpty).toList(); // Remove empty items
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kHomeBGColor,

      body: Column(
        children: [
          SizedBox(height: 40,),
          Container(
            margin: EdgeInsets.only(bottom: 10),
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "Saved",
                    style: TextStyle(fontSize: 20.0, color: kLightColor),
                  ),
                  TextSpan(text: " "),
                  TextSpan(
                    text: " Blogs",
                    style: TextStyle(
                        fontSize: 24.0,
                        color: kLightColor,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Divider(
            thickness: 2,
            color: kLightColor.withOpacity(0.6),
          ),
          Expanded(
            child: ListView.builder(

              itemCount: savedData.length, // Use the length of your saved data list
              itemBuilder: (context, index) {
                final savedItem = savedData[index];
                // Customize the tile widget based on your saved data
                return ListTile(
                  title: GestureDetector(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Detailscreen(
                        {
                          "image": savedItem["image"],
                          "title": savedItem["title"],
                        },
                      ),
                    )),
                    child: Stack(
                      children: [
                        Hero(
                          tag: "blogimage",
                          child: Container(
                            height: 252,
                            margin: EdgeInsets.only(bottom: 10),
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: kBoxColor,
                                  offset: Offset(0, 2),
                                  blurRadius: 2.0,
                                ),
                              ],
                              color: kLightColor,
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                image: NetworkImage(savedItem["image"]!),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(24),
                                bottomRight: Radius.circular(24),
                              ),
                              color: kHomeBGColor.withOpacity(0.3),
                            ),
                            padding: EdgeInsets.all(10.0),
                            margin: EdgeInsets.only(bottom: 10),
                            child: Text(
                              savedItem["title"]!,
                              style: TextStyle(
                                color: kLightColor,
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      )

    );
  }
}
