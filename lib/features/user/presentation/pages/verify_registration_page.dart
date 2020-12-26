import 'dart:io';

import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:myclig/core/constants/colors_constant.dart';
import 'package:myclig/core/constants/image_assets_constnts.dart';
import 'package:myclig/core/constants/route_names.dart';
import 'package:myclig/core/dependencies/injection_container.dart';
import 'package:myclig/core/utils/flush_bar_notification.dart';
import 'package:myclig/core/utils/phone_number_validator.dart';
import 'package:myclig/features/user/domain/entities/user_entity.dart';
import 'package:myclig/features/user/presentation/bloc/user_bloc.dart';
import 'package:myclig/features/user/presentation/bloc/user_event.dart';
import 'package:myclig/features/user/presentation/bloc/user_state.dart';

class VerifyRegistrationPage extends StatefulWidget {
  final UserEntity userEntity;
  const VerifyRegistrationPage({
    Key key,
    @required this.userEntity,
  }) : super(key: key);
  @override
  _VerifyRegistrationPageState createState() => _VerifyRegistrationPageState();
}

class _VerifyRegistrationPageState extends State<VerifyRegistrationPage> {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _professionController = TextEditingController();
  final TextEditingController _organizationController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _referralController = TextEditingController();
  File _image;
  final picker = ImagePicker();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Material(
        color: ColorConstant.PRIMARY_COLOR,
        child: SafeArea(
          child: BlocConsumer<UserBloc, UserState>(
              listener: (context, state) =>
                  _listenToRegistrationVerifyState(context, state),
              builder: (context, state) {
                return Container(
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
                            'Hi! ${widget.userEntity.fullName},',
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
                                Center(
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
                                                  ? AssetImage(
                                                      ImageAssetConstants
                                                          .AVATER_ICON,
                                                    )
                                                  : FileImage(_image),
                                            ),
                                            Positioned(
                                              width: 40,
                                              top: 55,
                                              left: 60,
                                              child: FloatingActionButton(
                                                elevation: 0,
                                                child: Icon(
                                                  Icons.camera_alt,
                                                ),
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
                              ],
                            ),
                          ),
                          SizedBox(height: 20.0),
                          Container(
                            child: TextFormField(
                              controller: _userNameController,
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
                            child: TextFormField(
                              controller: _phoneController,
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
                                hintText: 'Phone Number (eg 09030311000)',
                                hintStyle: TextStyle(
                                  fontFamily: 'Slabo27px',
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20.0),
                          Container(
                            child: TextFormField(
                              controller: _professionController,
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
                            child: TextFormField(
                              controller: _organizationController,
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
                            child: TextFormField(
                              controller: _locationController,
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
                            child: TextFormField(
                              controller: _referralController,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.number,
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
                                color: state is LoadingUserState
                                    ? ColorConstant.LOADING_COLOR
                                    : ColorConstant.PRIMARY_COLOR,
                                onPressed: state is LoadingUserState
                                    ? () {}
                                    : _loginUser,
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
                          ),
                          SizedBox(height: 60.0),
                        ],
                      ),
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }

  void _loginUser() {
    if (_userNameController.text.isEmpty) {
      FlushBarNotification.showErrorMessage(
        context: context,
        message: 'Username can not be empty',
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
    if (_image == null) {
      FlushBarNotification.showErrorMessage(
        context: context,
        message: 'Please upload a profile picture',
        title: 'Error',
      );
      return;
    }

    UserEntity userEntity = UserEntity(
      email: widget.userEntity.email,
      fullName: widget.userEntity.fullName,
      userId: widget.userEntity.userId,
      fcmToken: widget.userEntity.fcmToken,
      verified: true,
      location: _locationController.text,
      organization: _organizationController.text,
      phone: '+' +
          PhoneNumberValidator.getValidPhoneNumber(
            _phoneController.text,
          ),
      profession: _professionController.text,
      username: _userNameController.text,
      referalCode: _referralController.text,
    );
    sl<UserBloc>().add(
      RegisterOrUpdateUserEvent(userEntity: userEntity, file: _image),
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
      print(userState.userEntity.fullName);
      Navigator.pushNamed(
        context,
        DASHBOARD_SCREEN,
        arguments: userState.userEntity,
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
