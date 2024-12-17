import 'package:flutter/material.dart';
import 'aya_check.dart';

class UserForm extends StatefulWidget {
  @override
  _UserFormState createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  final FormManager _formManager = FormManager();
  bool _acceptTerms = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 192, 190, 190),
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          padding: EdgeInsets.all(30),
          width: double.infinity,
          constraints: BoxConstraints(maxWidth: 500),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(
              top: Radius.elliptical(130, 50),
              bottom: Radius.elliptical(130, 50),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3),
              ),
            ],
            border: Border.all(color: Colors.grey.shade200),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Aya app',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF000080),
                    letterSpacing: 1,
                  ),
                ),
                SizedBox(height: 30),
                TextFormField(
                  controller: _formManager.nameController,
                  decoration: InputDecoration(
                    labelText: 'Name',
                    labelStyle: TextStyle(color: Color(0xFF000080)),
                    prefixIcon: Icon(Icons.person, color: Color(0xFF000080)),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF000080)),
                    ),
                  ),
                  validator: FormValidator.validateName,
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _formManager.phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    labelText: 'Phone Number',
                    labelStyle: TextStyle(color: Color(0xFF000080)),
                    prefixIcon: Icon(Icons.phone, color: Color(0xFF000080)),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF000080)),
                    ),
                  ),
                  validator: FormValidator.validatePhone,
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _formManager.emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(color: Color(0xFF000080)),
                    prefixIcon: Icon(Icons.email, color: Color(0xFF000080)),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF000080)),
                    ),
                  ),
                  validator: FormValidator.validateEmail,
                ),
                SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[100],
                  ),
                  child: TextFormField(
                    controller: _formManager.passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(color: Color(0xFF000080)),
                      prefixIcon: Icon(Icons.lock, color: Color(0xFF000080)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Color(0xFF000080)),
                      ),
                    ),
                    validator: FormValidator.validatePassword,
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Checkbox(
                      value: _acceptTerms,
                      onChanged: (bool? value) {
                        setState(() {
                          _acceptTerms = value ?? false;
                        });
                      },
                      activeColor: Color(0xFF000080),
                    ),
                    Expanded(
                      child: Text(
                        'I accept the terms and conditions',
                        style: TextStyle(
                          color: Color(0xFF000080),
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _acceptTerms ? () {
                    User? user = _formManager.processForm();
                    if (user != null) {
                      print('Name: ${user.name}');
                      print('Phone: ${user.phone}');
                      print('Email: ${user.email}');
                      print('Password: ${user.password}');
                      print('Terms accepted: $_acceptTerms');
                    }
                  } : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF000080),
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'Submit',
                    style: TextStyle(
                      color: const Color.fromARGB(255, 11, 2, 117),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _formManager.dispose();
    super.dispose();
  }
}

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      primaryColor: Color(0xFF000080),
      scaffoldBackgroundColor: Colors.white,
    ),
    home: UserForm(),
    debugShowCheckedModeBanner: false,
  ));
}
