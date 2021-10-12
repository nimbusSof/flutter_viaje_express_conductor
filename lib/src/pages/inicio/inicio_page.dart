import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_viaje_express_conductor/src/shared_prefs/preferencias_usuario.dart';
import 'package:flutter_viaje_express_conductor/src/widgets/global_widgets/cabecera_widgets/cabecera_widget.dart';
import 'package:flutter_viaje_express_conductor/src/widgets/global_widgets/sideBar_widgets/sideBar_widget.dart';
import 'package:flutter_viaje_express_conductor/src/widgets/inicio_widgets/contenedorMapa_widget.dart';
import 'package:flutter_viaje_express_conductor/src/widgets/inicio_widgets/custom_buttom_inicio.dart';



class InicioPage extends StatefulWidget {
  @override
  _InicioPageState createState() => _InicioPageState();
}

class _InicioPageState extends State<InicioPage> {
  GlobalKey<ScaffoldState> _scafoldKey = GlobalKey<ScaffoldState>();
  final prefs = new PreferenciasUsuario();

  @override
  Widget build(BuildContext context) {
    //inicializarIdioma();
    prefs.ultimaPagina = 'inicio';
    return Scaffold(
        key: _scafoldKey,
        drawer: SideBar(),
        body: SafeArea(
            child: SingleChildScrollView(
                child: Stack(
          children: [
            _EstructuraPage(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buttonDrawer(),
              ],
            ),
          ],
        ))));
  }

  
  Widget _buttonDrawer() {
    return Container(
      alignment: Alignment.centerLeft,
      child: IconButton(
        onPressed: () => _scafoldKey.currentState!.openDrawer(),
        icon: Icon(
          Icons.menu,
          size: 35,
          color: Colors.black,
        ),
      ),
    );
  }
}

class _EstructuraPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Cabecera(titulo: 'inicio.titulo'.tr(), subtitulo: 'Viaje Express'),
        BtnViajar(texto: 'inicio.button.pregunta'.tr()),
        BtnRutasGuardadas(texto: 'inicio.button.seleccionar'.tr()),
        SizedBox(height: 25),
        ContenedorMapa()
      ],
    );
  }
}
