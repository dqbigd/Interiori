import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:interiori/style/color.dart';
import 'package:interiori/style/component.dart';

class DesignerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          systemNavigationBarColor: Color(0xFF000000),
          systemNavigationBarDividerColor: null,
          statusBarColor: Color(0x00000000),
          systemNavigationBarIconBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
        child: Scaffold(
          backgroundColor: Color(0XFFF6F6F6),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  color: primaryLightColor,
                  padding: EdgeInsets.only(top: 24, right: 16, left: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                              onTap: () {
                                Get.back();
                              },
                              child: SvgPicture.asset(
                                  'assets/images/icon_back.svg')),
                          SizedBox(
                            width: 12,
                          ),
                          SizedBox(
                            height: 65,
                            width: 325,
                            child: RoundedInputField(
                              hintText: "Search",
                              icon: Icons.search,
                              onChanged: (value) {},
                              bgColor: Colors.white,
                              iconColor: Color(0XFF727272),
                            ),
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          SvgPicture.asset('assets/images/icon_save.svg'),
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 8),
                        child: Text(
                          'Designer',
                          style: TextStyle(
                            fontSize: 25,
                            color: Color(0XFF727272),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Categories(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<String> categories = [
    "All",
    "Recommend",
    "Industrial",
    "Minimalist",
    "Vintage"
  ];
  // By default our first item will be selected
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16), //20.0
      child: SizedBox(
        height: 25,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) => buildCategory(index),
        ),
      ),
    );
  }

  Widget buildCategory(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              categories[index],
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: selectedIndex == index
                    ? Color(0XFF707070)
                    : Color(0XFF727272),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 16 / 4), //top padding 5
              height: 2,
              width: 30,
              color: selectedIndex == index
                  ? Color(0XFF707070)
                  : Colors.transparent,
            )
          ],
        ),
      ),
    );
  }
}
