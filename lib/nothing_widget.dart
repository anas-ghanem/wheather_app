import 'package:flutter/material.dart';

class NothingWidget extends StatelessWidget {
  const NothingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [Text("there is no weather start"), Text(" start now")],
        ),
      ),
    );
  }
}
