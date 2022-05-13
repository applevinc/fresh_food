import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FruitContainer extends StatelessWidget {
  const FruitContainer({
    Key? key,
    this.img,
    this.name,
    this.bgColor,
  }) : super(key: key);

  final String? img;
  final String? name;
  final Color? bgColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150.w,
      margin: EdgeInsets.only(right: 15.w),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.all(Radius.circular(12)),
        boxShadow: [
          BoxShadow(
              color: const Color(0x12000000),
              offset: Offset(0, 5),
              blurRadius: 30,
              spreadRadius: 0)
        ],
      ),
      child: Column(
        children: [
          Image.asset(
            img!,
            height: 133.h,
            width: 133.w,
          ),
          Text(
            name!,
            style: Theme.of(context).textTheme.bodyText1!.apply(
                  color: Colors.white,
                ),
          )
        ],
      ),
    );
  }
}
