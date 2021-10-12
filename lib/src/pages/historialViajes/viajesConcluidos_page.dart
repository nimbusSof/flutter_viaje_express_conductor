import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_viaje_express_conductor/src/shared_prefs/preferencias_usuario.dart';

import 'package:flutter_viaje_express_conductor/src/utils/colors.dart';

class ViajesConcluidosPage extends StatelessWidget {
  final prefs = new PreferenciasUsuario();
  @override
  Widget build(BuildContext context) {
    prefs.ultimaPagina = 'viajesConcluidos';
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            child: Icon(Icons.arrow_back, size: 30,color: grisOscuroColor,),
            onTap: () {
              Navigator.pushReplacementNamed(context, 'historialViajes_inicio');
            }),
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: Text(
          'historialViajes.inicio.vconcluidos'.tr(),
          style: TextStyle(
            fontSize: 20,
            color: Colors.black45,
          ),
        ),
      ),
      body: _EstructuraPage(),
    ));
  }
}

class _EstructuraPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 15,
          ),
          _historial()
        ],
      ),
    );
  }

  _historial() {
    return Expanded(
      child: ListView(
        children: _viajeConcluido(),
      ),
    );
  }

  _viajeConcluido() {
    List<Widget> lista = [];
    Widget viaje = ListTile(
      leading: Icon(
        Icons.check_circle,
        color: Colors.green,
      ),
      title: Container(
        child: RichText(
            text: TextSpan(
                text: 'Mi casa\n',
                style: TextStyle(color: Colors.black, fontSize: 18),
                children: [
              TextSpan(
                  text: 'Calle Uruguar 1-40',
                  style: TextStyle(color: Colors.black54, fontSize: 18))
            ])),
      ),
    );

    return lista
      ..add(viaje)
      ..add(Divider(
        thickness: 1.2,
      ))
      ..add(viaje)
      ..add(Divider(
        thickness: 1.2,
      ))
      ..add(viaje)
      ..add(Divider(
        thickness: 1.2,
      ));
  }
}
