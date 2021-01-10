import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:interiori/controller/gallery_design_controller.dart';

class GalleryDesignDetailPage extends StatelessWidget {
  GalleryDesignController galleryDesignController =
      Get.put(GalleryDesignController());

  String linkImage = 'http://c63e71fa2df1.ngrok.io/images/post/';

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
          body: Obx(() {
            if (galleryDesignController.isLoading.value) {
              return Container(
                  margin: EdgeInsets.only(top: 60),
                  child: Center(child: CircularProgressIndicator()));
            } else {
              return Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Container(
                        height: MediaQuery.of(context).size.height / 2,
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(23),
                              bottomLeft: Radius.circular(23)),
                          child: Hero(
                            tag: galleryDesignController
                                .listGalleryDesignDetail.value.data.image,
                            child: Image.network(
                              '$linkImage${galleryDesignController.listGalleryDesignDetail.value.data.image}',
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(25, 32, 25, 19),
                        child: Text(
                          '${galleryDesignController.listGalleryDesignDetail.value.data.name}',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 25, left: 25),
                        child: Text(
                            '${galleryDesignController.listGalleryDesignDetail.value.data.description}'),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                                onTap: () {},
                                child: SvgPicture.asset(
                                    'assets/images/icon_skype.svg')),
                            GestureDetector(
                                onTap: () {},
                                child: SvgPicture.asset(
                                    'assets/images/icon_whatsapp.svg')),
                            GestureDetector(
                                onTap: () {},
                                child: SvgPicture.asset(
                                    'assets/images/icon_email.svg'))
                          ],
                        ),
                      )
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 30, left: 16, right: 16),
                    padding: EdgeInsets.only(
                        top: 10, left: 13, right: 19, bottom: 10),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(.7),
                      borderRadius: BorderRadius.circular(23),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        Container(
                          padding: EdgeInsets.fromLTRB(8, 1, 3, 3),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(.7),
                            borderRadius: BorderRadius.circular(23),
                          ),
                          child: Row(
                            children: [
                              Text(
                                  '${galleryDesignController.listGalleryDesignDetail.value.data.id}'),
                              SizedBox(
                                width: 3,
                              ),
                              SvgPicture.asset('assets/images/icon_star.svg'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height / 2.4,
                          left: MediaQuery.of(context).size.width - 70,
                          right: 16),
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(.8),
                        borderRadius: BorderRadius.circular(23),
                      ),
                      child:
                          SvgPicture.asset('assets/images/icon_bookmark.svg')),
                ],
              );
            }
          }),
        ));
  }
}
