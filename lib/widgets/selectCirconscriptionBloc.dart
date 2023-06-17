import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ipi/models/UtilisateurModel.dart';
import 'package:ipi/provider/UtilisateurProvider.dart';
import 'package:ipi/widgets/circonscriptionChoicesDialog.dart';

class SelectCirconscriptionBloc extends StatefulWidget {
  SelectCirconscriptionBloc({Key? key}) : super(key: key);

  @override
  State<SelectCirconscriptionBloc> createState() =>
      _SelectCirconscriptionBlocState();
}

class _SelectCirconscriptionBlocState extends State<SelectCirconscriptionBloc> {
  _SelectCirconscriptionBlocState();

  late String circonscription = "";

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void changeCirconscription() async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return CirconscriptionChoicesDialog();
      },
    );
    getData();
  }

  Future<void> getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString('userId');
    String uniq = await UtilisateurProvider.getUniqID();
    List<UtilisateurModel> users =
        await UtilisateurProvider.all({"id": userId, "imei": uniq});
    UtilisateurModel user = users[0];
    circonscription = user.circonscription!.name;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        changeCirconscription();
      },
      child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Row(
            children: [
              Text(
                circonscription,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 10,
              ),
              Icon(
                Icons.maps_home_work_outlined,
                size: 20,
              ),
            ],
          )),
    );
  }
}
