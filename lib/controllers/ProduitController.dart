import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ipi/models/ProduitModel.dart';
import 'package:ipi/provider/ProduitProvider.dart';

class ProduitController extends GetxController {
  final box = GetStorage();
  RxList<ProduitModel> produits = RxList<ProduitModel>([]);
  RxList<ProduitModel> produitsSelected = RxList<ProduitModel>([]);
  RxList<String> nomsProduits = RxList<String>([]);

  RxBool ready = false.obs;

  void onInit() async {
    List<dynamic> datas = box.read("produits") ?? [];
    // produits.value = box.read("produits") ?? [];
    if (datas.length > 0) {
      for (var elt in datas) {
        produits.add(ProduitModel.fromJson(elt));
        nomsProduits.add(elt["name"]);
      }
    } else {
      produits.value = await ProduitProvider.all({});
      for (ProduitModel item in produits) {
        nomsProduits.add(item.name);
      }
      box.write("produits", produits);
      box.write("nomsProduits", nomsProduits);
    }

    if (nomsProduits.length > 0) {
      ready.value = true;
    }
    super.onInit();
  }

  void removeProduitSelected(ProduitModel produit) {
    produitsSelected.removeWhere((item) => item.id == produit.id);
  }

  void addProduitSelected(ProduitModel produit) {
    produitsSelected.add(produit);
  }
}
