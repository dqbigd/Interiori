import 'package:get/get.dart';
import 'package:interiori/model/gallery_design_model.dart';
import 'package:interiori/network/api_network.dart';
import 'package:interiori/utils/shared_preferences_manager.dart';

class DesignerController extends GetxController {
  SharedPreferencesManager prefs = SharedPreferencesManager();
  ApiNetwork apiNetwork = ApiNetwork();

  var isLoading = false.obs;
  var listDesainer = GalleryDesignResponse().obs;

  // @override
  // void onInit() {
  //   TODO: implement onInit
  //
  //   super.onInit();
  // }

  getDesignerData() async {
    // isLoading(true);
    //
    // try {
    //   GalleryDesignResponse response = await apiNetwork.galleryDesign();
    //
    //   if (response != null) {
    //     print('length : ' + response.data.length.toString());
    //
    //     listGalleryDesign.value = response;
    //     print(listGalleryDesign.value);
    //     print('length2 : ' + listGalleryDesign.value.data.length.toString());
    //   }
    // } finally {
    //   isLoading(false);
    // }
  }

  getDetailPage(var id) async {
    // Get.to(GalleryDesignDetailPage());
    // isLoading(true);
    //
    // try {
    //   GalleryDesignDetailResponse response =
    //   await apiNetwork.galleryDesignDetail('$id');
    //
    //   if (response != null) {
    //     // print('length : ' + response.data.length.toString());
    //
    //     listGalleryDesignDetail.value = response;
    //     // print('length2 : ' + listGalleryDesign.value.data.length.toString());
    //   }
    // } finally {
    //   isLoading(false);
    // }
  }
}
