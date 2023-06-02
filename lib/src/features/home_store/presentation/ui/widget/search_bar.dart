import 'package:flutter/material.dart';
import 'qr_code_button.dart';

class SearchLine extends StatelessWidget {
  const SearchLine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: Row(
        children: <Widget>[
          Expanded(child: _SearchBar()),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: QRCodeButton(),
          ),
        ],
      ),
    );
  }
}

class _SearchBar extends StatelessWidget {
  const _SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
      ),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 12.0, right: 8.0),
              child: Icon(
                Icons.search_outlined,
                color: Color(0xFFFF6E4E),
              ),
            ),
            Text(
              'Search',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
