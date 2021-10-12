import 'package:flutter/material.dart';
import 'package:flutter_viaje_express_conductor/src/pages/configuraciones/acercaApp_page.dart';
import 'package:flutter_viaje_express_conductor/src/pages/configuraciones/cambiarFormatos_page.dart';
import 'package:flutter_viaje_express_conductor/src/pages/configuraciones/cambiarIdioma_page.dart';
import 'package:flutter_viaje_express_conductor/src/pages/configuraciones/cambiarNumero_page.dart';
import 'package:flutter_viaje_express_conductor/src/pages/configuraciones/configuraciones_inicio_page.dart';
import 'package:flutter_viaje_express_conductor/src/pages/inicio/inicio_page.dart';
import 'package:flutter_viaje_express_conductor/src/pages/perfil/clasificacionPerfil_page.dart';
import 'package:flutter_viaje_express_conductor/src/pages/perfil/configuracionPerfil_page.dart';
import 'package:flutter_viaje_express_conductor/src/pages/perfil/perfil_inicio_page.dart';
import 'package:flutter_viaje_express_conductor/src/pages/principal/check_auth_screen.dart';
import 'package:flutter_viaje_express_conductor/src/pages/principal/signIn_page.dart';

import 'package:flutter_viaje_express_conductor/src/pages/principal/splash_screen_page.dart';


final Map<String, Widget Function(BuildContext)> appRoutes = {
  //PRINCIPAL
  '/'                             :  (_) => SplashScreen(),
  'signin'                        :  (_) => SignInPage(),
  'checking'                      :  (_) => CheckAuthScreen(),
  'inicio'                        :  (_) => InicioPage(),

  //MODULO PERFIL
  'perfil_inicio'                :  (_) => PerfilInicioPage(),
  'configuracionPerfil'          :  (_) => ConfiguracionPerfilPage(),
  'clasificaciónPerfil'          :  (_) => ClasificacionPerfilPage(),

  //MODULO CONFIGURACIONES
  'configuraciones_inicio'       :  (_) => ConfiguracionesInicioPage(),
  'cambiarNumero'                :  (_) => CambiarNumeroPage(),
  'cambiarIdioma'                :  (_) => CambiarIdiomaPage(),
  'cambiarFormatos'              :  (_) => CambiarFormatosPage(),
  'acercaApp'                    :  (_) => AcercaAppPage(),

};
