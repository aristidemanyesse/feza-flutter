import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ipi/controllers/AppController.dart';
import 'package:ipi/widgets/produitsSection.dart';
import 'package:ipi/widgets/zoneSection.dart';

class SearchBottomSheetController extends GetxController {
  RxInt page = 0.obs;
}

class SearchBottomSheet extends StatefulWidget {
  SearchBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  State<SearchBottomSheet> createState() => SearchBottomSheetState();
}

class SearchBottomSheetState extends State<SearchBottomSheet> {
  SearchBottomSheetState();

  SearchBottomSheetController controller = Get.find();
  AppController appController = Get.find();
  double taille = 0.38;

  var _controller = new PageController();
  final List<Widget> _pages = [
    ZoneSection(),
    ProduitsSection(),
  ];

  @override
  void initState() {
    controller.page.value = 0;
    super.initState();

    ever(controller.page, (value) async {
      _controller.animateToPage(
        controller.page.value,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: (868 * 0.3) / Get.size.height,
      minChildSize: (868 * 0.3) / Get.size.height,
      builder: (context, scrollController) {
        return Center(
          child: Container(
            padding: EdgeInsets.only(top: 10),
            decoration: new BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40), topRight: Radius.circular(40)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade400.withOpacity(0.5),
                  blurRadius: 5.0,
                )
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40), topRight: Radius.circular(40)),
              child: Container(
                color: Color.fromARGB(255, 245, 239, 235),
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                child: PageView(
                  controller: _controller,
                  children: _pages,
                  onPageChanged: (value) {
                    controller.page.value = value;
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
