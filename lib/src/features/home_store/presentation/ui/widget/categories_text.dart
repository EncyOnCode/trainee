import 'package:flutter/material.dart';

class CategoriesText extends StatelessWidget {
  const CategoriesText({
    Key? key,
    required this.bigTitle,
    required this.smallTitle,
    required this.onTap,
  }) : super(key: key);

  final String bigTitle;
  final String smallTitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 18, left: 12, top: 12, bottom: 12),
      child: Row(
        children: [
          Text(
            bigTitle,
            style: const TextStyle(
              color: Color(0xFF010035),
              fontSize: 25,
              fontWeight: FontWeight.w700
              ,
            ),
          ),
          const Spacer(),
          TextButton(
            onPressed: () {},
            child: Text(
              smallTitle,
              style: const TextStyle(
                color: Color(0xFFff6e4e),
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}