import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myclig/core/constants/route_names.dart';
import 'package:myclig/core/dependencies/injection_container.dart';
import 'package:myclig/core/device_info/app_version.dart';
import 'package:myclig/core/local_data/user_data/get_loggedin_user_data.dart';
import 'package:myclig/features/user/domain/entities/user_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  AppVersion version = sl<AppVersion>();
  UserEntity userEntity;
  GetLoggedInUserData getLoggedInUserData;
  @override
  void initState() {
    getLoggedInUserData = sl<GetLoggedInUserData>();
    userEntity = getLoggedInUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        actions: [
          InkWell(
            onTap: () {
              Navigator.pushNamed(
                context,
                EDIT_PROFILE_SCREEN,
              );
            },
            child: Center(
              child: FaIcon(
                FontAwesomeIcons.userEdit,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
        ],
        backgroundColor: Color(0xff330055),
        title: Text(
          '${userEntity.fullName}',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 30,
                        bottom: 20,
                        left: 10,
                      ),
                      child: Text(
                        'MyClig',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xff330055),
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                        bottom: 20,
                      ),
                      child: Text(
                        'Place Ads',
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Divider(
                      height: 1,
                      color: Colors.grey,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                        bottom: 30,
                        top: 20,
                      ),
                      child: Text(
                        'Activities',
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                        bottom: 20,
                        right: 20,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Referrals',
                            style: TextStyle(
                              color: Colors.grey[700],
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(width: 90),
                          Icon(
                            Icons.share,
                            color: Color(0xff330055),
                          ),
                          Icon(
                            Icons.visibility,
                            color: Colors.grey[600],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 3),
            Container(
              child: Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 30,
                        bottom: 20,
                        left: 10,
                      ),
                      child: Text(
                        'Info',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xff330055),
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                        bottom: 2,
                      ),
                      child: Text(
                        '${userEntity.phone}',
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                        bottom: 10,
                      ),
                      child: Text(
                        'Phone Number',
                        style: TextStyle(
                          color: Colors.grey[500],
                          fontSize: 15,
                        ),
                      ),
                    ),
                    Divider(
                      height: 1,
                      color: Colors.grey,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                        bottom: 2,
                        top: 10,
                      ),
                      child: Text(
                        '${userEntity.username}',
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                        bottom: 10,
                      ),
                      child: Text(
                        'Username',
                        style: TextStyle(
                          color: Colors.grey[500],
                          fontSize: 15,
                        ),
                      ),
                    ),
                    Divider(
                      height: 1,
                      color: Colors.grey,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                        bottom: 2,
                        top: 10,
                      ),
                      child: Text(
                        '${userEntity.email}',
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                        bottom: 10,
                      ),
                      child: Text(
                        'Email Address',
                        style: TextStyle(
                          color: Colors.grey[500],
                          fontSize: 15,
                        ),
                      ),
                    ),
                    Divider(
                      height: 1,
                      color: Colors.grey,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                        bottom: 2,
                        top: 10,
                      ),
                      child: Text(
                        '${userEntity.profession}',
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, bottom: 10),
                      child: Text(
                        'Profession',
                        style: TextStyle(
                          color: Colors.grey[500],
                          fontSize: 15,
                        ),
                      ),
                    ),
                    Divider(
                      height: 1,
                      color: Colors.grey,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                        bottom: 2,
                        top: 10,
                      ),
                      child: Text(
                        '${userEntity.organization}',
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                        bottom: 10,
                      ),
                      child: Text(
                        'Organisation',
                        style: TextStyle(
                          color: Colors.grey[500],
                          fontSize: 15,
                        ),
                      ),
                    ),
                    Divider(
                      height: 1,
                      color: Colors.grey,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                        bottom: 2,
                        top: 10,
                      ),
                      child: Text(
                        '${userEntity.location}',
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                        bottom: 10,
                      ),
                      child: Text(
                        'Location',
                        style: TextStyle(
                          color: Colors.grey[500],
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 3),
            Container(
              child: Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                        bottom: 10,
                        top: 30,
                      ),
                      child: Text(
                        'Settings',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xff330055),
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Divider(
                      height: 1,
                      color: Colors.grey,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                        bottom: 20,
                        top: 20,
                      ),
                      child: Text(
                        'Privacy and Security',
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Divider(
                      height: 1,
                      color: Colors.grey,
                    ),
                    InkWell(
                      onTap: () async {
                        SharedPreferences sp =
                            await SharedPreferences.getInstance();
                        await sp.clear();
                        await FirebaseAuth.instance.signOut();
                        Navigator.pushNamed(
                          context,
                          HOME_SCREEN,
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 10,
                          bottom: 20,
                          top: 20,
                        ),
                        child: Text(
                          'Log Out',
                          style: TextStyle(
                            color: Colors.grey[700],
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 3),
            Container(
              child: Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                        bottom: 10,
                        top: 30,
                      ),
                      child: Text(
                        'Support',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xff330055),
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Divider(
                      color: Colors.white,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                        bottom: 20,
                      ),
                      child: Text(
                        'F A Q',
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              child: Container(
                child: Center(
                  child: Text(
                    'Build Version ${version()}',
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.grey[700],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
