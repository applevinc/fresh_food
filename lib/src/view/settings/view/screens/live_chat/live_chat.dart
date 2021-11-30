import 'package:flutter/material.dart';
import 'package:fresh_food_ui/src/core/assets/images.dart';
import 'package:fresh_food_ui/src/core/widgets/appbar.dart';
import 'package:fresh_food_ui/src/view/settings/view/screens/live_chat/components/enter_message_field.dart';
import 'package:fresh_food_ui/src/view/settings/view/screens/live_chat/components/message_stream.dart';

class LiveChatScreen extends StatelessWidget {
  const LiveChatScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar1(
        title: 'Live Chat',
        automaticallyImplyLeading: true,
        actions: [
          Image.asset(AppImages.cat),
        ],
      ),
      body: Column(
        children: [
          MessageStream(),
          EnterMessageField(),
        ],
      ),
    );
  }
}
