import 'package:flutter/material.dart';

class MessengerCanvas extends StatelessWidget {
  final Widget widget;
  const MessengerCanvas({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onPrimaryContainer,
        ),
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: widget
        ),
      ),
    );
  }
}
