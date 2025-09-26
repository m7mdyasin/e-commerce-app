import 'package:flutter/material.dart';
import 'package:fruits_market/features/home/domain/entites/bottom_navigation_bar_entity.dart';
import 'package:fruits_market/features/home/presentation/views/widgets/navigation_bar_item.dart';

class CustomButtonHomeBar extends StatefulWidget {
  const CustomButtonHomeBar({super.key});

  @override
  State<CustomButtonHomeBar> createState() => _CustomButtonHomeBarState();
}

class _CustomButtonHomeBarState extends State<CustomButtonHomeBar> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: bottomNavigationBarItems.asMap().entries.map((e) {
          var index = e.key;
          var entity = e.value;
          return Expanded(
            flex: index == selectedIndex ? 3 : 2,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              child: NavigationBarItem(
                isSelected: selectedIndex == index,
                bottomNavigationBarEntity: entity,
              ),
            ),
          );
        }).toList(),
      ),
      width: 375,
      height: 70,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        shadows: [
          BoxShadow(
            color: Color(0x19000000),
            blurRadius: 20,
            offset: Offset(0, -2),
            spreadRadius: 0,
          ),
        ],
      ),
    );
  }
}
