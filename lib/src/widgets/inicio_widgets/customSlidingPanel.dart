import 'package:flutter/material.dart';

import 'package:flutter_viaje_express_conductor/src/pages/inicio/estructuraPage.dart';
import 'package:flutter_viaje_express_conductor/src/providers/inicio/slidingUpPanel_provider.dart';

import 'package:provider/provider.dart';
//import 'package:flutter_viaje_express_cliente/src/widgets/mapa_widgets/btn_seguir_ubicacion.dart';
//import 'package:flutter_viaje_express_cliente/src/widgets/mapa_widgets/btn_ubicacion.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class CustomSlidingPanel extends StatefulWidget {
  final double fabHeightClosed;

  CustomSlidingPanel({required this.fabHeightClosed});

  @override
  _CustomSlidingPanelState createState() => _CustomSlidingPanelState();
}

class _CustomSlidingPanelState extends State<CustomSlidingPanel> {
 

  @override
  Widget build(BuildContext context) {
    return _buildSlidingUpPanel();
  }

  Widget _buildSlidingUpPanel() {
    final panel = Provider.of<SlidingUpPanelProvider>(context);
    //double fabHeight = this.widget.fabHeightClosed;
    final panelHeightOpen = MediaQuery.of(context).size.height * 0.6;
    final panelHeightClosed = MediaQuery.of(context).size.height * 0.070;
    final panelController = new PanelController();
    return Stack(children: [
      SlidingUpPanel(
        controller: panelController,
        maxHeight: panelHeightOpen,
        minHeight: panelHeightClosed,
        parallaxEnabled: true,
        parallaxOffset: .5,
        //body:
        panelBuilder: (controller) => EstructuraPage(
            controller: controller, panelController: panelController),
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        onPanelSlide: (position) => setState(() {
          final panelMaxScrollExtent = panelHeightOpen - panelHeightClosed;
          panel.fabHeight =
              position * panelMaxScrollExtent + this.widget.fabHeightClosed;
          //print('alto del panel ${panel.fabHeight}');
        }),
      ),
    ]);
  }
}
