import 'package:design_app_animation/core/components_animation/slide_fade_transition.dart';
import 'package:design_app_animation/core/components_widget/custom_text_field_widget.dart';
import 'package:flutter/material.dart';

class TextFieldLoginScreen extends StatefulWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final FocusNode emailFocusNode;
  final FocusNode passwordFocusNode;
  final String? errorMessageEmail;
  final String? errorMessagePassword;
  final String? Function(String?)? validateEmail;
  final String? Function(String?)? validatePassword;
  const TextFieldLoginScreen({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.emailFocusNode,
    required this.passwordFocusNode,
    this.errorMessageEmail,
    this.errorMessagePassword,
    this.validatePassword,
    this.validateEmail,
  });



  @override
  State<TextFieldLoginScreen> createState() => _TextFieldLoginScreenState();
}

class _TextFieldLoginScreenState extends State<TextFieldLoginScreen> {
  @override
  void initState() {
    super.initState();
    _focusNodeAddListener();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SlideFadeTransition(
          beginOffset: const Offset(0, 2.0),
          endOffset: const Offset(0, 0.0),
          duration:const Duration(milliseconds: 900) ,
          child: CustomTextFieldWidget(
            errorMessage: widget.errorMessageEmail,
            validate: widget.validateEmail,
            controller: widget.emailController,
            labelText: 'Email',
            suffixIcon: const Icon(Icons.email),
            focusNode: widget.emailFocusNode,
            buttonTypeCopy: ContextMenuButtonType.copy,
            buttonTypeCut: ContextMenuButtonType.cut,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        SlideFadeTransition(
          beginOffset: const Offset(0, 2.0),
          endOffset: const Offset(0, 0.0),
          duration: const Duration(milliseconds: 1100),
          child: CustomTextFieldWidget(
            errorMessage: widget.errorMessagePassword,
            validate: widget.validatePassword,
            controller: widget.passwordController,
            labelText: 'Password',
            suffixIcon: const Icon(Icons.lock),
            focusNode: widget.passwordFocusNode,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }

  _focusNodeAddListener() {
    widget.emailFocusNode.addListener(() {
      setState(() {});
    });
    widget.passwordFocusNode.addListener(() {
      setState(() {});
    });
  }
}
