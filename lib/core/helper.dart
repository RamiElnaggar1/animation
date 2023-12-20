import 'package:flutter/material.dart';

extension MediaQueryHelper on BuildContext {
  double get height => MediaQuery.of(this).size.height;
}

extension NavigatorHelper on BuildContext {
  void navigatorAndRemoveScreen(Widget widget) {
    Navigator.of(this).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => widget),
      (route) => false,
    );
  }
}

extension MaterialStateSet on Set<MaterialState> {
  bool get isPressed => contains(
        MaterialState.pressed,
      );
}

extension OptionSelectText on EditableTextState {
  get isSelectAll => selectAll(SelectionChangedCause.toolbar);

  get isCopy => copySelection(SelectionChangedCause.toolbar);

  get isCut => cutSelection(SelectionChangedCause.toolbar);

  get isPaste => pasteText(SelectionChangedCause.toolbar);
}
