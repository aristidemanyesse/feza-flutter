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
    produits.value = box.read("produits") ?? [];
    if (produits.length > 0) {
      nomsProduits.value = box.read("nomsProduits");
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
