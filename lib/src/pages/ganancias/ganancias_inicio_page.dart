import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_viaje_express_conductor/src/shared_prefs/preferencias_usuario.dart';
import 'package:flutter_viaje_express_conductor/src/widgets/global_widgets/cabecera_widgets/cabecera_widget.dart';
import 'package:flutter_viaje_express_conductor/src/widgets/global_widgets/customComponents_widgets/custom_button.dart';
import 'package:flutter_viaje_express_conductor/src/widgets/global_widgets/sideBar_widgets/sideBar_widget.dart';

class GananciasInicioPage extends StatefulWidget {
  @override
  _GananciasInicioPageState createState() =>
      _GananciasInicioPageState();
}

class _GananciasInicioPageState extends State<GananciasInicioPage> {
  GlobalKey<ScaffoldState> _scafoldKey = GlobalKey<ScaffoldState>();
  final prefs = new PreferenciasUsuario();
  @override
  Widget build(BuildContext context) {
    prefs.ultimaPagina = 'historialViajes_inicio';
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
        Cabecera(titulo: 'ganancias.titulo'.tr(), subtitulo: 'Viaje Express'),
        BtnSimpleIcon(
          texto: 'ganancias.btnGanancias'.tr(),
          icono: Icons.leaderboard,
          color: Colors.blue,
          
        ),
        BtnSimpleIcon(
          texto: 'ganancias.btnAgregar'.tr(),
          icono: Icons.credit_card,
          color: Colors.blue,
        
        ),
      ],
    );
  }
}
