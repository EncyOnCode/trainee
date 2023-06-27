import 'package:flutter/material.dart';

class GPSWidget extends StatelessWidget {
  const GPSWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: const Icon(Icons.pin_drop_outlined),
              color: const Color(0xFFFF6E4E),
              onPressed: () {},
              splashRadius: 18,
            ),
            const Text(
              'Russia, Izhevsk',
              style: TextStyle(
                color: Color(0xFF010035),
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        ),
        Align(
          alignment: Alignment.topRight,
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.filter_alt_outlined),
            splashRadius: 15,
            color: const Color(0xFF010035),
          ),
        ),
      ],
    );
  }
}
