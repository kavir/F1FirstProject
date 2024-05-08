import 'package:firstproject/forgetpassword.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class loginaccount extends StatefulWidget {
  const loginaccount({super.key});

  @override
  State<loginaccount> createState() => _loginaccountState();
}

class _loginaccountState extends State<loginaccount> {
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 229, 206, 199),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromARGB(255, 230, 209, 202),
                Color.fromARGB(255, 255, 254, 254)
              ],
            ),
          ),
          child: Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: Container(
                      height: screenSize.height * 0.99,
                      width: screenSize.width * 0.9,
                      color: Colors
                          .transparent, // Set container color to transparent
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  end: Alignment.topLeft,
                                  begin: Alignment.bottomRight,
                                  colors: [
                                    Color.fromARGB(255, 195, 186, 181),
                                    Color.fromARGB(255, 255, 254, 254)
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              padding: EdgeInsets.all(46.0),
                              color: Colors.white,
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    "Login",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: const Color.fromARGB(
                                            255, 65, 93, 97),
                                        fontSize: 20),
                                  ),
                                  SizedBox(height: 4),
                                  // Center(
                                  //   child: TextFormField(
                                  //     autofocus: true,
                                  //     decoration: InputDecoration(
                                  //         labelText: 'Full Name'),
                                  //   ),
                                  // ),
                                  // Container(
                                  //   height: 2,
                                  //   decoration: BoxDecoration(boxShadow: [
                                  //     BoxShadow(
                                  //       color: Colors.grey.withOpacity(0.5),
                                  //       spreadRadius: 1,
                                  //       blurRadius: 5,
                                  //     ),
                                  //   ]),
                                  // ),
                                  Center(
                                    child: TextFormField(
                                      autofocus: true,
                                      decoration:
                                          InputDecoration(labelText: 'Email'),
                                    ),
                                  ),
                                  Container(
                                    height: 2,
                                    decoration: BoxDecoration(boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 1,
                                        blurRadius: 5,
                                      ),
                                    ]),
                                  ),
                                  Center(
                                    child: TextFormField(
                                      autofocus: true,
                                      obscureText: _obscurePassword,
                                      decoration: InputDecoration(
                                        labelText: 'Password',
                                        suffixIcon: IconButton(
                                          icon: Icon(Icons.visibility),
                                          onPressed: () {
                                            setState(() {
                                              _obscurePassword =
                                                  !_obscurePassword;
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 2,
                                    decoration: BoxDecoration(boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 1,
                                        blurRadius: 5,
                                      ),
                                    ]),
                                  ),
                                  SizedBox(height: 16),
                                  Center(
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                          Color.fromARGB(255, 155, 83, 78),
                                        ),
                                        foregroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Colors.white),
                                        shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                10.0), // Adjust the radius as needed
                                          ),
                                        ),
                                      ),
                                      onPressed: () {
                                        final snackBar = SnackBar(
                                          content: Text(
                                              'Account Created!'), // Your message here
                                          duration: Duration(
                                              seconds:
                                                  2), // Duration for which snackbar will be visible
                                        );
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(snackBar);
                                      },
                                      child: Text("Login"),
                                    ),
                                  ),
                                  SizedBox(height: 10),

                                  Center(
                                    child: TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ForgetPassword()));
                                      },
                                      child: Text("forget password?"),
                                    ),
                                  ),
                                  // SizedBox(height: 10),

                                  // Center(
                                  //   child: OutlinedButton(
                                  //       onPressed: () {},
                                  //       child: Text("Signup with Google")),
                                  // ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Transform.rotate(
                  angle:
                      0.7, // Specify the angle in radians (-0.5 radians is approximately -28.65 degrees)
                  child: Image.asset(
                    'assets/logorandom.png',
                    width: screenSize.width * 0.45,
                    height: screenSize.height * 0.39,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
