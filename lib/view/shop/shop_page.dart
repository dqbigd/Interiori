import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:interiori/controller/shop_controller.dart';
import 'package:interiori/style/color.dart';
import 'package:interiori/style/component.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class ShopPage extends StatelessWidget {
  ShopController shopController = Get.put(ShopController());

  String linkImage = 'http://c63e71fa2df1.ngrok.io/images/shop_image/';
  String linkImageLogo = 'http://c63e71fa2df1.ngrok.io/images/shop_logo/';

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
          body: Column(
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
                            onChanged: (value) {
                              shopController.getSearchData(value);
                            },
                            bgColor: Colors.white,
                            iconColor: Color(0XFF727272),
                          ),
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        // SvgPicture.asset('assets/images/icon_save.svg'),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 8),
                      child: Text(
                        'Shop',
                        style: TextStyle(
                          fontSize: 25,
                          color: Color(0XFF727272),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                  ],
                ),
              ),
              Obx(
                () {
                  if (shopController.isLoading.value) {
                    return Container(
                        margin: EdgeInsets.only(top: 60),
                        child: Center(child: CircularProgressIndicator()));
                  } else {
                    return Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Obx(() {
                          if (shopController.listShopFiltered.value.isNull) {
                            return Center(child: Text('Data Not Found'));
                          } else {
                            return Obx(() {
                              return GridView.builder(
                                itemCount: shopController
                                    .listShopFiltered.value.data.length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 20,
                                  crossAxisSpacing: 20,
                                  childAspectRatio: 0.75,
                                ),
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () async {
                                      var url =
                                          '${shopController.listShopFiltered.value.data[index].shopLink}';
                                      if (await canLaunch(url)) {
                                        await launch(url);
                                      } else {
                                        throw 'Could not launch $url';
                                      }
                                    },
                                    child: Container(
                                      margin:
                                          EdgeInsets.only(left: 3, right: 3),
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
                                      child: Column(
                                        // crossAxisAlignment:
                                        //     CrossAxisAlignment.stretch,
                                        children: [
                                          Stack(
                                            children: [
                                              Container(
                                                height: 192,
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  23),
                                                          topRight:
                                                              Radius.circular(
                                                                  23)),
                                                  child: Hero(
                                                    tag: shopController
                                                        .listShopFiltered
                                                        .value
                                                        .data[index]
                                                        .image,
                                                    child: Image.network(
                                                      '$linkImage${shopController.listShopFiltered.value.data[index].image}',
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                bottom: 0,
                                                child: Container(
                                                  padding: EdgeInsets.fromLTRB(
                                                      14, 4, 14, 8),
                                                  color: Colors.white
                                                      .withOpacity(0.7),
                                                  width: 192,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        '${shopController.listShopFiltered.value.data[index].name}',
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400),
                                                      ),
                                                      Text(
                                                          '${NumberFormat.currency(locale: 'id', symbol: 'Rp ', decimalDigits: 0).format(double.parse(shopController.listShop.value.data[index].price))}'),
                                                    ],
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                width: 38,
                                                height: 38,
                                                child: Image.network(
                                                  '$linkImageLogo${shopController.listShopFiltered.value.data[index].shopLogo}',
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 3,
                                              ),
                                              Text(
                                                  '${shopController.listShopFiltered.value.data[index].shopName}'),
                                            ],
                                          ),
                                          // SizedBox(
                                          //   height: 7,
                                          // ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            });
                          }
                        }),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ));
  }
}
