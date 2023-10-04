import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ipi/models/ResponseModel.dart';
import 'package:ipi/models/UtilisateurModel.dart';
import 'package:ipi/provider/CommunicateProvider.dart';
import 'package:ipi/provider/UtilisateurProvider.dart';
import 'package:ipi/screens/menuScreen.dart';
import 'package:ipi/screens/sentOTPScreen.dart';
import 'package:ipi/widgets/pleaseWait.dart';

class UtilisateurController extends GetxController {
  final box = GetStorage();
  Rx<UtilisateurModel?> currentUser = Rx<UtilisateurModel?>(null);
  Rx<bool> valide = Rx<bool>(false);

  void onInit() async {
    String id = box.read('userId') ?? "";
    String imei = box.read('imei') ?? "";
    if (id.length > 4) {
      var datas = await UtilisateurProvider.all({"id": id, "imei": imei});
      currentUser.value = datas[0];
      valide.value = false;
    }
    ever(currentUser, (user) {
      box.write('userId', user?.id);
      box.write("imei", user?.imei);
    });
    super.onInit();
  }

  void createUser(String name, String contact) async {
    String? imei = box.read('imei');

    List<UtilisateurModel> users =
        await UtilisateurProvider.all({"contact": contact});
    if (users.isEmpty) {
      ResponseModel response = await UtilisateurProvider.create(
          {"contact": contact, "fullname": name, "imei": imei});
      if (response.ok) {
        currentUser.value = response.data;
        Get.back();
        Get.to(SendOTPScreen());
      } else {
        Get.snackbar(
            "Erreur", response.message ?? "Ouups, Veuillez recommencer !");
      }
    } else {
      currentUser.value = users[0];
      Get.back();
      Get.to(SendOTPScreen());
    }
  }

  void updateUser(
      {String name = "",
      String contact = "",
      redirect = true,
      isValide}) async {
    Get.dialog(PleaseWait(), barrierDismissible: false);

    Map<String, dynamic> datas = {};
    datas["fullname"] = name;
    datas["contact"] = contact;
    datas["id"] = currentUser.value?.id;
    datas["imei"] = currentUser.value?.imei;
    datas["circonscription"] = currentUser.value?.circonscription?.id ?? "";
    datas["isValide"] = isValide ?? currentUser.value?.isValide;
    ResponseModel response = await UtilisateurProvider.update(datas);
    if (response.ok) {
      var test = currentUser.value?.contact;
      currentUser.value = response.data;

      box.write('userId', currentUser.value?.id);
      box.write("imei", currentUser.value?.imei);

      if (redirect) {
        if (test == contact) {
          Get.off(MenuScreen());
        } else {
          CommunicateProvider.send_SMS({
            "number": currentUser.value?.contact,
            "message":
                "iPi - OTP - Bonjour, votre code OTP est: ${currentUser.value?.otp} ! Bonne santé !"
          });
          Get.off(SendOTPScreen());
        }
        Get.snackbar(
            "Félicitations", "Vos informations ont été changé avec succès !");
      }
    } else {
      Get.back();
      Get.snackbar(
          "Erreur", response.message ?? "Ouups, Veuillez recommencer !");
    }
  }
}
