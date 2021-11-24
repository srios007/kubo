import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:prueba_kubo/src/tools/colors.dart';
import 'package:prueba_kubo/src/tools/styles.dart';
import 'later_controller.dart';

class LaterView extends StatefulWidget {
  static const route = '/Later';
  @override
  _LaterViewState createState() => _LaterViewState();
}

class _LaterViewState extends StateMVC<LaterView> {
  _LaterViewState() : super(LaterController()) {
    controller = LaterController.con;
  }

  LaterController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height - kToolbarHeight,
          alignment: Alignment.center,
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 24, 0, 0),
                child: Text(
                  'Esta funcionalidad estará disponible próximamamente',
                  style: Styles.laterTitleStyle,
                  textAlign: TextAlign.center,
                ),
              ),
             
              Container(
                height: MediaQuery.of(context).size.height * 0.5,
                child: Image.asset('assets/images/logo.png'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
