import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:interiori/controller/gallery_design_controller.dart';
import 'package:interiori/controller/home_controller.dart';
import 'package:interiori/style/color.dart';
import 'package:interiori/style/component.dart';
import 'package:interiori/utils/shared_preferences_manager.dart';
import 'package:interiori/view/saved/saved_page.dart';

import 'designer/designer_page.dart';
import 'gallery_design/gallery_design_page.dart';

class HomePage extends StatelessWidget {
  SharedPreferencesManager prefs = SharedPreferencesManager();
  HomeController homeController = Get.put(HomeController());
  GalleryDesignController galleryDesignController =
      Get.put(GalleryDesignController());

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
              Stack(children: [
                Container(
                  padding:
                      EdgeInsets.only(left: 16, right: 16, top: 20, bottom: 31),
                  // decoration: BoxDecoration(boxShadow: BoxShadow() ),
                  color: Color(0XFFDAE3F3),
                  width: double.infinity,
                  child: Image.asset(
                    'assets/images/bg_home.png',
                  ),
                ),
                SafeArea(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.1,
                            right: MediaQuery.of(context).size.width * 0.1,
                            top: 24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Have a nice day',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                      fontSize: 30, color: Color(0XFF727272)),
                                ),
                                PopUpMenu(),
                              ],
                            ),
                            Obx(() {
                              return Text(
                                '${homeController.user.value}',
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0XFF727272)),
                              );
                            }),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 28,
                      ),
                      Center(
                        child: RoundedInputField(
                          hintText: "Search",
                          bgColor: Colors.white,
                          icon: Icons.search_rounded,
                          onChanged: (value) {},
                        ),
                      ),
                      SizedBox(
                        height: 67,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              galleryDesignController.getGalleryDesignData();
                              Get.to(GalleryDesignPage());
                            },
                            child: MenuCard(
                                title: 'Gallery Design',
                                image: 'assets/images/gallery.svg'),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.to(DesignerPage());
                            },
                            child: MenuCard(
                                title: 'Designer',
                                image: 'assets/images/designer.svg'),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 18,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              Get.to(SavedPage());
                            },
                            child: MenuCard(
                                title: 'Saved Design',
                                image: 'assets/images/save_design.svg'),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.to(SavedPage());
                            },
                            child: MenuCard(
                                title: 'Shop', image: 'assets/images/shop.svg'),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 24,
                      )
                    ],
                  ),
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}

class PopUpMenu extends StatelessWidget {
  HomeController homeController = Get.put(HomeController());
  // var noProposal = '';
  // var custCode = '';
  //
  // PopUpMenu(this.noProposal, this.custCode);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      offset: Offset(0, 100),
      icon: SvgPicture.asset('assets/images/logout.svg'),
      itemBuilder: (context) => [
        PopupMenuItem(
          value: 1,
          child: Text(
            "Logout",
            style: TextStyle(color: primaryColor),
          ),
          height: 20,
        ),
      ],
      onSelected: (value) {
        if (value == 1) {
          homeController.logout();
        }
      },
    );
  }
}
