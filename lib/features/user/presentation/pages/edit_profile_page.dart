import 'dart:io';

import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:myclig/core/constants/colors_constant.dart';
import 'package:myclig/core/constants/image_assets_constnts.dart';
import 'package:myclig/core/dependencies/injection_container.dart';
import 'package:myclig/core/local_data/user_data/get_loggedin_user_data.dart';
import 'package:myclig/core/utils/flush_bar_notification.dart';
import 'package:myclig/core/utils/phone_number_validator.dart';
import 'package:myclig/features/user/domain/entities/user_entity.dart';
import 'package:myclig/features/user/presentation/bloc/user_bloc.dart';
import 'package:myclig/features/user/presentation/bloc/user_event.dart';
import 'package:myclig/features/user/presentation/bloc/user_state.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  GetLoggedInUserData getLoggedInUserData;
  UserEntity userEntity;
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _fullNameController = TextEditingController();

  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _professionController = TextEditingController();
  final TextEditingController _organizationController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  File _image;
  final picker = ImagePicker();
  @override
  void initState() {
    getLoggedInUserData = sl<GetLoggedInUserData>();
    userEntity = getLoggedInUserData();
    _userNameController.text = userEntity.username;
    _phoneController.text = userEntity.phone;
    _professionController.text = userEntity.profession;
    _organizationController.text = userEntity.organization;
    _locationController.text = userEntity.location;
    _fullNameController.text = userEntity.fullName;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[400],
      body: BlocConsumer<UserBloc, UserState>(
          listener: (context, state) => _listenToRegistrationVerifyState(
                context,
                state,
              ),
          builder: (context, state) {
            return SafeArea(
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
                                  backgroundImage: _image == null
                                      ? userEntity.photoUrl == null
                                          ? AssetImage(
                                              ImageAssetConstants.AVATER_ICON)
                                          : NetworkImage(
                                              userEntity?.photoUrl,
                                            )
                                      : FileImage(_image),
                                ),
                                Positioned(
                                  width: 40,
                                  top: 55,
                                  left: 60,
                                  child: FloatingActionButton(
                                    elevation: 0,
                                    child: Icon(Icons.camera_alt),
                                    onPressed: () {
                                      _showPicker(context);
                                    },
                                    backgroundColor:
                                        ColorConstant.PRIMARY_COLOR,
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
                                top: 20.0,
                                left: 15.0,
                                right: 15.0,
                                bottom: 15.0),
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
                                  child: TextFormField(
                                    controller: _userNameController,
                                    cursorHeight: 24,
                                    onChanged: (value) {},
                                    decoration: InputDecoration(
                                      focusColor: Color(0xff330055),
                                      disabledBorder: InputBorder.none,
                                      hintText: '${userEntity?.username}',
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
                                TextFormField(
                                  controller: _fullNameController,
                                  cursorHeight: 24,
                                  onChanged: (value) {},
                                  decoration: InputDecoration(
                                    focusColor: Color(0xff330055),
                                    hintText: '${userEntity?.fullName}',
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
                                TextFormField(
                                  cursorHeight: 24,
                                  controller: _phoneController,
                                  onChanged: (value) {},
                                  decoration: InputDecoration(
                                    focusColor: Color(0xff330055),
                                    hintText: '${userEntity?.phone}',
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
                                TextFormField(
                                  controller: _professionController,
                                  cursorHeight: 24,
                                  onChanged: (value) {},
                                  decoration: InputDecoration(
                                    focusColor: Color(0xff330055),
                                    hintText: '${userEntity?.profession}',
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
                                TextFormField(
                                  controller: _organizationController,
                                  cursorHeight: 24,
                                  onChanged: (value) {},
                                  decoration: InputDecoration(
                                    focusColor: Color(0xff330055),
                                    hintText: '${userEntity?.organization}',
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
                                TextFormField(
                                  controller: _locationController,
                                  cursorHeight: 24,
                                  onChanged: (value) {},
                                  decoration: InputDecoration(
                                    focusColor: Color(0xff330055),
                                    hintText: '${userEntity?.location}',
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
                                  child: FlatButton(
                                    color: state is LoadingUserState
                                        ? ColorConstant.LOADING_COLOR
                                        : ColorConstant.PRIMARY_COLOR,
                                    onPressed: state is LoadingUserState
                                        ? () {}
                                        : _updateUser,
                                    child: Text(
                                      state is LoadingUserState
                                          ? 'Loading...'
                                          : 'Update Profile',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20.0,
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
            );
          }),
    );
  }

  void _updateUser() {
    if (_userNameController.text.isEmpty) {
      FlushBarNotification.showErrorMessage(
        context: context,
        message: 'Username can not be empty',
        title: 'Error',
      );
      return;
    }
    if (_fullNameController.text.isEmpty) {
      FlushBarNotification.showErrorMessage(
        context: context,
        message: 'Fullname can not be empty',
        title: 'Error',
      );
      return;
    }
    if (_phoneController.text.isEmpty) {
      FlushBarNotification.showErrorMessage(
        context: context,
        message: 'Phone can not be empty',
        title: 'Error',
      );
      return;
    }

    if (_professionController.text.isEmpty) {
      FlushBarNotification.showErrorMessage(
        context: context,
        message: 'Profession can not be empty',
        title: 'Error',
      );
      return;
    }
    if (_organizationController.text.isEmpty) {
      FlushBarNotification.showErrorMessage(
        context: context,
        message: 'Organization can not be empty',
        title: 'Error',
      );
      return;
    }
    if (_locationController.text.isEmpty) {
      FlushBarNotification.showErrorMessage(
        context: context,
        message: 'Location can not be empty',
        title: 'Error',
      );
      return;
    }

    UserEntity userEntityNew = UserEntity(
      email: userEntity.email,
      fullName: _fullNameController.text,
      userId: userEntity.userId,
      fcmToken: userEntity.fcmToken,
      verified: true,
      location: _locationController.text,
      organization: _organizationController.text,
      phone: PhoneNumberValidator.getValidPhoneNumber(
        _phoneController.text,
      ),
      photoUrl: userEntity.photoUrl,

      profession: _professionController.text,
      username: _userNameController.text,
      checkEmailAndUsername: false,
      // referalCode: _referralController.text,
    );
    print(userEntity.userId);
    sl<UserBloc>().add(
      RegisterOrUpdateUserEvent(userEntity: userEntityNew, file: _image),
    );
  }

  void _listenToRegistrationVerifyState(
    BuildContext context,
    UserState userState,
  ) {
    if (userState is ErrorUserState) {
      FlushBarNotification.showErrorMessage(
        context: context,
        message: userState.message,
        title: 'Error',
      );
    } else if (userState is LoadedUserState) {
      FlushBarNotification.showSuccessMessage(
        context: context,
        title: 'Success',
        message: 'Your profile was updated',
      );
    }
  }

  Future _imgFromGallery() async {
    try {
      final pickedFile = await picker.getImage(
        source: ImageSource.gallery,
        imageQuality: 50,
      );
      // int file = File(pickedFile.path).lengthSync();
      // if (!(file <= 1048576)) {
      //   FlushbarHelper.createError(
      //     message: 'File size must not be more than 1MB',
      //     title: 'Oops!!!',
      //     duration: Duration(
      //       seconds: 20,
      //     ),
      //   )..show(context);
      // }
      setState(() {
        if (pickedFile != null) {
          _image = File(pickedFile.path);
        } else {
          print('No image selected.');
        }
      });
    } catch (e) {
      FlushbarHelper.createError(
        message: 'An error occured while trying to select ID card',
        title: 'Oops!!!',
        duration: Duration(
          seconds: 20,
        ),
      )..show(context);
    }
  }

  Future _imgFromCamera() async {
    try {
      final pickedFile = await picker.getImage(
        source: ImageSource.camera,
        imageQuality: 50,
      );
      // int file = File(pickedFile.path).lengthSync();
      // if (!(file <= 1048576)) {
      //   FlushbarHelper.createError(
      //     message: 'File size must not be more than 1MB',
      //     title: 'Oops!!!',
      //     duration: Duration(
      //       seconds: 20,
      //     ),
      //   )..show(context);
      // }
      setState(() {
        if (pickedFile != null) {
          _image = File(pickedFile.path);
        } else {
          print('No image selected.');
        }
      });
    } catch (e) {
      FlushbarHelper.createError(
        message: 'An error occured while trying to select ID card',
        title: 'Oops!!!',
        duration: Duration(
          seconds: 20,
        ),
      )..show(context);
    }
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(
                        Icons.photo_library,
                        color: Theme.of(context).primaryColor,
                      ),
                      title: new Text(
                        'Photo Library',
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      onTap: () {
                        _imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(
                      Icons.photo_camera,
                      color: Theme.of(context).primaryColor,
                    ),
                    title: new Text(
                      'Camera',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    onTap: () {
                      _imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }
}
