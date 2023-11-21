import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ipi/const/colors.dart';
import 'package:ipi/controllers/UserController.dart';
import 'package:ipi/models/officineApp/Circonscription.dart';
import 'package:ipi/widgets/zoneChoicesDialog.dart';

class SelectCirconscriptionBloc extends StatefulWidget {
  SelectCirconscriptionBloc({Key? key}) : super(key: key);

  @override
  State<SelectCirconscriptionBloc> createState() =>
      _SelectCirconscriptionBlocState();
}

class _SelectCirconscriptionBlocState extends State<SelectCirconscriptionBloc> {
  UtilisateurController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      Circonscription? circonscription =
          controller.currentUser.value?.circonscription;
      return GestureDetector(
        onTap: () {
          Get.dialog(CirconscriptionChoicesDialog());
        },
        child: Container(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              circonscription?.name ?? "",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColor.blue),
            ),
            SizedBox(
              width: 10,
            ),
            Icon(Icons.maps_home_work_outlined, size: 20, color: AppColor.blue),
          ],
        )),
      );
    });
  }
}
