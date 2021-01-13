import 'package:get/get.dart';
import 'package:interiori/model/designer_model.dart';
import 'package:interiori/network/api_network.dart';
import 'package:interiori/utils/shared_preferences_manager.dart';
import 'package:interiori/view/designer/designer_detail_page.dart';

class DesignerController extends GetxController {
  SharedPreferencesManager prefs = SharedPreferencesManager();
  ApiNetwork apiNetwork = ApiNetwork();

  var isLoading = false.obs;
  var listDesainer = DesignerResponse().obs;
  var listDetailDesainer = DesignerDetailResponse().obs;
  var listDetailDesainerPost = DesignerDetailPostResponse().obs;

  @override
  void onInit() {
    // TODO: implement onInit
    getDesignerData();
    super.onInit();
  }

  getDesignerData() async {
    isLoading(true);

    try {
      DesignerResponse response = await apiNetwork.designer();

      if (response != null) {
        // print('length : ' + response.data.length.toString());

        listDesainer.value = response;
        // print('length2 : ' + listDesainer.value.data.length.toString());
      }
    } finally {
      isLoading(false);
    }
  }

  getDetailPage(var id) async {
    // print(id);
    Get.to(DesignerDetailPage());
    isLoading(true);

    try {
      DesignerDetailResponse response = await apiNetwork.designerDetail('$id');
      DesignerDetailPostResponse response2 =
          await apiNetwork.designerDetailPost('$id');

      if (response != null && response2 != null) {
        listDetailDesainer.value = response;
        listDetailDesainerPost.value = response2;
      }
    } finally {
      isLoading(false);
    }
  }
}
