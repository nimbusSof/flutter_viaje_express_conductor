import 'package:flutter/cupertino.dart';

class FormsConductor extends ChangeNotifier {
  GlobalKey<FormState> formkeyConfPerfil = new GlobalKey<FormState>();
  

  bool isValidFormConfPerfil() {
    return formkeyConfPerfil.currentState?.validate() ?? false;
  }

}
