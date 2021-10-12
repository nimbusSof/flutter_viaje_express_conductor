import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:flutter_viaje_express_conductor/src/models/personaConductor.dart';
import 'package:flutter_viaje_express_conductor/src/services/viajeExpressApi_service.dart';
import 'package:flutter_viaje_express_conductor/src/shared_prefs/preferencias_usuario.dart';
import 'package:http/http.dart' as http;

class AuthService extends ChangeNotifier {
  //final String _baseUrl = 'identitytoolkit.googleapis.com';
  //final String _firebaseToken = 'AIzaSyD6c9oUsV7CChy_8JrIKj9L9JrAhPXecp4';

  ViajeExpressApi _viajeExpressApi = new ViajeExpressApi();
  PersonaConductor _personaConductor = new PersonaConductor();
  final storage = new FlutterSecureStorage();
  final prefs = new PreferenciasUsuario();

  String nombres = '';

  //GETTER Y SETTERS DE PERSONA
  set personaConductor(PersonaConductor personaConductor) {
    this._personaConductor = personaConductor;
    notifyListeners();
  }

  PersonaConductor get personaConductor => this._personaConductor;

  //Procesar respuesta para obtener datos del cliente
  Future<PersonaConductor> _procesarRespuesta(Uri url, token) async {
    final resp = await http.get(url, headers: {'token': token});
    //final decodedData = json.decode(resp.body);
    this._personaConductor = personaConductorFromJson(resp.body);
    //se guarda los nombres y apellidos en el storage
    prefs.nombreUsuario     = personaConductor.data?.nombre??'null';
    prefs.apellidoUsuario   = personaConductor.data?.apellido??'null';
    prefs.correoUsuario     = personaConductor.data?.correo??'null';
    prefs.fechaNacimiento   = personaConductor.data?.fechaNacimiento??'null';
    prefs.clave             = personaConductor.data?.clave??'null';
    prefs.genero            = personaConductor.data?.genero??'null';
    prefs.telefono          = personaConductor.data?.telefono??'null';
    prefs.pathFoto          = personaConductor.data?.pathFoto??'null';
   


    return personaConductor;
  }

  //Se obtiene los datos del cliente
  Future<PersonaConductor> datosConductor(String idpersonarol, String token) async {
    final url =
        Uri.http(_viajeExpressApi.baseUrl, 'PerfilUsuario/$idpersonarol');

    return await _procesarRespuesta(url, token);
  }

  // LOGIN DEL USUARIO CLIENTE

  Future<bool?> login(String email, String password) async {
    // parametros para enviar al api
    final Map<String, dynamic> authData = {
      'correo': email,
      'clave': password,
    };

    // emsamble del endpoint
    final url = Uri.http(
      _viajeExpressApi.baseUrl,
      '/Login', /*  {'key': _firebaseToken} */
    );

    //se realizar la petición post al  api
    final resp = await http.post(url, body: json.encode(authData), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    });

    //se decodifica la respuesta del api
    final Map<String, dynamic> decodedResp = json.decode(resp.body);
    print('token user: ${decodedResp['token']}');
    if (decodedResp['token']!=null) {
      // El token se guarda en un lugar seguro
      await storage.write(key: 'token', value: decodedResp['token']);
      await storage.write(
          key: 'id_persona_rol',
          value: decodedResp['id_persona_rol'].toString());

      await storage.write(key: 'id_vehiculo', value: decodedResp['id_vehiculo'].toString());
      await storage.write(key: 'id_cooperativa', value: decodedResp['id_cooperativa'].toString());

      //se traen los datos del conductor
      await datosConductor(
          decodedResp['id_persona_rol'].toString(), decodedResp['token']);
      
    }
    return decodedResp['exito'];
  }

  Future logout() async {
    await storage.delete(key: 'token');
    await storage.delete(key: 'id_persona_rol');
    await storage.delete(key: 'id_vehiculo');
    await storage.delete(key: 'id_cooperativa');
    return;
  }

// LECTURA DE STORAGE
  Future<String> readToken() async {
    return await storage.read(key: 'token') ?? '';
  }

  Future<String> readIdPersonaRol() async {
    return await storage.read(key: 'id_persona_rol') ?? '';
  }

  Future<String> readIdVehiculo() async {
    return await storage.read(key: 'id_vehiculo') ?? '';
  }

  Future<String> readIdCooperativa() async {
    return await storage.read(key: 'id_cooperativa') ?? '';
  }
}
