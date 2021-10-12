import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_viaje_express_conductor/src/localization/supported_locales.dart';
import 'package:flutter_viaje_express_conductor/src/providers/datosConfPerfil_provider.dart';
import 'package:flutter_viaje_express_conductor/src/providers/datosConfiguraciones_provider.dart';
import 'package:flutter_viaje_express_conductor/src/providers/formsConductor_provider.dart';
import 'package:flutter_viaje_express_conductor/src/providers/forms_principal_provider.dart';
import 'package:flutter_viaje_express_conductor/src/routes/routes.dart';
import 'package:flutter_viaje_express_conductor/src/services/auth_service.dart';
import 'package:flutter_viaje_express_conductor/src/services/notificacion_service.dart';
import 'package:flutter_viaje_express_conductor/src/services/perfil_services/updateCliente_service.dart';
import 'package:flutter_viaje_express_conductor/src/shared_prefs/preferencias_usuario.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = new PreferenciasUsuario();
  await prefs.initPrefs();
  //instancias de easy localization
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(EasyLocalization(
      path: 'assets/translations',
      supportedLocales: supportedLocales,
      fallbackLocale: english,
      child: AppState()));
}


class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => new AuthService()),     
        ChangeNotifierProvider(create: (_) => new PreferenciasUsuario()),
        ChangeNotifierProvider(create: (_) => new FormsConductor()),
        ChangeNotifierProvider(create: (_) => new SignInFormProvider()),
        ChangeNotifierProvider(create: (_) => new UpdateConductorService()),
        ChangeNotifierProvider(create: (_) => new DatosConfPerfil()),
        ChangeNotifierProvider(create: (_) => new DatosConfiguraciones()),
      ],
      child: MyApp(),
    );
  }
}



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      supportedLocales: context.supportedLocales,
        localizationsDelegates: context.localizationDelegates,
        locale: context.locale,
        debugShowCheckedModeBanner: false,
        title: 'Viaje Express',
        initialRoute:
            'checking', //ruta inicial debe ser el checking - loadingMapa
        routes: appRoutes,
        scaffoldMessengerKey: NotificationsService.messengerKey,
    );
  }
}