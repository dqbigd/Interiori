import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:interiori/style/color.dart';
import 'package:interiori/style/component.dart';
import 'package:interiori/utils/shared_preferences_manager.dart';

class HomePage extends StatelessWidget {
  SharedPreferencesManager prefs = SharedPreferencesManager();

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
                                  'Good Morning',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                      fontSize: 30, color: Color(0XFF727272)),
                                ),
                                PopUpMenu(),
                              ],
                            ),
                            Text(
                              'User',
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0XFF727272)),
                            ),
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
                            onTap: () {},
                            child: MenuCard(
                                title: 'Gallery Design',
                                image: 'assets/images/gallery.svg'),
                          ),
                          GestureDetector(
                            onTap: () {
                              // Get.to(PurchaseOrderPage());
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
                              // relaxationVerificationController.getRelaxationData();
                              // Get.to(RelaxationVerificationPage());
                            },
                            child: MenuCard(
                                title: 'Saved Design',
                                image: 'assets/images/save_design.svg'),
                          ),
                          GestureDetector(
                            onTap: () {
                              // verificationNewCustomerController.getNewCustData();
                              // Get.to(VerificationNewCustomerPage());
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
        if (value == 1) {}
      },
    );
  }
}
