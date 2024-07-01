import 'package:crafty_bay_ecomarc_apps/presentation/widgets/app_logo.dart';
import 'package:flutter/material.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({super.key});

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _mobileTEController = TextEditingController();
  final TextEditingController _cityTEController = TextEditingController();
  final TextEditingController _shippingTEController = TextEditingController();
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 100),
                const AppLogo(),
                const SizedBox(height: 16),
                Text(
                  "Complete Profile",
                  style: textTheme.headlineLarge,
                ),
                const SizedBox(height: 5),
                Text(
                  "Get Started with us with your details",
                  style: textTheme.headlineSmall,
                ),
                const SizedBox(height: 16),
                _buildCompleteProfileForm(),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text("Complete"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCompleteProfileForm() {
    return Form(
      key: _globalKey,
      child: Column(
        children: [
          TextFormField(
            controller: _firstNameTEController,
            decoration: const InputDecoration(
              hintText: "First Name",
            ),
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: _lastNameTEController,
            decoration: const InputDecoration(
              hintText: "Last Name",
            ),
          ),
          const SizedBox(height: 8),
          TextFormField(
            keyboardType: TextInputType.number,
            controller: _mobileTEController,
            decoration: const InputDecoration(
              hintText: "Mobile",
            ),
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: _cityTEController,
            decoration: const InputDecoration(
              hintText: "City",
            ),
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: _shippingTEController,
            maxLines: 3,
            decoration: const InputDecoration(
              hintText: "Shipping Address",
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _firstNameTEController;
    _lastNameTEController;
    _mobileTEController;
    _cityTEController;
    _shippingTEController;
    super.dispose();
  }
}
