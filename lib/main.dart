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
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const GPSWidget(),
      ),
      body: Column(
        children: const [
          CategoriesText(),
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
      alignment: Alignment.center,
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
          child: Icon(Icons.filter_list_off_outlined, color: Color(0xFF010035)),
        ),
      ],
    );
  }
}

class CategoryData {
  late final bool isSelected;
  final Icon icon;

  CategoryData({required this.isSelected, required this.icon});
}

class CategoryTextWidget extends StatefulWidget {
  const CategoryTextWidget({Key? key}) : super(key: key);

  @override
  _CategoryTextWidgetState createState() => _CategoryTextWidgetState();
}

class _CategoryTextWidgetState extends State<CategoryTextWidget> {
  int selectedCategoryIndex = -1;

  void _selectCategory(int index) {
    setState(() {
      if (selectedCategoryIndex == index) {
        // Если текущая кнопка уже была выбрана, сбрасываем выбор
        selectedCategoryIndex = -1;
      } else {
        selectedCategoryIndex = index;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Category> categories = [
      Category(icon: Icons.smartphone_outlined),
      Category(icon: Icons.computer_outlined),
      Category(icon: Icons.health_and_safety_outlined),
      Category(icon: Icons.book_outlined),
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];
                final isSelected = index == selectedCategoryIndex;

                return GestureDetector(
                  onTap: () => _selectCategory(index),
                  child: _CategoryItem(
                    isSelected: isSelected,
                    theIcon: category.icon,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _CategoryItem extends StatelessWidget {
  final bool isSelected;
  final IconData theIcon;

  const _CategoryItem({
    Key? key,
    required this.isSelected,
    required this.theIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = isSelected ? const Color(0xFFFF6E4E) : Colors.white;

    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(120),
          child: Material(
            child: Ink(
              width: 90,
              height: 90,
              color: color,
              child: Center(
                child: Icon(
                  theIcon,
                  color: isSelected ? Colors.white : Colors.black,
                  size: 30,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class Category {
  final IconData icon;

  Category({required this.icon});
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
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white,
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

class CategoriesText extends StatelessWidget {
  const CategoriesText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          const Text(
            'Select Category',
            style: TextStyle(
              color: Color(0xFF010035),
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          TextButton(
            onPressed: () {},
            child: const Text(
              'view all',
              style: TextStyle(
                color: Color(0xFFff6e4e),
                fontSize: 15,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _QRCodeButton extends StatelessWidget {
  const _QRCodeButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onLongPress: () => print('<blank>'), //TODO: сделать тултип на onLongPress
      onPressed: () {},
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(const Color(0xFFFF6E4E)),
        shape: MaterialStateProperty.all(const CircleBorder()),
        padding: const MaterialStatePropertyAll(EdgeInsets.all(12)),
      ),
      child: const Padding(
        padding: EdgeInsets.all(5.0),
        child: Icon(
          Icons.qr_code_outlined,
          size: 25,
        ),
      ),
    );
  }
}
