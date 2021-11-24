import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:prueba_kubo/src/widgets/kubo_button.dart';
import 'welcome_controller.dart';
import 'package:prueba_kubo/src/tools/styles.dart';

class WelcomeView extends StatefulWidget {
  static const route = '/Welcome';
  @override
  _WelcomeViewState createState() => _WelcomeViewState();
}

class _WelcomeViewState extends StateMVC<WelcomeView> {
  _WelcomeViewState() : super(WelcomeController()) {
    controller = WelcomeController.con;
  }

  WelcomeController controller;

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
                  'Bienvenido al e-commerce de prueba para Kubo.',
                  style: Styles.welcomeTitleStyle,
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                child: Text(
                  'Desarrollado por: Santiago Rios Valero',
                  style: Styles.welcomeSubtitleStyle,
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                child: Image.asset('assets/images/logo.png'),
              ),
             
              KuboButton(
                title: 'Empezar',
                onPressed: () => controller.toHome(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
