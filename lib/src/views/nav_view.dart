import 'package:flutter/material.dart';
import 'package:prueba_kubo/src/tools/colors.dart';
import 'package:prueba_kubo/src/views/home/home_view.dart';
import 'package:prueba_kubo/src/widgets/kubo_tab_bar.dart';
import 'home/home_view.dart';
import 'later/later_view.dart';

class NavView extends StatefulWidget {
  NavView({this.index = 0});
  int index;

  @override
  _NavViewState createState() => _NavViewState();
}

class _NavViewState extends State<NavView> {
  final List<Widget> _screens = [
    HomeView(),
    LaterView(),
    LaterView(),
    LaterView(),
  ];

  final List<IconData> _icons = const [
    Icons.home,
    Icons.grid_view,
    Icons.shopping_basket_outlined,
    Icons.account_circle,
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: widget.index,
      length: _icons.length,
      child: Scaffold(
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: _screens,
        ),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.only(bottom: 12.0),
          decoration: BoxDecoration(
            color: Palette.white,
            border: Border(
              top: BorderSide(
                color: Palette.white,
              ),
            ),
          ),
          child: KuboTabBar(
            icons: _icons,
            selectedIndex: widget.index,
            onTap: (index) {
              setState(() {
                widget.index = index;
              });
            },
          ),
        ),
      ),
    );
  }
}
