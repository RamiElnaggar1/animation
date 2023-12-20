import 'package:design_app_animation/core/app_colors.dart';
import 'package:design_app_animation/core/components_animation/slide_fade_transition.dart';
import 'package:design_app_animation/core/helper.dart';
import 'package:design_app_animation/features/app/views/app_home.dart';
import 'package:design_app_animation/features/login/views/widgets/button_login_screen.dart';
import 'package:design_app_animation/features/login/views/widgets/text_field_login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreenBody extends StatefulWidget {
  const LoginScreenBody({super.key});

  @override
  State<LoginScreenBody> createState() => _LoginScreenBodyState();
}

class _LoginScreenBodyState extends State<LoginScreenBody>
    with TickerProviderStateMixin {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  late AnimationController _animationController;
  String? _errorsEmail;
  String? _errorsPassword;
  final GlobalKey<FormState> key = GlobalKey();

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
  }

  @override
  void dispose() {
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _animationController.dispose();
    debugPrint('Dispose Body Is Success');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: key,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SlideFadeTransition(
              beginOffset: const Offset(0, 0.3),
              endOffset: const Offset(0.0, 0.0),
              duration: const Duration(milliseconds: 600),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Login',
                  style: TextStyle(
                    color: AppColors.color1,
                    fontSize: 60,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            SlideFadeTransition(
              beginOffset: const Offset(0, 0.3),
              endOffset: const Offset(0.0, 0.0),
              duration: const Duration(milliseconds: 800),
              child: SvgPicture.asset(
                'assets/images/login.svg',
                width: 110,
                height: 110,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            TextFieldLoginScreen(
              errorMessageEmail: _errorsEmail,
              errorMessagePassword: _errorsPassword,
              emailController: _emailController,
              passwordController: _passwordController,
              emailFocusNode: _emailFocusNode,
              passwordFocusNode: _passwordFocusNode,
              validatePassword: (value) {
                _errorsPassword = _validatePassword(value!);
                return null;
              },
              validateEmail: (value) {
                _errorsEmail = _validateEmail(value!);
                return null;
              },
            ),
            SlideFadeTransition(
              beginOffset: const Offset(0, 2.0),
              endOffset: const Offset(0, 0.0),
              duration: const Duration(milliseconds: 1200),
              child: ButtonLoginScreen(
                pressed: () {
                  _checkEmailOrPassword();

                  _reverseButton();
                  _unFocusTextField();
                },
                controller: _animationController,
              ),
            ),
          ],
        ),
      ),
    );
  }

  _reverseButton() {
    _animationController.forward();
    Future.delayed((const Duration(milliseconds: 200)), () {
      _animationController.reverse();
    });
  }

  _unFocusTextField() {
    _passwordFocusNode.unfocus();
    _emailFocusNode.unfocus();
  }
  _checkEmailOrPassword() {
    setState(() {
      if (key.currentState!.validate()) {
        String? validateEmail =
        _validateEmail(_emailController.text);
        String? validatePassword =
        _validatePassword(_passwordController.text);
        if (validateEmail == null && validatePassword == null) {
          context
              .navigatorAndRemoveScreen(const AppHome());
        }
      }
    });
  }

  _validateEmail(String value) {
    if (value.isEmpty) {
      return 'Please Enter Your Email';
    } else if (!value.contains('@')) {
      return 'Please Add @';
    } else if (!value.contains('gmail.com')) {
      return 'Emails from email.com are not allowed';
    } else if (value.length <= 5) {
      return 'Email Is Too Short';
    }
  }
}



_validatePassword(String value) {
  if (value.isEmpty) {
    return 'Please Enter Your Password';
  }
}
