import 'package:flutter/material.dart';


import 'package:flutter_viaje_express_conductor/src/providers/inicio/slidingUpPanel_provider.dart';
import 'package:flutter_viaje_express_conductor/src/shared_prefs/preferencias_usuario.dart';
import 'package:flutter_viaje_express_conductor/src/widgets/global_widgets/sideBar_widgets/sideBar_widget.dart';
import 'package:flutter_viaje_express_conductor/src/widgets/inicio_widgets/btn_seguir_ubicacion.dart';
import 'package:flutter_viaje_express_conductor/src/widgets/inicio_widgets/btn_ubicacion.dart';
import 'package:flutter_viaje_express_conductor/src/widgets/inicio_widgets/customButtomDrawer.dart';
import 'package:flutter_viaje_express_conductor/src/widgets/inicio_widgets/customSlidingPanel.dart';

import 'package:provider/provider.dart';

class InicioPage extends StatefulWidget {
  @override
  _InicioPageState createState() => _InicioPageState();
}

class _InicioPageState extends State<InicioPage> {
  GlobalKey<ScaffoldState> _scafoldKey = GlobalKey<ScaffoldState>();
  static const double fabHeightClosed = 90.0;
  //double fabHeight = fabHeightClosed;

  final prefs = new PreferenciasUsuario();

  @override
  void initState() {
    //BlocProvider.of<MiUbicacionBloc>(context).iniciarSeguimiento();
    super.initState();
  }

  @override
  void dispose() {
    //BlocProvider.of<MiUbicacionBloc>(context).cancelarSeguimiento();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    prefs.ultimaPagina = 'inicio';
    //final panel = Provider.of<SlidingUpPanelProvider>(context);

    return _estructuraPage();
  }

  Widget _estructuraPage() {
    final panel = Provider.of<SlidingUpPanelProvider>(context);

    return Scaffold(
      key: _scafoldKey,
      drawer: SideBar(),
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: 10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomButtonDrawer(scafoldKey: _scafoldKey),
                ],
              ),
            ),
            Positioned(
                right: 20, bottom: panel.fabHeight, child: BtnUbicacion()),
            Positioned(
                right: 20,
                bottom: panel.fabHeight + 70,
                child: BtnSeguirUbicacion()),
            CustomSlidingPanel(fabHeightClosed: fabHeightClosed),
          ],
        ),
      ),
    );
  }

  /* Widget crearMapa(MiUbicacionState state) {
    final ubicacionDefecto = LatLng(-0.16050138340851247, -78.47380863777701);
    if (!state.existeUbicacion) return Center(child: Text('Ubicando...'));
    final mapaBloc = BlocProvider.of<MapaBloc>(context);

    mapaBloc.add(OnNuevaUbicacion(state.ubicacion ?? ubicacionDefecto));
    print('recarga mapa');

    final cameraPosition = new CameraPosition(
        target: mapaBloc.state.ubicacionRecogida ??
            state
                .ubicacion!, // se mostrara una ubicación por defecto si no se encuentra ninguna
        zoom: 15);

    return BlocBuilder<MapaBloc, MapaState>(
      builder: (BuildContext context, state) {
        return GoogleMap(
          initialCameraPosition: cameraPosition,
          myLocationEnabled: true,
          myLocationButtonEnabled: false,
          zoomControlsEnabled: false,
          onMapCreated: mapaBloc
              .initMapa, // el primer argumento de onMapCreated se asignara al mapaBloc.initMap
          polylines: state.polylines.values.toSet(),
          markers: state.markers.values.toSet(),
          onCameraMove: (cameraPosition) {
            // cameraPosition.target = LatLng central del mapa
            mapaBloc.add(OnMovioMapa(cameraPosition.target));
          },
        );
      },
    );
  } */
}
