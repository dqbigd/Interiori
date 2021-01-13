import 'package:get/get.dart';
import 'package:interiori/model/shop_model.dart';
import 'package:interiori/network/api_network.dart';
import 'package:interiori/utils/shared_preferences_manager.dart';

class ShopController extends GetxController {
  SharedPreferencesManager prefs = SharedPreferencesManager();
  ApiNetwork apiNetwork = ApiNetwork();

  var isLoading = false.obs;
  var listShop = ShopResponse().obs;

  @override
  void onInit() {
    // TODO: implement onInit
    getShopData();
    super.onInit();
  }

  getShopData() async {
    isLoading(true);

    try {
      ShopResponse response = await apiNetwork.shopData();

      if (response != null) {
        // print('length : ' + response.data.length.toString());

        listShop.value = response;
        // print(listGalleryDesign.value);
        // print('length2 : ' + listGalleryDesign.value.data.length.toString());
      }
    } finally {
      isLoading(false);
    }
  }
}
