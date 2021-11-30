import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresh_food_ui/src/core/style/colors.dart';

class MessageStream extends StatelessWidget {
  const MessageStream({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 30.h),
        reverse: true,
        itemCount: 7,
        itemBuilder: (BuildContext context, int index) {
          if (index % 2 == 0) {
            return BubbleNormal(
              text: 'bubble normal with tail',
              isSender: true,
              color: AppColors.green,
              tail: true,
              textStyle:
                  Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.white),
            );
          }

          return BubbleNormal(
            text: 'bubble normal with tail',
            isSender: false,
            color: AppColors.dark_grey,
            tail: true,
            textStyle: Theme.of(context).textTheme.bodyText1,
          );
        },
      ),
    );
  }
}
