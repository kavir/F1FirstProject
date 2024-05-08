import 'package:flutter/material.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  late TextEditingController _emailController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Forgot Password"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  hintText: 'Enter Your Email',
                ),
                onChanged: (value) {
                  setState(() {
                    _emailController.text = value;
                    print(
                        "the actual email in which the otp should be sent is ${_emailController.text} ");
                  });
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Implement OTP sending logic here
                  String email = _emailController.text;
                  // Send OTP to the provided email address
                  sendOtp(email);
                },
                child: Text('Send OTP'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void sendOtp(String recipientEmail) async {
    String username = 'kavirmansigh7@gmail.com';
    String password = 'your_email_password';

    final smtpServer = gmail(username, password);

    final message = Message()
      ..from = Address(username, 'Your Name')
      ..recipients.add(recipientEmail)
      ..subject = 'OTP Verification'
      ..text = 'Your OTP is: 1234'; // Generate your OTP dynamically here

    try {
      final sendReport = await send(message, smtpServer);
      print('Message sent: ' + sendReport.toString());
    } catch (e) {
      print('Error sending email: $e');
    }
  }
}
