import 'package:flutter/material.dart';

class CreaterReviewScreen extends StatefulWidget {
  const CreaterReviewScreen({super.key});

  @override
  State<CreaterReviewScreen> createState() => _CreaterReviewScreenState();
}

class _CreaterReviewScreenState extends State<CreaterReviewScreen> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _writeReviewController = TextEditingController();
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Review"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextFormField(
                controller: _firstNameController,
                decoration: InputDecoration(hintText: 'First Name'),
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _lastNameController,
                decoration: InputDecoration(hintText: 'Last Name'),
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _writeReviewController,
                decoration: InputDecoration(hintText: 'Write Review'),
                maxLines: 10,
              ),
              SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text('Submit'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _firstNameController;
    _lastNameController;
    _writeReviewController;
    super.dispose();
  }
}
