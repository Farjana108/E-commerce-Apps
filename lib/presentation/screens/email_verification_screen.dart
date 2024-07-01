import 'package:crafty_bay_ecomarc_apps/presentation/screens/otp_verification_screen.dart';
import 'package:crafty_bay_ecomarc_apps/presentation/widgets/app_logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  State<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  final TextEditingController _emailTEController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const SizedBox(height: 100),
            const AppLogo(),
            const SizedBox(height: 16),
            Text(
              "Welcome Back",
              style: textTheme.headlineLarge,
            ),
            const SizedBox(height: 5),
            Text(
              "Please Enter Your Email Address",
              style: textTheme.headlineSmall,
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _emailTEController,
              decoration: const InputDecoration(
                hintText: "Email Address",
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                Get.to(() =>
                    OTPVerificationScreen(email: _emailTEController.text,));
              },
              child: const Text("Next"),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailTEController;
    super.dispose();
  }
}
