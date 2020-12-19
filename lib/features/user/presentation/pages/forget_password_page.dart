import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myclig/core/constants/colors_constant.dart';
import 'package:myclig/core/constants/image_assets_constnts.dart';
import 'package:myclig/core/constants/route_names.dart';

class ForgetPasswordPage extends StatefulWidget {
  @override
  _ForgetPasswordPageState createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  bool isHiddenPassword = true;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: ColorConstant.PRIMARY_COLOR,
      child: SafeArea(
          child: Container(
        // padding: EdgeInsets.only(top: 130),
        color: Colors.white,
        child: Column(
          children: [
            Container(
              color: Colors.white,
              child: Align(
                alignment: Alignment.topRight,
                child: Container(
                  padding: EdgeInsets.fromLTRB(70, 30, 30, 50),
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                      color: ColorConstant.PRIMARY_COLOR,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(150),
                          topLeft: Radius.elliptical(2, 22),
                          bottomRight: Radius.elliptical(0, 70)
                          // bottomRight: Radius.elliptical(50, 40)
                          )),
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage(
                        ImageAssetConstants.MYCLIGLOGO_SMALL,
                      ),
                    )),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Enter your email address to reset your password',
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
                              color: ColorConstant.PRIMARY_COLOR, width: 1.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey[800], width: 1.0),
                        ),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 10.0),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Already have an account?',
                        style: TextStyle(color: Colors.black87, fontSize: 15.0),
                      ),
                    ],
                  ),
                  SizedBox(height: 30.0),
                  Center(
                    child: Container(
                      // padding: EdgeInsets.only(left: 15),
                      width: 300,
                      height: 50.0,
                      child: FlatButton(
                        color: ColorConstant.PRIMARY_COLOR,
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            LOGIN_SCREEN,
                          );
                        },
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
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }

  void togglePassword() {
    setState(() {
      isHiddenPassword = !isHiddenPassword;
    });
  }
}
