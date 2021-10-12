import 'package:flutter/material.dart';


class BtnUbicacion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /* final mapaBloc = BlocProvider.of<MapaBloc>(context);
    final miUbicacionBloc = BlocProvider.of<MiUbicacionBloc>(context);
    final ubicacionDefecto = LatLng(-0.16050138340851247, -78.47380863777701); */
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: CircleAvatar(
        backgroundColor: Colors.white,
        maxRadius: 25,
        child: IconButton(
          icon: Icon(
            Icons.my_location,
            color: Colors.black87,
          ),
          onPressed: () {
            /* final ubicacionActual = miUbicacionBloc.state.ubicacion;
            mapaBloc.moverCamara(ubicacionActual ?? ubicacionDefecto); */
          },
        ),
      ),
    );
  }
}
