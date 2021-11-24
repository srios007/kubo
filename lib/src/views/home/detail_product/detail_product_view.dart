import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:prueba_kubo/src/models/product.dart';
import 'package:prueba_kubo/src/tools/colors.dart';
import 'package:prueba_kubo/src/tools/styles.dart';
import 'detail_product_controller.dart';

class DetailproductView extends StatefulWidget {
  Data product = Data();
  DetailproductView({@required this.product});

  static const route = '/Detailproduct';
  @override
  _DetailproductViewState createState() => _DetailproductViewState();
}

class _DetailproductViewState extends StateMVC<DetailproductView> {
  _DetailproductViewState() : super(DetailproductController()) {
    controller = DetailproductController.con;
  }

  DetailproductController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.backgroundColor,
      appBar: AppBar(
        backgroundColor: Palette.white,
        elevation: 0,
        title: Center(
          child: Text(
            widget.product.nombre,
            style: Styles.normalLabelStyle,
          ),
        ),
        iconTheme: IconThemeData(
          color: Palette.black,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 30),
              Center(
                child: Container(
                  margin: EdgeInsets.only(
                    left: (MediaQuery.of(context).size.width * 0.5) - 200,
                  ),
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    // borderRadius: BorderRadius.circular(14),
                    color: Palette.lightGrey,
                    image: DecorationImage(
                      image: NetworkImage(
                        widget.product.imagen,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                margin: EdgeInsets.only(left: 15),
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: Palette.lightGrey,
                  image: DecorationImage(
                    image: NetworkImage(
                      widget.product.imagen,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 14),
                width: MediaQuery.of(context).size.width,
                
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Palette.white,
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Palette.black.withOpacity(0.2),
                      blurRadius: 6.0,
                      offset: Offset(0.2, 0.7),
                    ),
                  ],
                ),
                child: Column(children: [],),
              )
            ],
          ),
        ),
      ),
    );
  }
}
