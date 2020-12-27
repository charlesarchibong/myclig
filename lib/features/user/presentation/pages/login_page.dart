import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myclig/core/constants/colors_constant.dart';
import 'package:myclig/core/constants/route_names.dart';
import 'package:myclig/core/dependencies/injection_container.dart';
import 'package:myclig/core/utils/email_validator.dart';
import 'package:myclig/core/utils/flush_bar_notification.dart';
import 'package:myclig/features/user/presentation/bloc/login/login_bloc.dart';
import 'package:myclig/features/user/presentation/bloc/login/login_event.dart';
import 'package:myclig/features/user/presentation/bloc/login/login_state.dart';
import 'package:myclig/features/user/presentation/widgets/top_right_corner_widget.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isHiddenPassword = true;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Material(
      color: ColorConstant.PRIMARY_COLOR,
      child: SafeArea(
        child: BlocConsumer<LoginBloc, LoginStates>(
            listener: (context, state) =>
                _listenToRegistrationState(context, state),
            builder: (context, state) {
              return Container(
                // padding: EdgeInsets.only(top: 130),
                color: Colors.white,
                child: Stack(children: [
                  TopRightCornerWidget(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding:
                            EdgeInsets.only(left: 20.0, right: 20.0, top: 50),
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
                                child: TextFormField(
                                  controller: _emailController,
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
                                child: TextFormField(
                                  controller: _passwordController,
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
                                    color: state is LoadingLoginState
                                        ? ColorConstant.LOADING_COLOR
                                        : ColorConstant.PRIMARY_COLOR,
                                    onPressed: state is LoadingLoginState
                                        ? () {}
                                        : _loginUser,
                                    child: Text(
                                      state is LoadingLoginState
                                          ? 'Loading...'
                                          : 'Login',
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
              );
            }),
      ),
    );
  }

  void _loginUser() {
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

    if (_passwordController.text.isEmpty) {
      FlushBarNotification.showErrorMessage(
        context: context,
        message: 'Password can not be empty',
        title: 'Error',
      );
      return;
    }

    sl<LoginBloc>().add(
      AuthenticateEvent(
        email: _emailController.text,
        password: _passwordController.text,
      ),
    );
  }

  void _listenToRegistrationState(BuildContext context, LoginStates userState) {
    if (userState is LoginErrorState) {
      FlushBarNotification.showErrorMessage(
        context: context,
        message: userState.message,
        title: 'Error',
      );
    } else if (userState is LoggedInState) {
      if (userState.userEntity.verified) {
        Navigator.pushNamed(
          context,
          DASHBOARD_SCREEN,
        );
      } else {
        Navigator.pushNamed(
          context,
          VERIFY_REGISTRATION_SCREEN,
          arguments: userState.userEntity,
        );
      }
    }
  }

  void togglePassword() {
    setState(() {
      isHiddenPassword = !isHiddenPassword;
    });
  }
}
