import 'package:flutter/widgets.dart';

class ManageKeyboard {
  static void hidekeyBord(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }
}
                                                                   