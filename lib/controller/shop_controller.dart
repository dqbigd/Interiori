import 'package:get/get.dart';
import 'package:interiori/model/shop_model.dart';
import 'package:interiori/network/api_network.dart';
import 'package:interiori/utils/shared_preferences_manager.dart';

class ShopController extends GetxController {
  SharedPreferencesManager prefs = SharedPreferencesManager();
  ApiNetwork apiNetwork = ApiNetwork();

  var isLoading = false.obs;
  var listShop = ShopResponse().obs;
  var listShopFiltered = ShopResponse().obs;

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
        listShopFiltered.value = response;
        // print(listGalleryDesign.value);
        // print('length2 : ' + listGalleryDesign.value.data.length.toString());
      }
    } finally {
      isLoading(false);
    }
  }

  getSearchData(String value) {
    print(value);

    // List<ShopData> listFiltered1 = listShop.value.data.where((shop) {
    //   var noteTitle = shop.name.toLowerCase();
    //   return noteTitle.contains(value);
    // }).toList();

    // print('lengh' + listShop.value.data.length.toString());

    for (var i = 0; i < listShop.value.data.length; i++) {
      // print('i' + i.toString());
      if (listShop.value.data[i].name
          .toLowerCase()
          .contains(value.toLowerCase())) {
        listShopFiltered.value = listShop.value;
      } else {
        listShopFiltered.value = null;
      }
    }

    // print(listShopFiltered.value.data[0].name);
    //
    // print(listFiltered1.);
    // listShopFiltered.value.data = listShop.value.data
    //     .where((u) => (u.name.toLowerCase().contains(value.toLowerCase())))
    //     .toList();
    // listShopFiltered.refresh();

    print('shop' + listShop.value.data.length.toString());
    print('filter' + listShopFiltered.value.data.length.toString());
  }
}
