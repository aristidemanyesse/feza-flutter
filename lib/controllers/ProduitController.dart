import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ipi/models/produitApp/Produit.dart';

class ProduitController extends GetxController {
  final box = GetStorage();
  RxList<Produit> produits = RxList<Produit>([]);
  RxList<Produit> produitsSelected = RxList<Produit>([]);
  RxMap<Produit, int> quantiteProduitsSelected = RxMap<Produit, int>({});
  RxList<String> nomsProduits = RxList<String>([]);

  RxBool ready = false.obs;

  void onInit() async {
    produits.value = await Produit.all({});
    for (Produit item in produits) {
      nomsProduits.add(item.name);
    }
    box.write("produits", produits);
    box.write("nomsProduits", nomsProduits);

    if (nomsProduits.length > 0) {
      ready.value = true;
    }
    super.onInit();
  }

  void removeProduitSelected(Produit produit) {
    produitsSelected.removeWhere((item) => item.id == produit.id);
    quantiteProduitsSelected.remove(produit);
  }

  void addProduitSelected(Produit produit) {
    if (!produitsSelected.contains(produit)) {
      quantiteProduitsSelected[produit] = 1;
      produitsSelected.add(produit);
    }
  }
}
