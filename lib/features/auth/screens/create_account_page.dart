import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/widgets/bg.dart';
import '../../../core/widgets/custom_dialog_box.dart';
import '../../../core/widgets/custom_text_field.dart';
import '../../../routes/app_routes.dart';

class CreateAccountPage extends StatefulWidget {
  CreateAccountPage({super.key});

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  final TextEditingController firstNameController = TextEditingController();

  final TextEditingController lastNameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  // void initState() {
  //   super.initState();
  //
  //   // Call after the first frame to avoid build context errors
  //   WidgetsBinding.instance.addPostFrameCallback((_) {
  //     showCustomPreferencesDialog(
  //       title: 'Are You 18+?',
  //       description: 'Must be 18+ to play. Play responsibly.',
  //       onNo: () {
  //         Get.back();
  //         print('No pressed');
  //       },
  //       onYes: () {
  //         Get.back();
  //         print('Yes pressed');
  //       },
  //     );
  //   });
  // }



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
                "Personal Details",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.blue[900],
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 16),

              CustomTextField(
                controller: firstNameController,
                label: "First Name",
              ),
              const SizedBox(height: 12),
              CustomTextField(
                controller: lastNameController,
                label: "Last Name",
              ),
              const SizedBox(height: 12),
              CustomTextField(
                controller: emailController,
                label: "E-mail",
              ),
              const SizedBox(height: 200),

              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        Get.back();
                      },
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        side: const BorderSide(color: Colors.white), // ✅ white border
                      ),
                      child: const Text(
                        "Cancel",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),

                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Get.toNamed(AppRoutes.addressPage);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        "Next",
                        style: TextStyle(color: Colors.blue[900]),
                      ),
                    ),
                  ),
                ],
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
                      Get.toNamed('/signInPage');
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
