import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CustomForm extends StatefulWidget {
  const CustomForm({super.key});

  @override
  State<CustomForm> createState() => _CustomFormState();
}

class _CustomFormState extends State<CustomForm> {
  final _formKey = GlobalKey<FormState>();
  bool _acceptTerms = false;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _textController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextField(
              controller: _emailController,
              icon: Icons.email,
              hintText: 'email'.tr,
              validator: (value) {
                if (value == null || !value.contains('@')) {
                  return 'emailError'.tr;
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            CustomTextField(
              controller: _textController,
              icon: Icons.text_fields,
              hintText: 'text'.tr,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'textError'.tr;
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            CustomTextField(
              controller: _phoneController,
              icon: Icons.phone,
              hintText: 'phone'.tr,
              keyboardType: TextInputType.phone,
              validator: (value) {
                if (value == null || value.length < 9) {
                  return 'phoneError'.tr;
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Checkbox(
                  value: _acceptTerms,
                  onChanged: (value) {
                    setState(() {
                      _acceptTerms = value ?? false;
                    });
                  },
                  fillColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.selected)) {
                        return const Color(0xFF000080);
                      }
                      return Colors.grey;
                    },
                  ),
                ),
                Text(
                  'terms'.tr,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF000080),
                padding: const EdgeInsets.symmetric(
                  horizontal: 50,
                  vertical: 15,
                ),
              ),
              onPressed: () {
                if (_formKey.currentState!.validate() && _acceptTerms) {}
              },
              child: Text('submit'.tr),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final IconData icon;
  final String hintText;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.icon,
    required this.hintText,
    this.validator,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Colors.white),
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.grey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.white),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.white),
        ),
        filled: true,
        fillColor: Colors.grey[200],
      ),
      style: const TextStyle(color: Color(0xFF000080)),
      keyboardType: keyboardType,
      validator: validator,
    );
  }
}
