import 'dart:math';
import 'package:loading_animations/loading_animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:some/constraints.dart';
import 'Detailscreen.dart';
import '../apidata.dart';
class Homescreen extends StatefulWidget {
  final apidata apiData; // Add this field

  Homescreen(this.apiData); // Modify the constructor

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {


  int selected = 0;
  List<String> category = [
    "All",
    "Fashion",
    "Education",
    "Political",
    "Tourism",
    "Technology",
    "Health",
    "Sports",
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: kHomeBGColor,
      body: Container(
        padding:
            EdgeInsets.only(top: 50.0, left: 24.0, right: 24.0, bottom: 0.0),
        color: kHomeBGColor,
        // margin: EdgeInsets.all(5),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset(
                    "assets/images/pro.jpeg",
                    height: 60.0,
                    width: 60.0,
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Text(
                    "Hey, Arnav",
                    style: TextStyle(
                        fontFamily: "Mulish-Bold",
                        fontSize: 17,
                        color: kLightColor),
                  ),
                ),
                Icon(CupertinoIcons.bell_solid, color: kLightColor)
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 180.0),
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "Trending",
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
            SizedBox(
              height: 28,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                    category.length,
                    (index) => GestureDetector(
                          onTap: () => setState(() {
                            selected = index;
                          }),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(right: 15.0, left: 15.0),
                            child: Column(
                              children: [
                                Text(
                                  category[index],
                                  style: TextStyle(
                                    color: selected == index
                                        ? kLightColor
                                        : kLightColor.withOpacity(0.4),
                                    fontSize: 15,
                                    fontWeight: selected == index
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                                  ),
                                ),
                                Container(
                                  height: 4.0,
                                  width: 4.0,
                                  margin: EdgeInsets.only(top: 8),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4.0),
                                    color: selected == index
                                        ? kLightColor
                                        : kHomeBGColor,
                                  ),
                                )
                              ],
                            ),
                          ),
                        )),
              ),
            ),

            SizedBox(height: 20.0),

            Divider(
              height: 2.0,
              thickness: 1.0,
              color: kLightColor.withOpacity(0.2),
            ),

            SizedBox(height: 20.0),

            // Use FutureBuilder to fetch and display data
            FutureBuilder<void>(
              future: widget.apiData.fetchBlogs(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Container(
                    margin: EdgeInsets.only(top: 200),
                    child: LoadingBouncingGrid.square(
                      size: 100,
                      inverted: true,
                      backgroundColor: kLightColor,
                    ),
                  ); // Loading indicator
                } else if (snapshot.hasError) {
                  return Text(
                      'Error: ${snapshot.error}'); // Display error if any
                } else {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: widget.apiData.blogs.length,
                      itemBuilder: (context, index) {
                        final blog = widget.apiData.blogs[index];
                        // Customize the tile widget based on your data
                        return ListTile(
                          title: GestureDetector(
                            onTap: () =>
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => Detailscreen(
                                          {
                                            "image": blog.imageUrl,
                                            "title": blog.title,
                                          },
                                        ))),
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
                                          image: NetworkImage(blog.imageUrl),
                                          fit: BoxFit.cover,
                                        )),
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
                                          bottomRight: Radius.circular(24)),
                                      color: kHomeBGColor.withOpacity(0.3),
                                    ),
                                    padding: EdgeInsets.all(10.0),
                                    margin: EdgeInsets.only(bottom: 10),
                                    child: Text(
                                      blog.title,
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
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
