import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:interiori/controller/designer_controller.dart';
import 'package:interiori/controller/gallery_design_controller.dart';
import 'package:interiori/style/color.dart';
import 'package:interiori/style/component.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class DesignerDetailPage extends StatelessWidget {
  DesignerController designerController = Get.put(DesignerController());
  GalleryDesignController galleryDesignController =
      Get.put(GalleryDesignController());

  String linkImage = 'http://c63e71fa2df1.ngrok.io/images/user/';
  String linkImagePost = 'http://c63e71fa2df1.ngrok.io/images/post/';
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
                            onChanged: (value) {},
                            bgColor: Colors.white,
                            iconColor: Color(0XFF727272),
                          ),
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        SvgPicture.asset('assets/images/icon_add.svg'),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Obx(() {
                      if (designerController.isLoading.value) {
                        return Container(
                          margin: EdgeInsets.all(16),
                        );
                      } else {
                        return Container(
                          margin: EdgeInsets.only(bottom: 14),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: 54,
                                    width: 54,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(23),
                                      child: Hero(
                                        tag: designerController
                                            .listDetailDesainer
                                            .value
                                            .data
                                            .image,
                                        child: Image.network(
                                          '$linkImage${designerController.listDetailDesainer.value.data.image}',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${designerController.listDetailDesainer.value.data.fullName}',
                                        style:
                                            TextStyle(color: Color(0XFF727272)),
                                      ),
                                      SizedBox(
                                        height: 9,
                                      ),
                                      Row(
                                        children: [
                                          GestureDetector(
                                            onTap: () {},
                                            child: SvgPicture.asset(
                                                'assets/images/icon_skype_designer.svg'),
                                          ),
                                          SizedBox(
                                            width: 14,
                                          ),
                                          SvgPicture.asset(
                                              'assets/images/icon_wa_designer.svg'),
                                          SizedBox(
                                            width: 14,
                                          ),
                                          SvgPicture.asset(
                                              'assets/images/icon_email_designer.svg'),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    '4.5 / 5.0\nFrom Customer',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: Color(0XFF727272)),
                                  ),
                                  Container(
                                    height: 14,
                                    width: 1,
                                    color: Color(0XFF727272),
                                  ),
                                  Text(
                                    '148\nOrdered',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: Color(0XFF727272)),
                                  ),
                                  Container(
                                    height: 14,
                                    width: 1,
                                    color: Color(0XFF727272),
                                  ),
                                  Text(
                                    '100\nFollowers',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: Color(0XFF727272)),
                                  )
                                ],
                              )
                            ],
                          ),
                        );
                      }
                    }),
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
                    return Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: GridView.builder(
                          itemCount: designerController
                              .listDetailDesainerPost.value.data.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 20,
                            crossAxisSpacing: 20,
                            childAspectRatio: 0.75,
                          ),
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                galleryDesignController.getDetailPage(
                                    designerController.listDetailDesainerPost
                                        .value.data[index].id);
                              },
                              child: Container(
                                margin: EdgeInsets.only(left: 3, right: 3),
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
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Container(
                                      height: 130,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(23),
                                        child: Hero(
                                          tag: designerController
                                              .listDetailDesainerPost
                                              .value
                                              .data[index]
                                              .image,
                                          child: Image.network(
                                            '$linkImagePost${designerController.listDetailDesainerPost.value.data[index].image}',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 11,
                                    ),
                                    Center(
                                      child: Text(
                                          '${designerController.listDetailDesainerPost.value.data[index].name}'),
                                    ),
                                    SizedBox(
                                      height: 18,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SmoothStarRating(
                                            allowHalfRating: true,
                                            starCount: 5,
                                            rating: designerController
                                                .listDetailDesainerPost
                                                .value
                                                .data[index]
                                                .rate,
                                            size: 20,
                                            color: Color(0XFFFFD700),
                                            borderColor: Color(0XFFFFD700),
                                            isReadOnly: true,
                                            spacing: 0.0),
                                        SizedBox(
                                          width: 6,
                                        ),
                                        Text(
                                            '${designerController.listDetailDesainerPost.value.data[index].vote} Users')
                                      ],
                                    ),
                                    SizedBox(
                                      height: 16,
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.only(left: 16, right: 16),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Text(
                                              '${designerController.listDetailDesainerPost.value.data[index].saved}'),
                                          SizedBox(
                                            width: 6,
                                          ),
                                          SvgPicture.asset(
                                              'assets/images/icon_save.svg'),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
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
