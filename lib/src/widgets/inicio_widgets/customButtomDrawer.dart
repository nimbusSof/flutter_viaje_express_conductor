import 'package:flutter/material.dart';


class CustomButtonDrawer extends StatefulWidget {
  final GlobalKey<ScaffoldState> scafoldKey;

  const CustomButtonDrawer({required this.scafoldKey});


  @override
  _CustomButtonDrawerState createState() => _CustomButtonDrawerState();
}

class _CustomButtonDrawerState extends State<CustomButtonDrawer> {
  @override
  Widget build(BuildContext context) {
    return _buildButtonDrawer();
  }


  Widget _buildButtonDrawer(){
     return Container(
      alignment: Alignment.centerLeft,
      child: IconButton(
        onPressed: () => this.widget.scafoldKey.currentState!.openDrawer(),
        icon: Icon(
          Icons.menu,
          size: 35,
          color: Colors.black,
        ),
      ),
    );
  }
}
