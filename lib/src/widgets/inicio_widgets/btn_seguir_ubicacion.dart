import 'package:flutter/material.dart';


class BtnSeguirUbicacion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return this._crearBoton(context);
  }

  Widget _crearBoton(BuildContext context) {
    //final mapaBloc = BlocProvider.of<MapaBloc>(context);
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: CircleAvatar(
        backgroundColor: Colors.white,
        maxRadius: 25,
        child: IconButton(
          icon: Icon(
            /* state.seguirUbicacion
             ? Icons.directions_run
             :  */
            Icons.accessibility_new,
            color: Colors.black87,
          ),
          onPressed: () {
            //mapaBloc.add(OnSeguirUbicacion());
          },
        ),
      ),
    );
  }
}
