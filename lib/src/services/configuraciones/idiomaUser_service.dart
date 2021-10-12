import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_viaje_express_conductor/src/models/idiomaConductor.dart';

import 'package:http/http.dart' as http;

import '../viajeExpressApi_service.dart';

class IdiomaUser extends ChangeNotifier {
  ViajeExpressApi _viajeExpressApi = new ViajeExpressApi();
  IdiomaConductor _idiomaConductor = new IdiomaConductor();

  IdiomaConductor get idiomaConductor => this._idiomaConductor;
  set idiomaConductor(IdiomaConductor idiomaConductor) {
    this._idiomaConductor = idiomaConductor;
    notifyListeners();
  }

  //Procesar respuesta para obtener datos del cliente
  Future<String> _procesarRespuesta(Uri url, token) async {
    String idioma = '';
    final resp = await http.get(url, headers: {
      'token': token,
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    });

    
    if ( jsonDecode(resp.body)["exito"] ==false) {
      return '';
    } else {
      idiomaConductor = idiomaConductorFromJson(resp.body);

      if (idiomaConductor.exito == true) {
        idioma = idiomaConductor.data!.idioma!;
      }
    }

    return idioma ;
  }

  //Se arma la url para procesar servicio obtener idioma cliente
  Future<String> idiomaClienteService(String idpersonarol, String token) async {
    final url = Uri.http(_viajeExpressApi.baseUrl, 'Preferencias/obtener',
        {'id_persona_rol': idpersonarol});

    return await _procesarRespuesta(url, token);
  }

//Procesar respuesta para obtener datos del cliente
  Future<void> _procesarRespuestaPut(
      Uri url, String token, String idpersonarol, String idioma) async {
    final Map<String, dynamic> idiomaData = {
      'id_persona_rol': idpersonarol,
      'idioma': idioma
    };

    await http.put(url, body: json.encode(idiomaData), headers: {
      'token': token,
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    });
  }

  //Se arma la url para procesar servicio actualizar idioma cliente
  Future<void> idiomaClienteServicePut(
      String idpersonarol, String token, String idioma) async {
    final url = Uri.http(_viajeExpressApi.baseUrl, 'Preferencias/actualizar');
    await _procesarRespuestaPut(url, token, idpersonarol, idioma);
  }

  //Procesar respuesta para obtener datos del cliente
  Future<void> _procesarRespuestaPost(
      Uri url, String token, String idpersonarol, String idioma) async {
    final Map<String, dynamic> idiomaData = {
      'id_persona_rol': idpersonarol,
      'idioma': idioma
    };

    await http.put(url, body: json.encode(idiomaData), headers: {
      'token': token,
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    });
  }

  //Se arma la url para procesar servicio insertar idioma cliente
  Future<void> idiomaClienteServicePost(
      String idpersonarol, String token, String idioma) async {
    final url = Uri.http(_viajeExpressApi.baseUrl, 'Preferencias/insertar');
    await _procesarRespuestaPost(url, token, idpersonarol, idioma);
  }
}
