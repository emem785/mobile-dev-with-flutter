import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fooody/models/MenuCategory.dart';

class CategoryTile extends StatelessWidget {
  final MenuCategory menuCategory;

  const CategoryTile({Key key, @required this.menuCategory}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 64,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            color: menuCategory.isSelected
                ? Theme.of(context).primaryColor
                : Colors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: SvgPicture.asset(
                  menuCategory.svgPath,
                  color: menuCategory.isSelected ? Colors.white : Colors.black,
                ),
                height: 32,
              ),
              Text(
                menuCategory.svgName,
                style: TextStyle(
                  color: menuCategory.isSelected ? Colors.white : Colors.black,
                ),
              )
            ],
          ),
        ),
        SizedBox(width: 24)
      ],
    );
  }
}
