// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ushop_app/logic/controllers/auth_controller.dart';
import 'package:ushop_app/routes/routes.dart';
import 'package:ushop_app/utils/my_string.dart';
import 'package:ushop_app/utils/theme.dart';
import 'package:ushop_app/view/widgets/auth/auth_button.dart';
import 'package:ushop_app/view/widgets/auth/auth_text_form_field.dart';
import 'package:ushop_app/view/widgets/auth/container_under.dart';
import 'package:ushop_app/view/widgets/text_utiles.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        backgroundColor: Get.isDarkMode ? darkGreyClr :Colors.white ,
        elevation: 0,
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height / 1.3,
            child: Padding(
              padding: EdgeInsets.only(left: 25, right: 25, top: 40),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Row(
                      children: [
                        TextUtiles(
                            text: "LOG",
                            fontSize: 28,
                            fontWeight: FontWeight.w500,
                            color: mainColor,
                            underline: TextDecoration.none),
                        SizedBox(
                          width: 3,
                        ),
                        TextUtiles(
                            text: "IN",
                            fontSize: 28,
                            fontWeight: FontWeight.w500,
                            color: Get.isDarkMode ? Colors.white : Colors.black,
                            underline: TextDecoration.none),
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                    ),

                    const SizedBox(
                      height: 20,
                    ),
                    // Email validation
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
                    const SizedBox(
                      height: 20,
                    ),

                    GetBuilder<AuthController>(builder: (_) {
                      return AuthTextFormField(
                        controller: passwordController,
                        obscureText: controller.isVisibility ? false : true,
                        validator: (value) {
                          if (value.toString().length < 6) {
                            return 'Password should be longer or equal to 6 characters';
                          } else {
                            return null;
                          }
                        },
                        prefixIcon: Get.isDarkMode
                            ? Image.asset('assets/images/lock.png')
                            : Icon(
                                Icons.lock,
                                color: Colors.black,
                              ),
                        hintText: 'Password',
                        suffix: IconButton(
                          onPressed: () {
                            controller.visibility();
                          },
                          icon: controller.isVisibility
                              ? Icon(
                                  Icons.visibility,
                                  color: Colors.black,
                                )
                              : Icon(
                                  Icons.visibility_off,
                                  color: Colors.black,
                                ),
                        ),
                      );
                    }),

                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                          onPressed: () {
                            Get.toNamed(Routes.ForgetPasswordScreen);
                          },
                          child: TextUtiles(
                            text: 'Forget Password?',
                            fontSize: 14,
                            color: Get.isDarkMode ? Colors.white : Colors.black,
                            fontWeight: FontWeight.normal,
                            underline: TextDecoration.none,
                          )),
                    ),

                    SizedBox(
                      height: 50,
                    ),
                    GetBuilder<AuthController>(builder: (_) {
                      return AuthButton(
                        text: 'LOG IN',
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            String email = emailController.text.trim();
                            String password = passwordController.text;
                            controller.loginUsingFirebase(
                                email: email, password: password);
                          }
                        },
                      );
                    }),

                    SizedBox(
                      height: 20,
                    ),

                    TextUtiles(
                      text: 'OR',
                      fontSize: 14,
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                      fontWeight: FontWeight.normal,
                      underline: TextDecoration.none,
                    ),

                    SizedBox(
                      height: 20,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                            onTap: () {},
                            child: Image.asset(
                              'assets/images/facebook.png',
                            )),
                        SizedBox(
                          width: 10,
                        ),
                        GetBuilder<AuthController>(builder: (_) {
                          return InkWell(
                              onTap: () {
                                controller.googleSignUpApp();
                              },
                              child: Image.asset(
                                'assets/images/google.png',
                              ));
                        })
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          ContainerUnder(
            text: "Don't have an Account?",
            textType: 'SIGN UP',
            onPressed: () {
              Get.offNamed(Routes.SignUpScreen);
            },
          ),
        ],
      )),
    ));
  }
}
