import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:prueba_kubo/src/models/product.dart';
import 'package:prueba_kubo/src/tools/colors.dart';
import 'package:prueba_kubo/src/tools/styles.dart';
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

  @override
  void initState() async {
    super.initState();
    controller.productsList = controller.fetchProduct();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.backgroundColor,
      body: SafeArea(
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
                // initialValue: searchText,
                icon: Icons.search,
                // iconColor: Palette.gourmet,
                placeholder: "Buscar",
                onChanged: (text) {
                  // searchText = text;
                  // _filterByName(text);
                  // if (searchText == "") {
                  //   setState(() {
                  //     restaurantsList = restaurantsListBackUp;
                  //   });
                  // }
                },
              ),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "Todos los productos",
                style: Styles.homeTitleStyle,
              ),
            ),
            const SizedBox(height: 24),
            Center(
              child: FutureBuilder<Product>(
                future: controller.productsList,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Container(
                      height: MediaQuery.of(context).size.height * 0.55,
                      width: double.infinity,
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20,
                          childAspectRatio: 0.6,
                        ),
                        itemCount: snapshot.data.data.length,
                        itemBuilder: (BuildContext context, index) {
                          return Padding(
                            padding: index % 2 == 0
                                ? EdgeInsets.only(left: 10)
                                : EdgeInsets.only(right: 10),
                            child: Container(
                              margin: index == 0 || index == 1
                                  ? EdgeInsets.only(top: 10)
                                  : EdgeInsets.only(top: 0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14),
                                color: Palette.white,
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                    color: Palette.black.withOpacity(0.2),
                                    blurRadius: 6.0,
                                    offset: Offset(0.2, 0.7),
                                  ),
                                ],
                              ),
                              alignment: Alignment.center,
                              child: Padding(
                                padding: EdgeInsets.only(right: 15),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 10),
                                    Stack(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(
                                            top: (MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.2) -
                                                45,
                                            left: 5,
                                          ),
                                          height: 45,
                                          width: 10,
                                          decoration: BoxDecoration(
                                            color: Palette.mainColor,
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(6),
                                              topLeft: Radius.circular(15),
                                            ),
                                          ),
                                        ),
                                        Stack(
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(left: 15),
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.2,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(14),
                                                color: Palette.lightGrey,
                                                image: DecorationImage(
                                                  image: NetworkImage(
                                                    snapshot.data.data[index]
                                                        .imagen,
                                                  ),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: (MediaQuery.of(context)
                                                              .size
                                                              .height *
                                                          0.2) -
                                                      40),
                                              child: Container(
                                                margin:
                                                    EdgeInsets.only(left: 15),
                                                height: 40,
                                                width: 70,
                                                decoration: BoxDecoration(
                                                  color: Palette.mainColor,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topRight:
                                                        Radius.circular(6),
                                                  ),
                                                ),
                                                child: Align(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 10),
                                                    child: Text(
                                                        '${snapshot.data.data[index].valorPromo} %',
                                                        style: Styles
                                                            .discountStyle),
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    Container(
                                      margin: EdgeInsets.only(left: 15),
                                      width: MediaQuery.of(context).size.width *
                                          0.35,
                                      child: Text(
                                        snapshot.data.data[index].nombre,
                                        overflow: TextOverflow.ellipsis,
                                        style: Styles.gridViewStyle1,
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 15),
                                      width: MediaQuery.of(context).size.width *
                                          0.35,
                                      child: Text(
                                        controller.formatCurrncy(
                                          int.parse(
                                            snapshot.data.data[index].precio,
                                          ),
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                        style: Styles.gridViewStyle2,
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 15),
                                      width: MediaQuery.of(context).size.width *
                                          0.35,
                                      child: Text(
                                        controller.formatCurrncy(
                                          int.parse(
                                                snapshot
                                                    .data.data[index].precio,
                                              ) -
                                              (int.parse(
                                                    snapshot.data.data[index]
                                                        .precio,
                                                  ) *
                                                  int.parse(
                                                    snapshot.data.data[index]
                                                        .valorPromo,
                                                  ) ~/
                                                  100),
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                        style: Styles.gridViewStyle3,
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 25),
                                          child: Icon(
                                            Icons.favorite_outline,
                                            color:
                                                Palette.black.withOpacity(0.3),
                                          ),
                                        ),
                                        Icon(
                                          Icons.shopping_basket_outlined,
                                          color: Palette.black.withOpacity(0.3),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Text('Por favor, intente de nuevo más tarde');
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
    );
  }
}
