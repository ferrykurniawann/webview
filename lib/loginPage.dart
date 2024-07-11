import 'package:flutter/material.dart';
import 'package:myapp/homePage.dart';
import 'package:myapp/registrationPage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final emailFocusNode = FocusNode();

  bool isEmailValid = true;
  bool emailFieldTouched = false;

  String _loginUrl =
      'https://fakestoreapi.com/auth/login'; // Ganti dengan URL Anda

  Future<void> _login(BuildContext context) async {
    final response = await http.post(
      Uri.parse(_loginUrl),
      body: {
        'username': usernameController.text,
        'password': passwordController.text
      },
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return HomePage(); // Use the correct class name
      }));
    } else {
      print('Login failed: ${response.statusCode}');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Login failed: Server error'),
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    usernameController.addListener(validateEmail);
    emailFocusNode.addListener(handleEmailFocusChange);
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    emailFocusNode.dispose();
    super.dispose();
  }

  void validateEmail() {
    setState(() {
      isEmailValid = usernameController.text.length >= 3;
    });
  }

  void handleEmailFocusChange() {
    if (!emailFocusNode.hasFocus) {
      setState(() {
        emailFieldTouched = true;
        validateEmail();
      });
    }
  }

  void handleSubmit() {
    setState(() {
      emailFieldTouched = true;
      validateEmail();
    });

    if (isEmailValid) {
      _login(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20.0),
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 400),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                    child: Image.asset(
                      'assets/images/gambar-logo.png',
                      height: 200,
                    ),
                  ),
                  TextFormField(
                    focusNode: emailFocusNode,
                    controller: usernameController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      prefixIcon: Icon(Icons.email),
                      errorText: !isEmailValid && emailFieldTouched
                          ? 'Masukkan minimal 3 huruf'
                          : null,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Username tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      prefixIcon: Icon(Icons.lock),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: handleSubmit,
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Colors.lightBlue, // set the background color
                      minimumSize: Size(
                          double.infinity, 50), // same width as input fields
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.white, // set the text color to white
                        fontWeight:
                            FontWeight.w600, // set the text to semi-bold
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Belum punya akun? '),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisPage()),
                          );
                        },
                        child: Text('Register'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
