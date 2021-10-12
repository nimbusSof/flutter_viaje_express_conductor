import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:flutter_viaje_express_conductor/src/services/auth_service.dart';
import 'package:flutter_viaje_express_conductor/src/shared_prefs/preferencias_usuario.dart';

import 'package:flutter_viaje_express_conductor/src/utils/colors.dart';
import 'package:provider/provider.dart';

class SideBar extends StatefulWidget {
  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  @override
  Widget build(BuildContext context) {
    
    final authService = Provider.of<AuthService>(context, listen: false);
    final prefs = new PreferenciasUsuario();

    return Drawer(
      child: ListView(padding: EdgeInsets.zero, children: <Widget>[
        GestureDetector(
          onTap: () {
            
            Navigator.pushReplacementNamed(context, 'perfil_inicio');
          },
          child: DrawerHeader(
            child: Container(
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: CircleAvatar(
                      backgroundColor: grisColor,
                      radius: 30,
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      margin: EdgeInsets.only(top: 15, bottom: 5),
                      child: Text(
                        '${prefs.nombreUsuario} ${prefs.apellidoUsuario}',
                        style: TextStyle(fontSize: 19),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      child: Text(
                        '${prefs.correoUsuario}',
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w300),
                      ),
                    ),
                  )
                ],
              ),
            ),
            decoration: BoxDecoration(color: Colors.white),
          ),
        ),
        ListTile(
          leading: Icon(Icons.home),
          title: Text('sideBar.inicio'.tr()),
          onTap: () {
            
            Navigator.pushReplacementNamed(context, 'inicio');
          },
        ),


        ListTile(
          leading: Icon(Icons.attach_money_rounded),
          title: Text('sideBar.ganancias'.tr()),
          onTap: () {
            
            Navigator.pushReplacementNamed(context, 'ganancias');
          },
        ),

        
        ListTile(
          leading: Icon(Icons.history),
          title: Text('sideBar.historial'.tr()),
          onTap: () {
            
            Navigator.pushReplacementNamed(context, 'historialViajes_inicio');
          },
        ),
        ListTile(
          leading: Icon(Icons.settings),
          title: Text('sideBar.configuraciones'.tr()),
          onTap: () {
            
            Navigator.pushReplacementNamed(context, 'configuraciones_inicio');
          },
        ),
        ListTile(
          leading: Icon(Icons.logout),
          title: Text('sideBar.salir'.tr()),
          onTap: () async{

            //al salir se restablecerá la aplicación con el idioma que tenga configurado
            //el dispositivo, ya que el idioma es una preferencia de usuario
            String idiomaDispositivo =
                          context.deviceLocale.toString().substring(0, 2);
                      print(idiomaDispositivo);
                      if(idiomaDispositivo=='es' || idiomaDispositivo=='en'){
                        await context.setLocale(Locale(idiomaDispositivo));
                      }else{
                        //se coloca idioma ingles por defecto
                        context.setLocale(context.locale);
                      }

            
            authService.logout();
            


            Navigator.pushNamedAndRemoveUntil(
                context, 'login', (route) => false);
          },
        )
      ]),
    );
  }
}
