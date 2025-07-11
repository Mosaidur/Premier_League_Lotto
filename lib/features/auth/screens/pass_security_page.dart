import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sportolotto/routes/app_routes.dart';

import '../../../core/widgets/bg.dart';
import '../../../core/widgets/custom_dropdown_field.dart';
import '../../../core/widgets/custom_text_field.dart';

class PassAndSecurityPage extends StatefulWidget {
  PassAndSecurityPage({super.key});

  @override
  State<PassAndSecurityPage> createState() => _PassAndSecurityPageState();
}

class _PassAndSecurityPageState extends State<PassAndSecurityPage> {
  final TextEditingController passwordController = TextEditingController();

  final TextEditingController securityQuestionController = TextEditingController();

  final TextEditingController secretAnswerController = TextEditingController();

  String? selectedGender;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [


          CustomBackground(),

          // Content — fix: wrap in Positioned.fill
          Positioned.fill(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  const SizedBox(height: 100),

                  Center(
                    child: Text(
                      "Create An Account",
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.blue[900],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Center(
                    child: Text(
                      "Create an account or log in to explore \nabout our app",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    "Account Details",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.blue[900],
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 16),

                  CustomTextField(
                    controller: passwordController,
                    label: "Password",
                    obscureText: true,
                  ),
                  const SizedBox(height: 12),

                  Text(
                    "Security Question",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.blue[900],
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 16),


                  CustomDropdownField<String>(
                    value: selectedGender,
                    label: 'Select.....',
                    items: [
                      const DropdownMenuItem(
                        value: 'male',
                        child: Text('Male'),
                      ),
                      const DropdownMenuItem(
                        value: 'female',
                        child: Text('Female'),
                      ),
                    ],
                    onChanged: (val) {
                      setState(() {
                        selectedGender = val;
                      });
                    },
                  ),

                  Text(
                    "Secret Answer",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.blue[900],
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 16),


                  CustomTextField(
                    controller: secretAnswerController,
                    label: "Answer",
                    obscureText: true,
                  ),


                  const SizedBox(height: 50),


                  const Text(
                    "By selecting 'Create My Account' you are :",
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "- At least 18 years old",
                    style: TextStyle(color: Colors.white),
                  ),
                  const Text(
                    "- Do not already have a 'SportoLotto' account",
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(height: 8),

                  // privacy policy line
                  RichText(
                    text: TextSpan(
                      children: [
                        const TextSpan(
                          text: "- Agreeing to all ",
                          style: TextStyle(color: Colors.white),
                        ),
                        TextSpan(
                          text: "Privacy Policy",
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                          recognizer: TapGestureRecognizer()..onTap = () {
                            print("Privacy Policy tapped");
                            // your logic here
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 4),

                  // terms and conditions line
                  RichText(
                    text: TextSpan(
                      children: [
                        const TextSpan(
                          text: "- Agreeing to all ",
                          style: TextStyle(color: Colors.white),
                        ),
                        TextSpan(
                          text: "Terms and Conditions",
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                          recognizer: TapGestureRecognizer()..onTap = () {
                            print("Terms and Conditions tapped");
                            // your logic here
                          },
                        ),
                      ],
                    ),
                  ),


                  const SizedBox(height: 50),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.toNamed(AppRoutes.createAccountPage);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 16), // optional: taller button
                      ),
                      child: Text(
                        "How to play",
                        style: TextStyle(
                          color: Colors.blue[900],
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xFF905E26),
                            Color(0xFFF5EC9B),
                            Color(0xFFF5EC9B),
                            Color(0xFF905E26),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          Get.toNamed('/next');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                        ),
                        child: Text(
                          "Create Account",
                          style: TextStyle(
                            color: Colors.blue[900],
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),


                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Already Have An Account?",
                        style: TextStyle(color: Colors.white),
                      ),
                      const SizedBox(width: 8),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed('/signin');
                        },
                        child: ShaderMask(
                          shaderCallback: (bounds) => const LinearGradient(
                            colors: [
                              Color(0xFF905E26),
                              Color(0xFFF5EC9B),
                              Color(0xFFF5EC9B),
                              Color(0xFF905E26),
                            ],
                          ).createShader(bounds),
                          child: const Text(
                            "Sign in",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
