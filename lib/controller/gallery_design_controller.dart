import 'package:get/get.dart';
import 'package:interiori/model/gallery_design_model.dart';
import 'package:interiori/network/api_network.dart';
import 'package:interiori/utils/shared_preferences_manager.dart';
import 'package:interiori/view/gallery_design/gallery_design_detail_page.dart';

class GalleryDesignController extends GetxController {
  SharedPreferencesManager prefs = SharedPreferencesManager();
  ApiNetwork apiNetwork = ApiNetwork();

  var isLoading = false.obs;
  var listGalleryDesign = GalleryDesignResponse().obs;
  var listGalleryDesignFiltered = GalleryDesignResponse().obs;
  var listGalleryDesignDetail = GalleryDesignDetailResponse().obs;
  var searchValue = ''.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    getGalleryDesignData();
    super.onInit();
  }

  getGalleryDesignData() async {
    isLoading(true);

    try {
      GalleryDesignResponse response = await apiNetwork.galleryDesign();

      if (response != null) {
        // print('length : ' + response.data.length.toString());

        listGalleryDesign.value = response;
        listGalleryDesignFiltered.value = response;

        // print(listGalleryDesign.value);
        // print('length2 : ' + listGalleryDesign.value.data.length.toString());
      }
    } finally {
      isLoading(false);
    }
  }

  getDetailPage(var id) async {
    Get.to(GalleryDesignDetailPage());
    isLoading(true);

    try {
      GalleryDesignDetailResponse response =
          await apiNetwork.galleryDesignDetail('$id');

      if (response != null) {
        // print('length : ' + response.data.length.toString());

        listGalleryDesignDetail.value = response;
        // print('length2 : ' + listGalleryDesign.value.data.length.toString());
      }
    } finally {
      isLoading(false);
    }
  }

  getSearchData(String value) {
    print(value);

    print('sort ' +
        listGalleryDesign.value.data
            .where((u) => (u.name.toLowerCase().contains(value.toLowerCase())))
            .toList()
            .length
            .toString());
    // update();
    print('name ' +
        listGalleryDesign.value.data
            .where((u) => (u.name.toLowerCase().contains(value.toLowerCase())))
            .toList()
            .asMap()[0]
            .name);

    // for (var i = 0; i < listGalleryDesign.value.data.length; i1++) {
    //   // print('i' + i.toString());
    //   if (listGalleryDesign.value.data[i].name
    //       .toLowerCase()
    //       .contains(value.toLowerCase())) {
    //     listGalleryDesignFiltered.value.data[i] =
    //         listGalleryDesign.value.data[i];
    //   } else {
    //     listGalleryDesignFiltered.value = null;
    //   }
    // }
    print('l1' + listGalleryDesignFiltered.value.data.length.toString());
    print('l2' + listGalleryDesign.value.data.length.toString());
  }
}
