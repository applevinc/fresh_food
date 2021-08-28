import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

BoxDecoration kContainerBottomShadowDecoration(BuildContext context) => BoxDecoration(
      color: Theme.of(context).scaffoldBackgroundColor,
      borderRadius: BorderRadius.circular(36),
      boxShadow: [
        BoxShadow(
          color: Color(0x0d000000),
          offset: Offset(0, 5),
          blurRadius: 30,
          spreadRadius: 0,
        ),
      ],
    );

