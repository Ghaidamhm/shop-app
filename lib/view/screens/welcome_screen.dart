// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:ushop_app/utils/theme.dart';
import 'package:ushop_app/view/widgets/text_utiles.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child:
                Image.asset('assets/images/background.png', fit: BoxFit.cover),
          ),
          Container(
            color: Colors.black.withOpacity(0.2),
            width: double.infinity,
            height: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 100,
                ),


                Container(
                  height: 60,
                  width: 190,
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(5)),
                  child: Center(
                    child: TextUtiles(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      text: 'welcome',
                      color: Colors.white, underline: TextDecoration.underline,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),


                Container(
                  height: 60,
                  width: 230,
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(5)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextUtiles(
                        text: 'Asroo',
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: mainColor, underline: TextDecoration.underline,
                      ),
                      const SizedBox(
                        width: 7,
                      ),
                      TextUtiles(
                        text: 'Shop',
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.white, underline:TextDecoration.underline,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 250,
                ),

                
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: mainColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 12,
                      )),
                  onPressed: () {},
                  child: TextUtiles(
                      text: 'Get Start',
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white, underline: TextDecoration.underline,),
                ),
                SizedBox(
                  height: 30,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextUtiles(
                        text: "Don't have an Account? ",
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        color: Colors.white, underline: TextDecoration.underline,),
                    TextButton(
                      onPressed: () {},
                      child: TextUtiles(
                        text: 'Sign Up',
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        color: Colors.white, underline: TextDecoration.underline,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
