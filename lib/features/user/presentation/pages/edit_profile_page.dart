import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myclig/core/constants/image_assets_constnts.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[400],
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    color: Color(0xff330055),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Container(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Positioned(
              child: Center(
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Stack(
                        overflow: Overflow.visible,
                        children: [
                          CircleAvatar(
                            radius: 50,
                            backgroundImage: AssetImage(
                              ImageAssetConstants.AVATER_ICON,
                            ),
                          ),
                          Positioned(
                            width: 40,
                            top: 55,
                            left: 60,
                            child: FloatingActionButton(
                              elevation: 0,
                              child: Icon(Icons.camera_alt),
                              onPressed: () {},
                              backgroundColor: Colors.purple,
                            ),
                          )
                        ],
                      ),
                    ),
                    Card(
                      color: Colors.blue,
                      elevation: 8,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
                top: 160,
                bottom: 35,
                left: 25,
                right: 25,
                child: Material(
                  elevation: 8,
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 20.0, left: 15.0, right: 15.0, bottom: 15.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              'Edit Profile',
                              style: TextStyle(
                                color: Color(0xff330055),
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'USERNAME',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            ),
                          ),
                          Container(
                            child: TextField(
                              cursorHeight: 24,
                              onChanged: (value) {},
                              decoration: InputDecoration(
                                focusColor: Color(0xff330055),
                                disabledBorder: InputBorder.none,
                                hintText: '3-6ixty',
                                hintStyle: TextStyle(
                                  color: Color(0xff330055),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 12),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'FULL NAME',
                              style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                          ),
                          TextField(
                            cursorHeight: 24,
                            onChanged: (value) {},
                            decoration: InputDecoration(
                              focusColor: Color(0xff330055),
                              hintText: 'Ityavyar Vershima Kelvin',
                              hintStyle: TextStyle(
                                color: Color(0xff330055),
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ),
                          SizedBox(height: 12),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'PHONE NUMBER',
                              style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                          ),
                          TextField(
                            cursorHeight: 24,
                            onChanged: (value) {},
                            decoration: InputDecoration(
                              focusColor: Color(0xff330055),
                              hintText: '08148429834',
                              hintStyle: TextStyle(
                                color: Color(0xff330055),
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ),
                          SizedBox(height: 12),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'PROFESSION',
                              style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                          ),
                          TextField(
                            cursorHeight: 24,
                            onChanged: (value) {},
                            decoration: InputDecoration(
                              focusColor: Color(0xff330055),
                              hintText: 'Software Engineer',
                              hintStyle: TextStyle(
                                color: Color(0xff330055),
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ),
                          SizedBox(height: 12),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Organization',
                              style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ),
                          TextField(
                            cursorHeight: 24,
                            onChanged: (value) {},
                            decoration: InputDecoration(
                              focusColor: Color(0xff330055),
                              hintText: 'BAREFOOTED',
                              hintStyle: TextStyle(
                                color: Color(0xff330055),
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ),
                          SizedBox(height: 12),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'LOCATION',
                              style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ),
                          TextField(
                            cursorHeight: 24,
                            onChanged: (value) {},
                            decoration: InputDecoration(
                              focusColor: Color(0xff330055),
                              hintText: 'Calabar',
                              hintStyle: TextStyle(
                                color: Color(0xff330055),
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ),
                          SizedBox(height: 18),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Color(0xff330055),
                            ),

                            //padding: EdgeInsets.only(left: 15),
                            width: 300,
                            height: 50.0,
                            child: OutlineButton(
                              shape: new RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0)),
                              color: Color(0xff330055),
                              onPressed: () {},
                              child: Text(
                                'Update',
                                style: TextStyle(
                                  letterSpacing: 2,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 16.0,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
