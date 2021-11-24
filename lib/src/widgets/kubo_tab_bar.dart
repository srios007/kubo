
import 'package:flutter/material.dart';
import 'package:prueba_kubo/src/tools/colors.dart';

class KuboTabBar extends StatelessWidget {
  final List<IconData> icons;
  final int selectedIndex;
  final Function(int) onTap;

  const KuboTabBar({
    Key key,
    @required this.icons,
    @required this.selectedIndex,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicatorPadding: EdgeInsets.zero,
      indicator: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Palette.white,
            width: 3,
          ),
        ),
      ),
      labelColor: Palette.mainColor,
      unselectedLabelColor: Palette.black.withOpacity(0.25),
      tabs: icons
          .asMap()
          .map(
            (index, icon) => MapEntry(
              index,
              Tab(
                icon: Icon(
                  icon,
                  color: index == selectedIndex
                      ? Palette.mainColor
                      : Palette.black.withOpacity(0.25),
                  size: 30,
                ),
              ),
            ),
          )
          .values
          .toList(),
      onTap: onTap,
      
    );
  }
}
