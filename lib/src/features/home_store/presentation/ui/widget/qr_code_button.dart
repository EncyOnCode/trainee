import 'package:flutter/material.dart';

class QRCodeButton extends StatelessWidget {
  const QRCodeButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const ShapeDecoration(
        shape: CircleBorder(),
        color: Color(0xFFFF6E4E),
      ),
      child: IconButton(
        onPressed: () {},
        splashRadius: 25,
        icon: const Icon(Icons.qr_code_outlined),
        color: Colors.white,
        tooltip: 'AMONG US',
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(Colors.white),
        ),
      ),
    );
  }
}