import 'package:flutter/cupertino.dart';

class SignInFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formkeylogin = new GlobalKey<FormState>();

  bool isValidFormLogin() {
    return formkeylogin.currentState?.validate() ?? false;
  }

}
