import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:prueba_kubo/src/models/product.dart';
import 'package:prueba_kubo/src/tools/colors.dart';
import 'package:prueba_kubo/src/tools/styles.dart';
import 'package:prueba_kubo/src/widgets/grid.dart';
import 'package:prueba_kubo/src/widgets/kubo_textfield.dart';
import 'home_controller.dart';

class HomeView extends StatefulWidget {
  static const route = '/Home';
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends StateMVC<HomeView> {
  _HomeViewState() : super(HomeController()) {
    controller = HomeController.con;
  }

  HomeController controller;
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    controller.product = controller.fetchProduct();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.center,
                height: 100,
                child: Image.asset('assets/images/plaza.png'),
              ),
              const SizedBox(height: 35),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: KuboTextField(
                  onTap: () async {
                    controller.principal = await controller.fetchProduct();
                  },
                  controller: searchController,
                  icon: Icons.search,
                  placeholder: "Buscar",
                  onChanged: (text) async {
                    if (text != "") {
                      setState(
                        () {
                          controller.isSearching = true;
                          controller.aux.data = controller.principal.data
                              .where(
                                (product) => product.nombre
                                    .toLowerCase()
                                    .replaceAll(' ', '')
                                    .replaceAll('á', 'a')
                                    .replaceAll('é', 'e')
                                    .replaceAll('í', 'i')
                                    .replaceAll('ó', 'o')
                                    .replaceAll('ú', 'u')
                                    .contains(
                                      text
                                          .toLowerCase()
                                          .replaceAll(' ', '')
                                          .replaceAll('á', 'a')
                                          .replaceAll('é', 'e')
                                          .replaceAll('í', 'i')
                                          .replaceAll('ó', 'o')
                                          .replaceAll('ú', 'u'),
                                    ),
                              )
                              .toList();
                        },
                      );
                    } else {
                      setState(() {
                        controller.isSearching = false;
                        controller.aux.data.clear();
                      });
                    }
                  },
                ),
              ),
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  controller.aux.data.isEmpty && controller.isSearching
                      ? ""
                      : "Todos los productos",
                  style: Styles.homeTitleStyle,
                ),
              ),
              const SizedBox(height: 24),
              controller.aux.data.isEmpty && controller.isSearching
                  ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            height: MediaQuery.of(context).size.height * 0.4,
                            child: Image.asset(
                              'assets/images/no_result.png',
                            ),
                          ),
                          Text(
                            "Esto muy vacio",
                            style: Styles.roResultTitleStyle,
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            "Por el momento no tenemos información para mostrar",
                            style: Styles.noResultLabelStyle,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                  )
                  : Center(
                      child: FutureBuilder<Product>(
                        future: controller.product,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return Container(
                              height: MediaQuery.of(context).size.height * 0.55,
                              width: double.infinity,
                              child: Grid(
                                product: controller.principal.data.isNotEmpty &&
                                        controller.isSearching
                                    ? controller.aux
                                    : snapshot.data,
                              ),
                            );
                          } else if (snapshot.hasError) {
                            return Text(
                                'Por favor, intente de nuevo más tarde');
                          }
                          return Padding(
                            padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.3,
                            ),
                            child: const CircularProgressIndicator(),
                          );
                        },
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
