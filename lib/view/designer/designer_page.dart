import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:interiori/controller/designer_controller.dart';
import 'package:interiori/style/color.dart';
import 'package:interiori/style/component.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class DesignerPage extends StatelessWidget {
  DesignerController designerController = Get.put(DesignerController());

  String linkImage = 'http://c63e71fa2df1.ngrok.io/images/user/';

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
          backgroundColor: Colors.white,
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
                Obx(
                  () {
                    if (designerController.isLoading.value) {
                      return Container(
                          margin: EdgeInsets.only(top: 60),
                          child: Center(child: CircularProgressIndicator()));
                    } else {
                      return ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount:
                            designerController.listDesainer.value.data.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              designerController.getDetailPage(
                                  designerController
                                      .listDesainer.value.data[index].id);
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 8),
                              child: Container(
                                margin: EdgeInsets.only(left: 3, right: 3),
                                padding: EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(23),
                                  boxShadow: [
                                    BoxShadow(
                                      offset: Offset(1, 1),
                                      blurRadius: 8,
                                      color: Colors.black.withOpacity(.1),
                                    ),
                                  ],
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 74,
                                      width: 74,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(23),
                                        child: Hero(
                                          tag: designerController.listDesainer
                                              .value.data[index].image,
                                          child: Image.network(
                                            '$linkImage${designerController.listDesainer.value.data[index].image}',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.only(left: 21, right: 21),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                width: 60,
                                                child: Text(
                                                  'Name',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10,
                                                child: Text(
                                                  ':',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w300),
                                                ),
                                              ),
                                              Text(
                                                '${designerController.listDesainer.value.data[index].fullName}',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.w300),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                width: 60,
                                                child: Text(
                                                  'Ordered',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10,
                                                child: Text(
                                                  ':',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w300),
                                                ),
                                              ),
                                              Text(
                                                '98',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.w300),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                width: 60,
                                                child: Text(
                                                  'Rate',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10,
                                                child: Text(
                                                  ':',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w300),
                                                ),
                                              ),
                                              SmoothStarRating(
                                                  allowHalfRating: true,
                                                  starCount: 5,
                                                  rating: 3.5,
                                                  size: 20,
                                                  color: Color(0XFFFFD700),
                                                  borderColor:
                                                      Color(0XFFFFD700),
                                                  isReadOnly: true,
                                                  spacing: 0.0),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                width: 60,
                                                child: Text(
                                                  'Online',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10,
                                                child: Text(
                                                  ':',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w300),
                                                ),
                                              ),
                                              Text(
                                                '98',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.w300),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    }
                  },
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
