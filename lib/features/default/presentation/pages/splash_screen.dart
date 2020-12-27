import 'dart:async';

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:myclig/core/constants/colors_constant.dart';
import 'package:myclig/core/constants/image_assets_constnts.dart';
import 'package:myclig/core/constants/route_names.dart';
import 'package:myclig/core/dependencies/injection_container.dart';
import 'package:myclig/core/local_data/user_data/get_loggedin_user_data.dart';
import 'package:myclig/features/user/domain/entities/user_entity.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  _transitionToNextPageAfterSplash() {
    print('worked');
    GetLoggedInUserData getLoggedInUserData = sl<GetLoggedInUserData>();
    UserEntity userEntity = getLoggedInUserData();
    Logger().i(userEntity.toString());

    // UserEntity userEntity =
    //     Provider.of<UserProvider>(context, listen: false).getLoggedInUser();
    return Timer(
        Duration(
          seconds: 5,
        ), () {
      if (userEntity == null) {
        Navigator.pushNamed(context, HOME_SCREEN);
      } else if (userEntity.verified) {
        Navigator.pushNamed(context, DASHBOARD_SCREEN);
      } else {
        Navigator.pushNamed(
          context,
          VERIFY_REGISTRATION_SCREEN,
          arguments: userEntity,
        );
      }
    });
  }

  @override
  void initState() {
    _transitionToNextPageAfterSplash();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: ColorConstant.PRIMARY_COLOR,
        // padding: EdgeInsets.only(top: 240),
        // decoration: BoxDecoration(
        //   image: DecorationImage(
        //     fit: BoxFit.cover,
        //     colorFilter: ColorFilter.mode(
        //       ColorConstant.PRIMARY_COLOR,
        //       BlendMode.modulate,
        //     ),
        //     image: AssetImage(
        //       ImageAssetConstants.SPLASH_BLACK,
        //     ),
        //   ),
        // ),
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
                    ImageAssetConstants.MYCLIGLOGO,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'MyClig',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
