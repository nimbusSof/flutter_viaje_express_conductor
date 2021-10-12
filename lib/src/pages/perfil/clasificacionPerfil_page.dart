import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_viaje_express_conductor/src/shared_prefs/preferencias_usuario.dart';

import 'package:flutter_viaje_express_conductor/src/utils/colors.dart';
import 'package:flutter_viaje_express_conductor/src/widgets/perfil_widgets/comentarios_widget.dart';
import 'package:flutter_viaje_express_conductor/src/widgets/perfil_widgets/ratingBar_widget.dart';


class ClasificacionPerfilPage extends StatelessWidget {
  final prefs = new PreferenciasUsuario();
  @override
  Widget build(BuildContext context) {
    prefs.ultimaPagina = 'clasificaciónPerfil';
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            child: Icon(Icons.arrow_back, size: 30,color: grisOscuroColor,),
            onTap: () {
              Navigator.pushReplacementNamed(context, 'perfil_inicio');
            }),
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: Text(
          'perfilUsuario.calificacion.titulo'.tr(),
          style: TextStyle(
            fontSize: 20,
            color: Colors.black45,
          ),
        ),
      ),
      body: _EstructuraPage()
    );
  }
}

class _EstructuraPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(top: size.height*0.06),
          child: Center(
            child: CircleAvatar(
              backgroundColor: grisOscuroColor,
              radius: 80,
            ),
          ),
        ),
        CustomRatingBar(),
        Container(
          padding: EdgeInsets.symmetric(horizontal: size.height*0.02),
          margin: EdgeInsets.symmetric(vertical: size.height*0.030),
          child: Divider(
            thickness: 1.2,
          )),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: size.height*0.035),
              margin: EdgeInsets.only(bottom: size.height*0.02),
              child: Text('perfilUsuario.calificacion.comentarios'.tr()),)),

        Comentarios()
      ],
    );
  }
}
