// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ushop_app/routes/routes.dart';
import '../../../logic/controllers/auth_controller.dart';
import 'package:ushop_app/utils/my_string.dart';
import 'package:ushop_app/utils/theme.dart';
import 'package:ushop_app/view/widgets/auth/auth_button.dart';
import 'package:ushop_app/view/widgets/auth/auth_text_form_field.dart';
import 'package:ushop_app/view/widgets/auth/container_under.dart';
import 'package:ushop_app/view/widgets/text_utiles.dart';
import '../../widgets/auth/check_widget.dart';

class SignUpScreen extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  FirebaseAuth auth = FirebaseAuth.instance;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // find the controller
  final controller = Get.find<AuthController>();
// Give me the controller I made يشغل لي الكنترولر اول ما ادخل ع الصفحه
  // final controller = Get.put(AuthController());
// هنا يشغل لي الكنترولر اذا انا طلبته
  // final controllers = Get.lazyPut((() => AuthController()));

  SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Get.isDarkMode ? Colors.white : darkGreyClr,
        elevation: 0,
      ),
      backgroundColor: Get.isDarkMode ? Colors.white : darkGreyClr,
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
                            text: "SIGN",
                            fontSize: 28,
                            fontWeight: FontWeight.w500,
                            color: mainColor,
                            underline: TextDecoration.none),
                        SizedBox(
                          width: 3,
                        ),
                        TextUtiles(
                            text: "UP",
                            fontSize: 28,
                            fontWeight: FontWeight.w500,
                            color: Get.isDarkMode ? Colors.black : Colors.white,
                            underline: TextDecoration.none),
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    AuthTextFormField(
                      controller: nameController,
                      obscureText: false,

// userName validation
                      validator: (value) {
                        if (value.toString().length <= 2 ||
                            !RegExp(validationName).hasMatch(value)) {
                          return 'Enter valid name';
                        } else {
                          return null;
                        }
                      },

                      prefixIcon: Get.isDarkMode
                          ? Image.asset('assets/images/user.png')
                          : Icon(
                              Icons.person,
                              color: Colors.black,
                              size: 30,
                            ),
                      suffix: Text(''),
                      hintText: 'User Name',
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
                    SizedBox(
                      height: 50,
                    ),
                    CheckWidget(),
                    SizedBox(
                      height: 50,
                    ),

                    GetBuilder<AuthController>(builder: (_) {
                      return AuthButton(
                        text: 'Sign Up',
                        onPressed: () {
                          if (controller.isCheckBox == false) {
                            Get.snackbar(
                                'Check Box', 'Please ,Accept terms & condition',
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor: Colors.green,
                                colorText: Colors.white);
                          }
                        else  if (formKey.currentState!.validate()) {
                            String name = nameController.text.trim();
                            String email = emailController.text.trim();
                            String password = passwordController.text;
                            controller.signUpUsingFirebase(
                                name: name, email: email, password: password);
                          } 
                          controller.isCheckBox=true;
                        },
                      );
                    }),
                  ],
                ),
              ),
            ),
          ),
          ContainerUnder(
            text: 'Already have an Account ?',
            textType: 'Log in',
            onPressed: () {
              Get.offNamed(Routes.LoginScreen);
            },
          ),
        ],
      )
      ),
    ));
  }
}
