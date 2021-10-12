import 'package:flutter/material.dart';
import 'package:flutter_viaje_express_conductor/src/pages/configuraciones/acercaApp_page.dart';
import 'package:flutter_viaje_express_conductor/src/pages/configuraciones/cambiarFormatos_page.dart';
import 'package:flutter_viaje_express_conductor/src/pages/configuraciones/cambiarIdioma_page.dart';
import 'package:flutter_viaje_express_conductor/src/pages/configuraciones/cambiarNumero_page.dart';
import 'package:flutter_viaje_express_conductor/src/pages/configuraciones/configuraciones_inicio_page.dart';
import 'package:flutter_viaje_express_conductor/src/pages/ganancias/ganancias_inicio_page.dart';
import 'package:flutter_viaje_express_conductor/src/pages/historialViajes/historialViajes_inicio_page.dart';
import 'package:flutter_viaje_express_conductor/src/pages/historialViajes/viajesCancelados_page.dart';
import 'package:flutter_viaje_express_conductor/src/pages/historialViajes/viajesConcluidos_page.dart';
import 'package:flutter_viaje_express_conductor/src/pages/inicio/inicio_page.dart';
import 'package:flutter_viaje_express_conductor/src/pages/perfil/clasificacionPerfil_page.dart';
import 'package:flutter_viaje_express_conductor/src/pages/perfil/configuracionPerfil_page.dart';
import 'package:flutter_viaje_express_conductor/src/pages/perfil/perfil_inicio_page.dart';
import 'package:flutter_viaje_express_conductor/src/pages/signin/check_auth_screen.dart';
import 'package:flutter_viaje_express_conductor/src/pages/signin/signIn_page.dart';

import 'package:flutter_viaje_express_conductor/src/pages/signin/splash_screen_page.dart';


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

   //MODULO HISTORIAL DE VIAJES
  'historialViajes_inicio'       :  (_) => HistorialViajesInicioPage(),
  'viajesConcluidos'             :  (_) => ViajesConcluidosPage(),
  'viajesCancelados'             :  (_) => ViajesCanceladosPage(),

  //MODULO GANANCIAS
  'ganancias_inicio'             :  (_) => GananciasInicioPage(),

};
