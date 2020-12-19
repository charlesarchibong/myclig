import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myclig/core/constants/colors_constant.dart';
import 'package:myclig/core/constants/route_names.dart';
import 'package:myclig/features/user/presentation/widgets/top_right_corner_widget.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isHiddenPassword = true;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: ColorConstant.PRIMARY_COLOR,
      child: SafeArea(
        child: Container(
          // padding: EdgeInsets.only(top: 130),
          color: Colors.white,
          child: Stack(children: [
            TopRightCornerWidget(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 50),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Welcome back,',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 27.0,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          'Sign in to continue',
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
                                  horizontal: 10.0,
                                  vertical: 10.0,
                                ),
                                child: Icon(
                                  Icons.email,
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
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: ColorConstant.PRIMARY_COLOR,
                                ),
                              ),
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
                        SizedBox(height: 20.0),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              FORGET_PASSWORD_SCREEN,
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'Forgot Password?',
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 15.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 30.0),
                        Center(
                          child: Container(
                            // padding: EdgeInsets.only(left: 15),
                            width: 300,
                            height: 50.0,
                            child: FlatButton(
                              color: ColorConstant.PRIMARY_COLOR,
                              onPressed: () {},
                              child: Text(
                                'Sign in',
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
                              REGISTRATION_SCREEN,
                            );
                          },
                          child: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'New User? ',
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    color: Colors.black87,
                                  ),
                                ),
                                Text(
                                  'Create Account',
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
              ],
            ),
          ]),
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
