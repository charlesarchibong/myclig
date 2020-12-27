import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myclig/core/constants/colors_constant.dart';
import 'package:myclig/core/dependencies/injection_container.dart';
import 'package:myclig/core/utils/email_validator.dart';
import 'package:myclig/core/utils/flush_bar_notification.dart';
import 'package:myclig/features/user/presentation/bloc/user_bloc.dart';
import 'package:myclig/features/user/presentation/bloc/user_event.dart';
import 'package:myclig/features/user/presentation/bloc/user_state.dart';
import 'package:myclig/features/user/presentation/widgets/top_right_corner_widget.dart';

class ForgetPasswordPage extends StatefulWidget {
  @override
  _ForgetPasswordPageState createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  bool isHiddenPassword = true;
  TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Material(
      color: ColorConstant.PRIMARY_COLOR,
      child: SafeArea(
          child: BlocConsumer<UserBloc, UserState>(
              key: Key('ddddd'),
              listener: (context, state) => _listenToRegistrationState(
                    context,
                    state,
                  ),
              builder: (context, state) {
                return Container(
                  // padding: EdgeInsets.only(top: 130),
                  color: Colors.white,
                  child: Stack(
                    children: [
                      TopRightCornerWidget(),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.only(
                                left: 20.0, right: 20.0, top: 50),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
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
                                  child: TextFormField(
                                    controller: _emailController,
                                    textInputAction: TextInputAction.next,
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: ColorConstant.PRIMARY_COLOR,
                                            width: 1.0),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey[800],
                                            width: 1.0),
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
                                SizedBox(height: 30.0),
                                Center(
                                  child: Container(
                                    // padding: EdgeInsets.only(left: 15),
                                    width: 300,
                                    height: 50.0,
                                    child: FlatButton(
                                      color: state is LoadingUserState
                                          ? ColorConstant.LOADING_COLOR
                                          : ColorConstant.PRIMARY_COLOR,
                                      onPressed: state is LoadingUserState
                                          ? () {}
                                          : _resetPassword,
                                      child: Text(
                                        state is LoadingUserState
                                            ? 'Loading...'
                                            : 'Reset Password',
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
                    ],
                  ),
                );
              })),
    );
  }

  void _resetPassword() {
    if (_emailController.text.isEmpty) {
      FlushBarNotification.showErrorMessage(
        context: context,
        message: 'Email can not be empty',
        title: 'Error',
      );
      return;
    }
    // print(EmailValidator.validEmail(_fullNameController.text));
    if (!EmailValidator.validEmail(_emailController.text)) {
      FlushBarNotification.showErrorMessage(
        context: context,
        message: 'Email is not a valid email',
        title: 'Error',
      );
      return;
    }

    sl<UserBloc>().add(
      ResetPasswordEvent(
        email: _emailController.text,
      ),
    );
  }

  void _listenToRegistrationState(BuildContext context, UserState userState) {
    if (userState is ErrorUserState) {
      FlushBarNotification.showErrorMessage(
        context: context,
        message: userState.message,
        title: 'Error',
      );
    } else if (userState is LoadedUserState) {
      FlushBarNotification.showSuccessMessage(
          context: context,
          message:
              'We have sent a password reset mail to you, please kindly check your inbox and follow the steps to reset your password');
    }
  }
}
