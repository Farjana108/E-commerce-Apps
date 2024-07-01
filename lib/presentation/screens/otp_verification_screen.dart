import 'package:crafty_bay_ecomarc_apps/presentation/screens/complete_profile_screen.dart';
import 'package:crafty_bay_ecomarc_apps/presentation/widgets/app_logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Import GetX package
import 'dart:async';
import 'package:pin_code_fields/pin_code_fields.dart';

class OTPVerificationScreen extends StatefulWidget {
  const OTPVerificationScreen({super.key, required this.email});

  final String email;

  @override
  State<OTPVerificationScreen> createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
  final TextEditingController _otpTEController = TextEditingController();
  late final RxInt _countdownSeconds = 120.obs; // Using RxInt from GetX
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const SizedBox(height: 100),
            const AppLogo(), // Replace with your App Logo widget
            const SizedBox(height: 16),
            Text(
              "Enter OTP Code",
              style: textTheme.headlineLarge,
            ),
            const SizedBox(height: 5),
            Text(
              "A 4 Digit OTP code has been Sent",
              style: textTheme.headlineSmall,
            ),
            const SizedBox(height: 16),
            _buildPinField(),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Get.to(()=>const CompleteProfileScreen());
              },
              child: const Text("Next"),
            ),
            const SizedBox(height: 16),
            _buildResendCodeMessage(),
            const SizedBox(height: 8),
            TextButton(
              onPressed: () {},
              child: const Text("Resend code"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildResendCodeMessage() {
    return Obx(() => RichText(
      text: TextSpan(
        style: const TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.w500,
        ),
        children: [
          const TextSpan(
            text: "This code will Expire in ",
          ),
          TextSpan(
            text: "${_countdownSeconds.value} s",
            style: const TextStyle(color: Colors.blue),
          ),
        ],
      ),
    ));
  }

  Widget _buildPinField() {
    return PinCodeTextField(
      keyboardType: TextInputType.number,
      length: 6,
      obscureText: false,
      animationType: AnimationType.fade,
      pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(5),
          fieldHeight: 50,
          fieldWidth: 40,
          activeFillColor: Colors.white,
          inactiveFillColor: Colors.transparent,
          selectedFillColor: Colors.white),
      controller: _otpTEController,
      animationDuration: const Duration(milliseconds: 300),
      enableActiveFill: true,
      appContext: context,
    );
  }

  void _startTimer() {
    const oneSecond = Duration(seconds: 1);
    _timer = Timer.periodic(oneSecond, (timer) {
      if (_countdownSeconds.value < 1) {
        _timer.cancel();
      } else {
        _countdownSeconds.value--; // Decrement countdown seconds
      }
    });
  }

  @override
  void dispose() {
    _otpTEController.dispose();
    _timer.cancel();
    super.dispose();
  }
}
