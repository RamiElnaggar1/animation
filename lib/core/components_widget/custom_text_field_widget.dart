import 'package:design_app_animation/core/app_colors.dart';
import 'package:design_app_animation/core/helper.dart';
import 'package:flutter/material.dart';

class CustomTextFieldWidget extends StatelessWidget {
  const CustomTextFieldWidget({
    super.key,
    required this.controller,
    required this.labelText,
    required this.suffixIcon,
    required this.focusNode,
    this.buttonTypeCopy,
    this.buttonTypeCut,
    this.buttonTypePaste,
    this.buttonTypeSelectAll,
    this.errorMessage,

    this.validate,
  });

  final TextEditingController controller;
  final String labelText;
  final Icon suffixIcon;
  final FocusNode focusNode;
  final ContextMenuButtonType? buttonTypeCopy;
  final ContextMenuButtonType? buttonTypeCut;
  final ContextMenuButtonType? buttonTypePaste;
  final ContextMenuButtonType? buttonTypeSelectAll;

  final String? Function(String?)? validate;
  final String? errorMessage;

  @override
  Widget build(BuildContext context) {
    Color colorField = focusNode.hasFocus
        ? (errorMessage != null ? AppColors.redColor : AppColors.color2)
        : (errorMessage != null ? AppColors.redColor : AppColors.color1);

    return TextFormField(
      controller: controller,
      contextMenuBuilder: (context, editableText) {
        return AdaptiveTextSelectionToolbar.buttonItems(
          buttonItems: _contextMenuButton(editableText),
          anchors: editableText.contextMenuAnchors,
        );
      },
      validator: validate,

      style: TextStyle(
        color: colorField,
        fontSize: 18,
        fontWeight: FontWeight.w700,
      ),
      focusNode: focusNode,
      cursorColor: colorField,
      cursorOpacityAnimates: true,
      decoration: InputDecoration(
        labelText: focusNode.hasFocus ? labelText.toLowerCase() : labelText,
        labelStyle: TextStyle(
          color: colorField,
          fontWeight: FontWeight.w500,
          fontSize: 20,
        ),
        suffixIconColor: colorField,
        suffixIcon: suffixIcon,
        border: _enableBorder(),
        errorStyle: const TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 11,
        ),
        errorText: errorMessage,
        errorBorder: _errorBorder(),
        enabledBorder: _enableBorder(),
        focusedBorder: _focusedBorder(),
      ),
    );
  }

  OutlineInputBorder _errorBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        color: AppColors.redColor,
        width: 2,
      ),
    );
  }

  OutlineInputBorder _enableBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        color: AppColors.color1,
        width: 2,
      ),
    );
  }

  OutlineInputBorder _focusedBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: BorderSide(
        color: AppColors.color2,
        width: 2,
      ),
    );
  }

  List<ContextMenuButtonItem> _contextMenuButton(
      EditableTextState editableText) {
    return [
      if (buttonTypeCopy != null)
        ContextMenuButtonItem(
          onPressed: () {
            editableText.isCopy;
          },
          type: buttonTypeCopy!,
        ),
      if (buttonTypeCut != null)
        ContextMenuButtonItem(
          onPressed: () {
            editableText.isCut;
          },
          type: buttonTypeCut!,
        ),
      if (buttonTypePaste != null)
        ContextMenuButtonItem(
          onPressed: () {
            editableText.isPaste;
          },
          type: buttonTypePaste!,
        ),
      if (buttonTypeSelectAll != null)
        ContextMenuButtonItem(
          onPressed: () {
            editableText.isSelectAll;
          },
          type: ContextMenuButtonType.selectAll,
        ),
    ];
  }
}
