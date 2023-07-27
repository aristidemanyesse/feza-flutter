import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class ConnexionController extends GetxController {
  RxBool isConnected = true.obs;

  void onInit() async {
    isConnected.value = await InternetConnectionChecker().hasConnection;
    execute();
    super.onInit();
  }

  Future<void> execute() async {
    InternetConnectionChecker().onStatusChange.listen(
      (InternetConnectionStatus status) {
        switch (status) {
          case InternetConnectionStatus.connected:
            isConnected.value = true;
            break;
          case InternetConnectionStatus.disconnected:
            isConnected.value = false;
            break;
        }
      },
    );
  }
}
