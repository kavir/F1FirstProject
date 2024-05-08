import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:firstproject/loginpage.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
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
                      height: screenSize.height * 1.2,
                      width: screenSize.width * 0.9,
                      color: Colors.transparent,
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
                              padding: EdgeInsets.all(16.0),
                              color: Colors.white,
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    "Create Account",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color:
                                          const Color.fromARGB(255, 65, 93, 97),
                                      fontSize: 20,
                                    ),
                                  ),
                                  SizedBox(height: 4),

                                  ////using a form builder widget
                                  FormBuilder(
                                    ////validation technique

                                    child: Column(
                                      children: [
                                        /////////////////////////////////////////////////////////
                                        FormBuilderTextField(
                                          autovalidateMode: AutovalidateMode
                                              .onUserInteraction,
                                          name: 'fullName',
                                          decoration: InputDecoration(
                                              labelText: 'Full Name'),
                                          validator:
                                              FormBuilderValidators.compose([
                                            FormBuilderValidators.required(
                                              errorText:
                                                  'NameField Cannot be empty',
                                            ),
                                            FormBuilderValidators.minLength(
                                              3,
                                              errorText:
                                                  'NameField Cannot be less than 3 characters',
                                            ),
                                          ]),
                                        ),
                                        ///////////////////////////////////////////////////////
                                        SizedBox(height: 16),
                                        FormBuilderTextField(
                                          autovalidateMode: AutovalidateMode
                                              .onUserInteraction,
                                          name: 'email',
                                          decoration: InputDecoration(
                                              labelText: 'Email'),
                                          validator:
                                              FormBuilderValidators.compose([
                                            FormBuilderValidators.required(
                                                errorText:
                                                    "EmailField Cannot be empty"),
                                            FormBuilderValidators.email(),
                                          ]),
                                        ),
                                        SizedBox(height: 16),
                                        FormBuilderTextField(
                                          autovalidateMode: AutovalidateMode
                                              .onUserInteraction,
                                          name: 'password',
                                          obscureText: _obscurePassword,
                                          decoration: InputDecoration(
                                            labelText: 'Password',
                                            suffixIcon: IconButton(
                                              icon: _obscurePassword
                                                  ? Icon(Icons.visibility)
                                                  : Icon(Icons.visibility_off),
                                              onPressed: () {
                                                setState(() {
                                                  _obscurePassword =
                                                      !_obscurePassword;
                                                });
                                              },
                                            ),
                                          ),
                                          validator:
                                              FormBuilderValidators.compose([
                                            FormBuilderValidators.required(
                                                errorText:
                                                    "Passwordfield Cannot be empty"),
                                            FormBuilderValidators.minLength(6,
                                                errorText:
                                                    "PasswordField should be greater than 6 characters"),
                                          ]),
                                        ),
                                        SizedBox(height: 16),
                                        ElevatedButton(
                                          onPressed: () {
                                            if (FormBuilder.of(context)!
                                                .saveAndValidate()) {
                                              // Form is valid, handle form submission
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        loginaccount()),
                                              );
                                              final snackBar = SnackBar(
                                                content:
                                                    Text('Account Created!'),
                                                duration: Duration(seconds: 2),
                                              );
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(snackBar);
                                            }
                                          },
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all<
                                                    Color>(
                                              Color.fromARGB(255, 155, 83, 78),
                                            ),
                                            foregroundColor:
                                                MaterialStateProperty.all<
                                                    Color>(Colors.white),
                                            shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                            ),
                                          ),
                                          child: Text("Create Account"),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    "-OR-",
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 15),
                                  ),
                                  SizedBox(height: 6),
                                  OutlinedButton(
                                    onPressed: () {
                                      final snackBar = SnackBar(
                                        content: Text(
                                            'you have successfully signed up! using Google'),
                                        duration: Duration(seconds: 2),
                                      );
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(snackBar);
                                    },
                                    style: ButtonStyle(
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          'assets/google1.png',
                                          width: 24,
                                          height: 24,
                                          fit: BoxFit.contain,
                                        ),
                                        SizedBox(width: 8),
                                        Text(
                                          "Signup with Google",
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 6),
                                  OutlinedButton(
                                    onPressed: () {
                                      final snackBar = SnackBar(
                                        content: Text(
                                            'you have successfully signed up using Dribble'),
                                        duration: Duration(seconds: 2),
                                      );
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(snackBar);
                                    },
                                    style: ButtonStyle(
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          'assets/dribble.png',
                                          width: 37,
                                          height: 37,
                                          fit: BoxFit.contain,
                                        ),
                                        SizedBox(width: 8),
                                        Text(
                                          "Signup with Dribble",
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Transform.rotate(
                  angle: 0.7,
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
