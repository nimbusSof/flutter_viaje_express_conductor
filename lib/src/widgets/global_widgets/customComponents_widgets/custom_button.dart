import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:flutter_viaje_express_conductor/src/services/signin_services/auth_service.dart';
import 'package:flutter_viaje_express_conductor/src/utils/colors.dart';
import 'package:provider/provider.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;

  const CustomButton({Key? key, required this.text, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //margin:  EdgeInsets.symmetric(vertical: 10),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 2,
            shape: StadiumBorder(),
            primary: yellowColor,
          ),
          onPressed: this.onPressed,
          child: Container(
            width: double.infinity,
            height: 55,
            child: Center(
              child: Text(
                this.text,
                style: TextStyle(fontSize: 20),
              ),
            ),
          )),
    );
  }
}

class BtnSimple extends StatelessWidget {
  final String texto;
  final String? ruta;

  const BtnSimple({required this.texto, this.ruta});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(top: size.height * 0.003),
      margin: EdgeInsets.symmetric(horizontal: size.width * 0.01),
      child: MaterialButton(
        onPressed: this.ruta != null
            ? () async {
                if (this.ruta == 'login') {
                  final authService =
                      Provider.of<AuthService>(context, listen: false);
                  authService.logout();
                  //al salir se restablecerá la aplicación con el idioma que tenga configurado
                  //el dispositivo, ya que el idioma es una preferencia de usuario
                  String idiomaDispositivo =
                      context.deviceLocale.toString().substring(0, 2);
                  print(idiomaDispositivo);
                  if (idiomaDispositivo == 'es' || idiomaDispositivo == 'en') {
                    await context.setLocale(Locale(idiomaDispositivo));
                  } else {
                    context.setLocale(context.locale);
                  }
                  Navigator.pushNamedAndRemoveUntil(
                      context, 'login', (route) => false);
                }
                Navigator.pushReplacementNamed(context, this.ruta!);
              }
            : () {},
        child: Container(
            padding: EdgeInsets.fromLTRB(
                0, size.height * 0.02, 0, size.height * 0.02),
            // aquí se define las longitudes del botón
            width: double.infinity,
            height: size.height * 0.07,
            child: RichText(
                text: TextSpan(
                    text: this.texto,
                    style: TextStyle(fontSize: 20, color: Colors.black)))),
      ),
    );
  }
}

class BtnSimpleIcon extends StatelessWidget {
  final String texto;
  final String? ruta;
  final IconData icono;
  final Color? color;

  const BtnSimpleIcon(
      {required this.texto, this.ruta, required this.icono, this.color});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(top: size.height * 0.01),
      margin: EdgeInsets.symmetric(horizontal: size.width * 0.01),
      child: MaterialButton(
        onPressed: this.ruta != null
            ? () {
                Navigator.pushReplacementNamed(context, this.ruta!);
              }
            : () {},
        child: Container(
          // aquí se define las longitudes del botón
          width: double.infinity,
          height: size.height * 0.07,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                this.icono,
                color: this.color != null ? this.color : Colors.black,
                size: 32,
              ),
              SizedBox(
                width: 15,
              ),
              Text(
                this.texto,
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
