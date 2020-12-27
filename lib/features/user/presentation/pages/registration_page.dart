import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myclig/core/constants/colors_constant.dart';
import 'package:myclig/core/constants/route_names.dart';
import 'package:myclig/core/dependencies/injection_container.dart';
import 'package:myclig/core/utils/email_validator.dart';
import 'package:myclig/core/utils/flush_bar_notification.dart';
import 'package:myclig/features/user/domain/entities/user_entity.dart';
import 'package:myclig/features/user/presentation/bloc/user/create_account_bloc.dart';
import 'package:myclig/features/user/presentation/bloc/user/user_event.dart';
import 'package:myclig/features/user/presentation/bloc/user/user_state.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  bool isHiddenPassword = true;
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // sl<UserBloc>()
  @override
  void dispose() {
    // sl<UserBloc>().close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: ColorConstant.PRIMARY_COLOR,
      child: SafeArea(
        child: BlocConsumer<CreateAccountBloc, UserState>(
            listener: (context, state) => _listenToRegistrationState(
                  state,
                  context,
                ),
            builder: (context, state) {
              return Container(
                color: Colors.white,
                child: Container(
                  padding: EdgeInsets.only(
                    left: 20.0,
                    right: 20.0,
                    top: 120,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Create Account,',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 27.0,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          'Sign up below to get started',
                          style: TextStyle(
                            fontSize: 17.0,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 40.0),
                        Container(
                          child: TextFormField(
                            controller: _fullNameController,
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
                              hintText: 'Full Name',
                              hintStyle: TextStyle(
                                fontFamily: 'Slabo27px',
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20.0),
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
                                    horizontal: 10.0, vertical: 10.0),
                                child: Icon(
                                  Icons.mail,
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
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    color: ColorConstant.PRIMARY_COLOR,
                                  )),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: ColorConstant.PRIMARY_COLOR,
                                    width: 1.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.grey[800], width: 1.0),
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
                                  : _registerUser,
                              child: Text(
                                state is LoadingUserState
                                    ? 'Loading...'
                                    : 'Register',
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
                              LOGIN_SCREEN,
                            );
                          },
                          child: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Have account? ',
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    color: Colors.black87,
                                  ),
                                ),
                                Text(
                                  'Sign in',
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
              );
            }),
      ),
    );
  }

  void _registerUser() {
    if (_fullNameController.text.isEmpty) {
      FlushBarNotification.showErrorMessage(
        context: context,
        message: 'Full name can not be empty',
        title: 'Error',
      );
      return;
    }
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
    UserEntity userEntity = UserEntity(
      email: _emailController.text,
      fullName: _fullNameController.text,
      password: _passwordController.text,
    );
    sl<CreateAccountBloc>().add(
      RegisterOrUpdateUserEvent(
        userEntity: userEntity,
      ),
    );
  }

  void _listenToRegistrationState(UserState userState, BuildContext context) {
    if (userState is ErrorUserState) {
      FlushBarNotification.showErrorMessage(
        context: context,
        message: userState.message,
        title: 'Error',
      );
    } else if (userState is LoadedUserState) {
      Navigator.pushNamed(
        context,
        VERIFY_REGISTRATION_SCREEN,
        arguments: userState.userEntity,
      );
    }
  }

  void togglePassword() {
    setState(() {
      isHiddenPassword = !isHiddenPassword;
    });
  }
}
