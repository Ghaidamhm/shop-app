// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ushop_app/logic/controllers/auth_controller.dart';
import 'package:ushop_app/utils/my_string.dart';
import 'package:ushop_app/utils/theme.dart';
import 'package:ushop_app/view/widgets/auth/auth_button.dart';
import 'package:ushop_app/view/widgets/auth/auth_text_form_field.dart';

import '../../../utils/theme.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({super.key});
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();

  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,


        appBar: AppBar(
          backgroundColor: Get.isDarkMode ?darkGreyClr :  Colors.white,
          centerTitle: true,
          elevation: 0,
          title: Text(
            'Forget Password',
            style: TextStyle(color: Get.isDarkMode ? Colors.white : mainColor),
          ),
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Get.isDarkMode ? Colors.white : Colors.black,
            ),
          ),
        ),
        body: Form(
          key: formKey,
          child: SingleChildScrollView(
              child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Column(children: [
              Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(
                        Icons.close_rounded,
                        color: Colors.white,
                      ))),
              SizedBox(
                height: 20,
              ),
              Text(
                "If you want to recover your account,then please provide your email ID below ..",
                style: TextStyle(
                    color: Get.isDarkMode ? Colors.white : Colors.black ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 50,
              ),
              Image.asset(
                'assets/images/forgetpass copy.png',
                width: 250,
              ),
              SizedBox(
                height: 50,
              ),
              AuthTextFormField(
                controller: emailController,
                obscureText: false,
                validator: (value) {
                  if (!RegExp(validationEmail).hasMatch(value)) {
                    return 'Invalid Email';
                  } else {
                    return null;
                  }
                },
                prefixIcon: Get.isDarkMode
                    ? Image.asset('assets/images/email.png')
                    : Icon(
                        Icons.email,
                        color: Colors.black,
                      ),
                suffix: Text(''),
                hintText: 'Email',
              ),
              SizedBox(
                height: 50,
              ),
              GetBuilder<AuthController>(builder: (_) {
                return AuthButton(
                    text: 'SEND',
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        String email = emailController.text.trim();
                        controller.resetPassword(email);
                      }
                    });
              })
            ]),
          )),
        ),
      ),
    );
  }
}
