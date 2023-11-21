import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ipi/models/communicateApp/SMS.dart';
import 'package:ipi/models/coreApp/ResponseModel.dart';
import 'package:ipi/models/userApp/Utilisateur.dart';
import 'package:ipi/screens/menuScreen.dart';
import 'package:ipi/screens/sentOTPScreen.dart';
import 'package:ipi/widgets/pleaseWait.dart';

class UtilisateurController extends GetxController {
  final box = GetStorage();
  Rx<Utilisateur?> currentUser = Rx<Utilisateur?>(null);
  Rx<bool> valide = Rx<bool>(false);

  void onInit() async {
    String id = box.read('userId') ?? "";
    String imei = box.read('imei') ?? "";
    if (id.length > 4) {
      var datas = await Utilisateur.all({"id": id, "imei": imei});
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

    List<Utilisateur> users = await Utilisateur.all({"contact": contact});
    if (users.isEmpty) {
      ResponseModel response = await Utilisateur.create(
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
    Get.dialog(
        PleaseWait(
          title: "Mise à jour des informations",
          message: "veuillez patienter ...",
        ),
        barrierDismissible: false);

    Map<String, dynamic> datas = {};
    datas["fullname"] = name;
    datas["contact"] = contact;
    datas["id"] = currentUser.value?.id;
    datas["imei"] = currentUser.value?.imei;
    datas["circonscription"] = currentUser.value?.circonscription?.id ?? "";
    datas["isValide"] = isValide ?? currentUser.value?.isValide;
    ResponseModel response = await Utilisateur.update(datas);
    if (response.ok) {
      var test = currentUser.value?.contact;
      currentUser.value = response.data;

      box.write('userId', currentUser.value?.id);
      box.write("imei", currentUser.value?.imei);

      if (redirect) {
        if (test == contact) {
          Get.off(MenuScreen());
        } else {
          SMS.send_SMS({
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
