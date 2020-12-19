import 'package:flutter/material.dart';
import 'package:myclig/core/constants/colors_constant.dart';
import 'package:myclig/core/constants/image_assets_constnts.dart';

class VerifyRegistrationPage extends StatefulWidget {
  @override
  _VerifyRegistrationPageState createState() => _VerifyRegistrationPageState();
}

class _VerifyRegistrationPageState extends State<VerifyRegistrationPage> {
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
              top: 20,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hi! Charles,',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 27.0,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    'Let\'s get you started by updating your profile',
                    style: TextStyle(
                      fontSize: 17.0,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 30.0),
                  Center(
                    child: Column(
                      children: [
                        Image.asset(
                          ImageAssetConstants.UPLOAD_ICON,
                          height: 100,
                          width: 100,
                        ),
                        // Container(
                        //   width: 100.0,
                        //   height: 100.0,
                        //   decoration: BoxDecoration(
                        //     // color: ColorConstant.PRIMARY_COLOR,
                        //     color: Colors.white,
                        //     image: DecorationImage(
                        //       image: AssetImage(
                        //         ImageAssetConstants.UPLOAD_ICON,
                        //       ),
                        //       fit: BoxFit.scaleDown,
                        //     ),
                        //     borderRadius: BorderRadius.all(
                        //       Radius.circular(
                        //         75.0,
                        //       ),
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Container(
                    child: TextField(
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.text,
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
                        hintText: 'Username',
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
                      keyboardType: TextInputType.phone,
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
                            Icons.phone,
                            color: Colors.grey[800],
                          ),
                        ),
                        hintText: 'Phone Number',
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
                      keyboardType: TextInputType.phone,
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
                            Icons.business_center,
                            color: Colors.grey[800],
                          ),
                        ),
                        hintText: 'Profession',
                        hintStyle: TextStyle(
                          fontFamily: 'Slabo27px',
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: TextField(
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.phone,
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
                            Icons.business_sharp,
                            color: Colors.grey[800],
                          ),
                        ),
                        hintText: 'Organization',
                        hintStyle: TextStyle(
                          fontFamily: 'Slabo27px',
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: TextField(
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.phone,
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
                            Icons.location_on,
                            color: Colors.grey[800],
                          ),
                        ),
                        hintText: 'Location',
                        hintStyle: TextStyle(
                          fontFamily: 'Slabo27px',
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    child: TextField(
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.phone,
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
                            Icons.read_more,
                            color: Colors.grey[800],
                          ),
                        ),
                        hintText: 'Referral Code (Optional)',
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
                        onPressed: () {},
                        child: Text(
                          'Update Profile',
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
