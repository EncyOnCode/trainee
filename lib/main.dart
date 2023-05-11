import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

import 'app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter().config(),
      theme: ThemeData(fontFamily: 'Mark Pro'),
    );
  }
}

@RoutePage()
class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const GPSWidget(),
      ),
      body: Column(
        children: const [
          CategoryTextWidget(),
          SearchBar(),
        ],
      ),
    );
  }
}

class GPSWidget extends StatelessWidget {
  const GPSWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.pin_drop,
              color: Color(0xFFFF6E4E),
            ),
            Text(
              'Russia, Izhevsk',
              style: TextStyle(
                color: Color(0xFF010035),
                fontWeight: FontWeight.w400,
              ),
            )
          ],
        ),
        const Align(
          alignment: Alignment.topRight,
          child: Icon(Icons.filter_list_alt, color: Color(0xFF010035)),
        ),
      ],
    );
  }
}

@RoutePage()
class NewsScreen extends StatelessWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}

class CategoryTextWidget extends StatelessWidget {
  const CategoryTextWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          const SizedBox(
            height: 16,
          ),
          Row(
            children: const [
              Text(
                'Select Category',
                style: TextStyle(
                  color: Color(0xFF010035),
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(),
              Text(
                'view all',
                style: TextStyle(
                  color: Color(0xFFff6e4e),
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          SizedBox(
            height: 100,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: const [
                _CategoryItem(isSelected: true, theIcon: Icon(Icons.smartphone),),
                _CategoryItem(isSelected: false,theIcon: Icon(Icons.computer),),
                _CategoryItem(isSelected: false,theIcon: Icon(Icons.health_and_safety),),
                _CategoryItem(isSelected: false,theIcon: Icon(Icons.book),),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


class _CategoryItem extends StatelessWidget {
  const _CategoryItem({
    Key? key,
    required this.isSelected,
    required this.theIcon,
  }) : super(key: key);

  final bool isSelected;
  final Icon theIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(120),
          child: Material(
            child: Ink(
              width: 90,
              height: 90,
              color: isSelected ? const Color(0xFFFF6E4E) : Colors.white,
              child: InkWell(
                onTap: () {},
                child: Align(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Icon(
                      theIcon.icon,
                      size: 34,
                      color: isSelected ? Colors.white : const Color(0xFFB3B3C3),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Row(
        children: const <Widget>[
          Expanded(child: _SearchBar()),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: _QRCodeButton(),
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
    final theme = Theme.of(context);

    return DecoratedBox(
      decoration: BoxDecoration(
        color: theme.colorScheme.onPrimary,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 12.0),
        child: Row(
          children: const [
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

class _QRCodeButton extends StatelessWidget {
  const _QRCodeButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(120.0),
      child: Material(
        color: const Color(0xFFFF6E4E),
        child: IconButton(
          tooltip: 'Scan me!',
          icon: const Icon(
            Icons.qr_code_outlined,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
      ),
    );
  }
}




