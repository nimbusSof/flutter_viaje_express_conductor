import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:flutter_viaje_express_conductor/src/models/updateConductor.dart';
import 'package:flutter_viaje_express_conductor/src/shared_prefs/preferencias_usuario.dart';
import 'package:http/http.dart' as http;
import '../viajeExpressApi_service.dart';

class UpdateConductorService extends ChangeNotifier {
  late UpdateConductor _updateConductor;
  ViajeExpressApi _viajeExpressApi = new ViajeExpressApi();
  late PreferenciasUsuario prefs;

/*Se inicializa el constructor de la clase trayendo los datos de preferencia de usuario y*/
/*añadiendolos al objeto UpdateConductor */

  UpdateConductorService() {
    prefs = new PreferenciasUsuario();
    _updateConductor = new UpdateConductor(
        nombre: prefs.nombreUsuario,
        apellido: prefs.apellidoUsuario,
        fechaNacimiento: DateTime.parse(prefs.fechaNacimiento),
        genero: prefs.genero,
        telefono: prefs.telefono,
        correo: prefs.correoUsuario,
        clave: prefs.clave,
        pathFoto: prefs.pathFoto,
        modifiedBy: 0);
  }

/*GETTERS Y SETTERS DE UPDATE CLIENTE*/

  UpdateConductor get updateCliente => this._updateConductor;

  set updateCliente(UpdateConductor cliente) {
    this._updateConductor = cliente;
  }

  set updateNombre(String nombre) {
    this._updateConductor.nombre = nombre;
    notifyListeners();
  }

  set updateApellido(String apellido) {
    this._updateConductor.apellido = apellido;
    notifyListeners();
  }

  set updateFechaNacimiento(String fechaNacimiento) {
    this._updateConductor.fechaNacimiento = DateTime.parse(fechaNacimiento);
    notifyListeners();
  }

  set updatecorreo(String correo) {
    this._updateConductor.correo = correo;
    notifyListeners();
  }

  set updateClave(String clave) {
    this._updateConductor.clave = clave;
    notifyListeners();
  }

  set updateModifiedBy(String id) {
    this._updateConductor.modifiedBy = int.parse(id);
    notifyListeners();
  }

  set updateTelefono(String telefono) {
    this._updateConductor.telefono = telefono;
    notifyListeners();
  }

// FUNCION: Se procesa la actualización del cliente con una petición tipo PUT
  Future<bool?> _procesarActualizacion(Uri url, token) async {
    final resp = await http
        .put(url, body: updateConductorToJson(this._updateConductor), headers: {
      'token': token,
      'Content-Type': 'application/json',
    });

    final Map<String, dynamic> decodedResp = json.decode(resp.body);
    //print('viendo ${resp.body}');

    if (decodedResp['exito'] == true) {
      prefs.nombreUsuario = this._updateConductor.nombre!;
      prefs.apellidoUsuario = this._updateConductor.apellido!;
      prefs.fechaNacimiento =
          this._updateConductor.fechaNacimiento!.toIso8601String();
      prefs.correoUsuario = this._updateConductor.correo!;
      prefs.clave = this._updateConductor.clave!;
      prefs.telefono = this._updateConductor.telefono!;
    }
    return decodedResp['exito'];
  }

  //FUNCION: Se arma la url y se procesa la actualización de datos del cliente
  Future<bool?> updateClienteService(String idpersonarol, String token) async {
    print('token: ' + token);
    print('id_persona: ' + idpersonarol);

    final url =
        Uri.http(_viajeExpressApi.baseUrl, 'PerfilUsuario/$idpersonarol');

    return await _procesarActualizacion(url, token);
  }
}
