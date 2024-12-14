import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: LoginForm(),
    debugShowCheckedModeBanner: false, // لإزالة علامة Debug
  ));
}

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  // المتغيرات لتخزين القيم
  String name = '';
  String email = '';
  String phone = '';
  String idNumber = '';
  String licenseNumber = '';

  // شاشة الترحيب
  void _navigateToWelcomePage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => WelcomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.blue.shade700, Colors.blue.shade400],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Card(
              elevation: 10,
              margin: EdgeInsets.all(20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // العنوان
                      Text(
                        'تسجيل الدخول',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueAccent,
                        ),
                      ),
                      SizedBox(height: 20),

                      // الاسم
                      _buildTextField(
                          'الاسم', Icons.person, TextInputType.text, (value) {
                        if (value == null || value.isEmpty) {
                          return 'الرجاء إدخال الاسم';
                        }
                        return null;
                      }, (value) => name = value!),

                      // البريد الإلكتروني
                      _buildTextField(
                          'البريد الإلكتروني',
                          Icons.email,
                          TextInputType.emailAddress, (value) {
                        if (value == null ||
                            value.isEmpty ||
                            !value.contains('@')) {
                          return 'الرجاء إدخال بريد إلكتروني صحيح';
                        }
                        return null;
                      }, (value) => email = value!),

                      // رقم الهاتف
                      _buildTextField(
                          'رقم الهاتف', Icons.phone, TextInputType.phone, (value) {
                        if (value == null || value.isEmpty) {
                          return 'الرجاء إدخال رقم الهاتف';
                        }
                        return null;
                      }, (value) => phone = value!),

                      // رقم الهوية الوطنية
                      _buildTextField(
                          'رقم الهوية الوطنية',
                          Icons.credit_card,
                          TextInputType.number, (value) {
                        if (value == null || value.isEmpty) {
                          return 'الرجاء إدخال رقم الهوية الوطنية';
                        }
                        return null;
                      }, (value) => idNumber = value!),

                      // رقم ترخيص البلدية
                      _buildTextField(
                          'رقم ترخيص البلدية',
                          Icons.business,
                          TextInputType.number, (value) {
                        if (value == null || value.isEmpty) {
                          return 'الرجاء إدخال رقم ترخيص البلدية';
                        }
                        return null;
                      }, (value) => licenseNumber = value!),

                      SizedBox(height: 20),

                      // زر الإرسال
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            _navigateToWelcomePage();
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueAccent,
                          padding: EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text(
                          'تسجيل الدخول',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Widget لإعادة استخدام TextFormField
  Widget _buildTextField(String label, IconData icon, TextInputType type,
      String? Function(String?) validator, Function(String?) onSaved) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        keyboardType: type,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon, color: Colors.blueAccent),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 2.0),
          ),
        ),
        validator: validator,
        onSaved: onSaved,
      ),
    );
  }
}

// صفحة الترحيب
class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade700, Colors.blue.shade400],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Text(
            'ِAhmed mohmmed Aljarrash ',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              letterSpacing: 2.0,
            ),
          ),
        ),
      ),
    );
  }
}
