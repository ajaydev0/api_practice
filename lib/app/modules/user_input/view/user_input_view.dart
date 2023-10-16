import 'package:api_project/widget/Container_Widget.dart';
import 'package:api_project/widget/ElevatedButton_Widget.dart';
import 'package:api_project/widget/KAppBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../widget/AppSize_MediaQuery.dart';

import '../../../../widget/SizeBox_Widget.dart';
import '../../../../widget/TextField_Widget.dart';
import '../../MainApp/controllers/main_app_controller.dart';
import '../controller/user_input_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';

class UserInputView extends GetView<UserInputController> {
  const UserInputView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserInputController());
    return Scaffold(
      appBar: const KAppBar(title: "User Input"),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: controller.formKey,
            child: Obx(
              () => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Get.find<MainAppController>().theme.value
                      ? Kcontainer(
                          h: 150,
                          w: 150,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      "assets/images/github_dark.png"))))
                      : Kcontainer(
                          h: 150,
                          w: 150,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      "assets/images/github_white.png")))),
                  KsBox(h: Kh(context: context, value: 5)),
                  Padding(
                      padding: const EdgeInsets.only(left: 50, right: 50),
                      child: KtextFeild(
                          style: TextStyle(
                              color: Get.find<MainAppController>().theme.value
                                  ? Colors.black
                                  : Colors.white),
                          labelStyle: TextStyle(
                            color: Get.find<MainAppController>().theme.value
                                ? Colors.black
                                : Colors.white,
                          ),
                          prefixIcon: const Icon(Icons.search),
                          prefixIconColor: Colors.black,
                          controller: controller.inputEmail,
                          validator: (value) {
                            return controller.validateEmail(value);
                          },
                          labelText: "User name")),
                  KsBox(h: Kh(context: context, value: 3)),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: KeleButtonText(
                      h: 40,
                      w: 100,
                      text: "Search",
                      tColor: Get.find<MainAppController>().theme.value
                          ? Colors.white
                          : Colors.black,
                      tSize: 16,
                      onPressed: () {
                        controller.searchClick(context, controller);
                      },
                      backgroundColor: Get.find<MainAppController>().theme.value
                          ? Colors.black
                          : Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}