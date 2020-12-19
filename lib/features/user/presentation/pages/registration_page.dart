import 'package:flutter/material.dart';
import 'package:myclig/core/constants/colors_constant.dart';
import 'package:myclig/core/constants/route_names.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  bool isHiddenPassword = true;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: ColorConstant.PRIMARY_COLOR,
      child: SafeArea(
        child: Container(
          color: Colors.white,
          child: Container(
            padding: EdgeInsets.only(
              left: 20.0,
              right: 20.0,
              top: 120,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Create Account,',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 27.0,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    'Sign up below to get started',
                    style: TextStyle(
                      fontSize: 17.0,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 40.0),
                  Container(
                    child: TextField(
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: ColorConstant.PRIMARY_COLOR,
                            width: 1.0,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey[800],
                            width: 1.0,
                          ),
                        ),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 10.0),
                          child: Icon(
                            Icons.person,
                            color: Colors.grey[800],
                          ),
                        ),
                        hintText: 'Full Name',
                        hintStyle: TextStyle(
                          fontFamily: 'Slabo27px',
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Container(
                    child: TextField(
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: ColorConstant.PRIMARY_COLOR,
                            width: 1.0,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey[800],
                            width: 1.0,
                          ),
                        ),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 10.0),
                          child: Icon(
                            Icons.mail,
                            color: Colors.grey[800],
                          ),
                        ),
                        hintText: 'Email Address',
                        hintStyle: TextStyle(
                          fontFamily: 'Slabo27px',
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Container(
                    child: TextField(
                      obscureText: isHiddenPassword,
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        suffixIcon: InkWell(
                            onTap: togglePassword,
                            child: Icon(
                              isHiddenPassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: ColorConstant.PRIMARY_COLOR,
                            )),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: ColorConstant.PRIMARY_COLOR, width: 1.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey[800], width: 1.0),
                        ),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10.0,
                            vertical: 10.0,
                          ),
                          child: Icon(
                            Icons.lock,
                            color: Colors.grey[800],
                          ),
                        ),
                        hintText: 'Password',
                        hintStyle: TextStyle(
                          fontFamily: 'Slabo27px',
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 60.0),
                  Center(
                    child: Container(
                      //padding: EdgeInsets.only(left: 15),
                      width: 300,
                      height: 50.0,
                      child: FlatButton(
                        color: ColorConstant.PRIMARY_COLOR,
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            VERIFY_REGISTRATION_SCREEN,
                          );
                        },
                        child: Text(
                          'Register',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 60.0),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        LOGIN_SCREEN,
                      );
                    },
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Have account? ',
                            style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.black87,
                            ),
                          ),
                          Text(
                            'Sign in',
                            style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                              color: ColorConstant.PRIMARY_COLOR,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void togglePassword() {
    setState(() {
      isHiddenPassword = !isHiddenPassword;
    });
  }
}
