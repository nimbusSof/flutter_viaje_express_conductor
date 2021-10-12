import 'package:flutter/cupertino.dart';

class FormsConductor extends ChangeNotifier {
  GlobalKey<FormState> formkeyConfPerfil = new GlobalKey<FormState>();
  GlobalKey<FormState> formkeyCambiarNumero = new GlobalKey<FormState>();
  GlobalKey<FormState> formkeyViajeNuevo= new GlobalKey<FormState>();
  

  bool isValidFormConfPerfil() {
    return formkeyConfPerfil.currentState?.validate() ?? false;
  }

  bool isValidFormCambiarNumero() {
    return formkeyCambiarNumero.currentState?.validate() ?? false;
  }

  bool isValidFormkeyViajeNuevo() {
    return formkeyViajeNuevo.currentState?.validate() ?? false;
  }

}
