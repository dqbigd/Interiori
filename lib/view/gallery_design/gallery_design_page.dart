import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:interiori/controller/gallery_design_controller.dart';
import 'package:interiori/style/color.dart';
import 'package:interiori/style/component.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class GalleryDesignPage extends StatelessWidget {
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
                              galleryDesignController.searchValue.value = value;
                              // print('value = ' +
                              //     galleryDesignController.searchValue.value);
                              // galleryDesignController.getSearchData(value);
                            },
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
                        'Gallery Design',
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
                  if (galleryDesignController.isLoading.value) {
                    return Container(
                        margin: EdgeInsets.only(top: 60),
                        child: Center(child: CircularProgressIndicator()));
                  } else {
                    return Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Obx(() {
                          return GridView.builder(
                            itemCount: galleryDesignController
                                .listGalleryDesign.value.data
                                .where((u) => (u.name.toLowerCase().contains(
                                    galleryDesignController.searchValue.value
                                        .toLowerCase())))
                                .toList()
                                .length,
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
                                      galleryDesignController
                                          .listGalleryDesign.value.data
                                          .where((u) => (u.name
                                              .toLowerCase()
                                              .contains(galleryDesignController
                                                  .searchValue.value
                                                  .toLowerCase())))
                                          .toList()
                                          .asMap()[index]
                                          .id);
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
                                          borderRadius:
                                              BorderRadius.circular(23),
                                          child: Hero(
                                            tag: galleryDesignController
                                                .listGalleryDesign.value.data
                                                .where((u) => (u.name
                                                    .toLowerCase()
                                                    .contains(
                                                        galleryDesignController
                                                            .searchValue.value
                                                            .toLowerCase())))
                                                .toList()
                                                .asMap()[index]
                                                .image,
                                            child: Image.network(
                                              '$linkImage${galleryDesignController.listGalleryDesign.value.data.where((u) => (u.name.toLowerCase().contains(galleryDesignController.searchValue.value.toLowerCase()))).toList().asMap()[index].image}',
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
                                            '${galleryDesignController.listGalleryDesign.value.data.where((u) => (u.name.toLowerCase().contains(galleryDesignController.searchValue.value.toLowerCase()))).toList().asMap()[index].name}'),
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
                                              rating: galleryDesignController
                                                  .listGalleryDesign.value.data
                                                  .where((u) => (u.name
                                                      .toLowerCase()
                                                      .contains(
                                                          galleryDesignController
                                                              .searchValue.value
                                                              .toLowerCase())))
                                                  .toList()
                                                  .asMap()[index]
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
                                              '${galleryDesignController.listGalleryDesign.value.data.where((u) => (u.name.toLowerCase().contains(galleryDesignController.searchValue.value.toLowerCase()))).toList().asMap()[index].vote} Users')
                                        ],
                                      ),
                                      SizedBox(
                                        height: 16,
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                            left: 16, right: 16),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Text(
                                                '${galleryDesignController.listGalleryDesign.value.data.where((u) => (u.name.toLowerCase().contains(galleryDesignController.searchValue.value.toLowerCase()))).toList().asMap()[index].saved}'),
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
                          );
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
