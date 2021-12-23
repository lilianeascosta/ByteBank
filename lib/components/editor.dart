import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Editor extends StatelessWidget {

  final TextEditingController controller;
  final String label;
  final String tip;
  final IconData? icone;


  // ignore: use_key_in_widget_constructors
  const Editor({required this.controller, required this.label, required this.tip, this.icone});

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: controller,
        style: TextStyle(
          fontSize: 24.0,
        ),
        decoration: InputDecoration(
          icon: icone != null ? Icon(icone) : null,
          labelText: label,
          hintText: tip, // tip to the user
        ),
        keyboardType: TextInputType.number,
      ),
    ) ;
  }
}