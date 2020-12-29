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
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
