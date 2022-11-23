import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ushop_app/logic/controllers/auth_controller.dart';
import 'package:ushop_app/logic/controllers/setting_controller.dart';
import 'package:ushop_app/view/widgets/text_utiles.dart';


class ProfileWidget extends StatelessWidget {
  ProfileWidget({Key? key}) : super(key: key);

  final controller = Get.find<SettingController>();
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(
          () => Row(
            children: [
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(
                      authController.displayUserPhoto.value,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextUtiles(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    text: controller
                        .capitalize(authController.displayUserName.value),
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    underline: TextDecoration.none,
                  ),
                  TextUtiles(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    text: authController.displayUserEmail.value,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    underline: TextDecoration.none,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}