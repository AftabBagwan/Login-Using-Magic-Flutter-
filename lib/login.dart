import 'package:flutter/material.dart';
import 'package:magic_sdk/magic_sdk.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _otpcontroller = TextEditingController();

  _authenticate(BuildContext context) async {
    final token =
        await Magic.instance.auth.loginWithMagicLink(email: _controller.text);
  }

  _authenticateWithOTP(BuildContext context) async {
    final token = await Magic.instance.auth
        .loginWithSMS(phoneNumber: _otpcontroller.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Welcome',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: TextField(
                  autofocus: true,
                  controller: _controller,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16))),
                    labelText: "Email Address",
                    hintText: "aftabbagwan9886@gmail.com",
                    contentPadding: EdgeInsets.all(10),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(22.0),
                child: MaterialButton(
                  height: 42,
                  minWidth: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  onPressed: () {
                    _authenticate(context);
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: TextField(
                  autofocus: true,
                  controller: _otpcontroller,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16))),
                    labelText: "Email Phone",
                    hintText: "9623865786",
                    contentPadding: EdgeInsets.all(10),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(22.0),
                child: MaterialButton(
                  height: 42,
                  minWidth: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  onPressed: () {
                    _authenticateWithOTP(context);
                  },
                  child: const Text(
                    'Login with OTP',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
