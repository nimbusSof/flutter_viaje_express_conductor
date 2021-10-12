import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_viaje_express_conductor/src/providers/formsConductor_provider.dart';

import 'package:provider/provider.dart';

import 'package:sliding_up_panel/sliding_up_panel.dart';

class EstructuraPage extends StatelessWidget {
  final ScrollController controller;
  final PanelController panelController;
  const EstructuraPage(
      {Key? key, required this.controller, required this.panelController})
      : super(key: key);

  @override
  Widget build(BuildContext context) => ListView(
        padding: EdgeInsets.zero,
        controller: controller,
        children: <Widget>[
          SizedBox(height: 36),
          Estructura(controller: controller, panelController: panelController),
          SizedBox(
            height: 24,
          )
        ],
      );
}

class Estructura extends StatelessWidget {
  final ScrollController controller;
  final PanelController panelController;

  Estructura(
      {Key? key, required this.controller, required this.panelController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final formCliente = Provider.of<FormsConductor>(context);
    

    return Container(
      child: Form(
        //: key: formCliente.formkeyViajeNuevo,
        child: Column(
          children: <Widget>[
            //CabeceraMapa(),
            buildDragHandle(),

            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  /* CustomInput(
                    icon: Icons.location_on,
                    placeHolder: 'Mi ubicación',
                    textController: datosViajeNuevo.ubicacionCtrl,
                    inputFormatter: [],
                    validator: (value) {
                      if (value != null && value.length > 0) {
                        return null;
                      } else {
                        return 'Porfavor ingresa tu ubicación de viaje';
                      }
                    },
                  ), */

                  
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  buildDragHandle() => GestureDetector(
        child: Center(
          child: Container(
            width: 30,
            height: 5,
            decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(12)),
          ),
        ),
        onTap: togglePanel,
      );

  void togglePanel() => panelController.isPanelOpen
      ? panelController.close()
      : panelController.open();

  
}
