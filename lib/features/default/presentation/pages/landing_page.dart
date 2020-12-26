import 'package:flutter/material.dart';
import 'package:myclig/core/constants/colors_constant.dart';
import 'package:myclig/core/constants/image_assets_constnts.dart';
import 'package:myclig/core/constants/route_names.dart';
import 'package:myclig/core/dependencies/injection_container.dart';
import 'package:myclig/core/local_data/user_data/get_loggedin_user_data.dart';
import 'package:myclig/features/user/domain/entities/user_entity.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  void checkLoggedInUser() {
    GetLoggedInUserData getLoggedInUserData = sl<GetLoggedInUserData>();
    UserEntity userEntity = getLoggedInUserData();
    print(userEntity.fullName);
    if (userEntity != null) {
      Navigator.pushNamed(
        context,
        userEntity.verified ? DASHBOARD_SCREEN : VERIFY_REGISTRATION_SCREEN,
      );
    }
  }

  @override
  void initState() {
    // checkLoggedInUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: ColorConstant.PRIMARY_COLOR,
      child: SafeArea(
        child: Container(
          padding: EdgeInsets.only(top: 240),
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                ColorConstant.PRIMARY_COLOR,
                BlendMode.modulate,
              ),
              image: AssetImage(
                ImageAssetConstants.SPLASH_BLACK,
              ),
            ),
          ),
          child: Container(
            //margin: EdgeInsets.only(top: 70),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  //margin: EdgeInsets.only(top: 60),
                  height: 130,
                  width: 130,
                  child: Image(
                    image: AssetImage(
                      ImageAssetConstants.MYCLIGLOGO_SMALL,
                    ),
                  ),
                ),
                //SizedBox(height: 30),
                Container(
                  margin: EdgeInsets.only(top: 50),
                  child: Text(
                    'MyClig',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.0,
                    ),
                  ),
                ),
                SizedBox(height: 110),

                InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      LOGIN_SCREEN,
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.only(left: 10),
                    height: 50,
                    width: 300,
                    color: ColorConstant.PRIMARY_COLOR,
                    child: Row(
                      children: [
                        Icon(
                          Icons.mail,
                          color: Colors.white,
                        ),
                        SizedBox(width: 70),
                        Text(
                          'Login with email',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
