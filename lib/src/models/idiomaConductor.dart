// To parse this JSON data, do
//
//     final idiomaCliente = idiomaClienteFromJson(jsonString);

import 'dart:convert';

IdiomaConductor idiomaConductorFromJson(String str) => IdiomaConductor.fromJson(json.decode(str));

String idiomaConductorToJson(IdiomaConductor data) => json.encode(data.toJson());

class IdiomaConductor {
    IdiomaConductor({
        this.exito,
        this.codigo,
        this.mensaje,
        this.data,
    });

    bool? exito;
    int? codigo;
    String? mensaje;
    Data? data;

    factory IdiomaConductor.fromJson(Map<String, dynamic> json) => IdiomaConductor(
        exito: json["exito"],
        codigo: json["codigo"],
        mensaje: json["mensaje"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "exito": exito,
        "codigo": codigo,
        "mensaje": mensaje,
        "data": data!.toJson(),
    };
}

class Data {
    Data({
        this.idPersonaRol,
        this.idioma,
    });

    int? idPersonaRol;
    String? idioma;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        idPersonaRol: json["id_persona_rol"],
        idioma: json["idioma"],
    );

    Map<String, dynamic> toJson() => {
        "id_persona_rol": idPersonaRol,
        "idioma": idioma,
    };
}
