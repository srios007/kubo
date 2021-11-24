import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:prueba_kubo/src/models/product.dart';
import 'package:prueba_kubo/src/tools/colors.dart';
import 'package:prueba_kubo/src/tools/styles.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
  int counter = 0;
  bool isOpen = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.backgroundColor,
      appBar: AppBar(
        backgroundColor: Palette.backgroundColor,
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
              const SizedBox(height: 10),
              Center(
                child: Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
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
              const SizedBox(height: 30),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 14),
                padding: EdgeInsets.all(14),
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.7,
                          child: Text(
                            widget.product.nombre,
                            style: Styles.detailTitleStyle,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Icon(
                          Icons.favorite_outline,
                          color: Palette.black.withOpacity(0.4),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Text(
                      widget.product.descripcion.replaceAll(". ", ". \n \n"),
                      style: Styles.detailLabelStyle,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      controller.formatCurrncy(
                        int.parse(
                          widget.product.precio,
                        ),
                      ),
                      overflow: TextOverflow.ellipsis,
                      style: Styles.gridViewStyle2,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      controller.formatCurrncy(
                        int.parse(
                              widget.product.precio,
                            ) -
                            (int.parse(
                                  widget.product.precio,
                                ) *
                                int.parse(
                                  widget.product.valorPromo,
                                ) ~/
                                100),
                      ),
                      overflow: TextOverflow.ellipsis,
                      style: Styles.moneyStyle,
                    ),
                    const SizedBox(height: 15),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2),
                        color: Palette.white,
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            color: Palette.black.withOpacity(0.4),
                            blurRadius: 6.0,
                            offset: Offset(0.2, 0.7),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CupertinoButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              setState(() {
                                if (counter > 0) {
                                  counter--;
                                }
                              });
                            },
                            child: Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: Palette.black.withOpacity(0.4),
                            ),
                          ),
                          Text("$counter"),
                          CupertinoButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              setState(() {
                                counter++;
                              });
                            },
                            child: Icon(
                              Icons.keyboard_arrow_up_rounded,
                              color: Palette.black.withOpacity(0.4),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 180,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2),
                            color: Palette.mainColor,
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                color: Palette.black.withOpacity(0.4),
                                blurRadius: 6.0,
                                offset: Offset(0.2, 0.7),
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              CupertinoButton(
                                padding: EdgeInsets.zero,
                                onPressed: () {
                                  setState(() {
                                    if (counter > 0) {
                                      counter--;
                                    }
                                  });
                                },
                                child: Icon(
                                  Icons.shopping_basket_outlined,
                                  color: Palette.white,
                                ),
                              ),
                              Text(
                                "Añadir al carrito",
                                style: Styles.buttonyStyle,
                              ),
                              const SizedBox(height: 30),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Descripción",
                          style: Styles.detailTitleStyle,
                          overflow: TextOverflow.ellipsis,
                        ),
                        CupertinoButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            setState(() {
                              if (isOpen) {
                                isOpen = false;
                              } else {
                                isOpen = true;
                              }
                            });
                          },
                          child: Icon(
                            isOpen
                                ? Icons.keyboard_arrow_up_rounded
                                : Icons.keyboard_arrow_down_rounded,
                            color: Palette.black.withOpacity(0.4),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

}
