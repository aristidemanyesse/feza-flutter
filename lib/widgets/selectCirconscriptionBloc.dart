import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yebhofon/models/UtilisateurModel.dart';
import 'package:yebhofon/provider/UtilisateurProvider.dart';
import 'package:yebhofon/widgets/circonscriptionChoicesDialog.dart';

class SelectCirconscriptionBloc extends StatefulWidget {
  const SelectCirconscriptionBloc({Key? key}) : super(key: key);

  @override
  State<SelectCirconscriptionBloc> createState() =>
      _SelectCirconscriptionBlocState();
}

class _SelectCirconscriptionBlocState extends State<SelectCirconscriptionBloc> {
  late UtilisateurModel user;
  _SelectCirconscriptionBlocState();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
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
    setState(() {
      user = users[0];
    });
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
                user.circonscription!.name,
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
