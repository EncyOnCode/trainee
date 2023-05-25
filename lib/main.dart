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
      backgroundColor: const Color(0xFFF8F8F8),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF8F8F8),
        elevation: 0,
        centerTitle: true,
        title: const GPSWidget(),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          CategoriesText(
            bigTitle: 'Select Category',
            smallTitle: 'view all',
            onTap: () {},
          ),
          const SizedBox(height: 10),
          const CategoryTextWidget(),
          const SizedBox(height: 20),
          const SearchBar(),
          const SizedBox(height: 20),
          CategoriesText(
            bigTitle: 'Hot sales',
            smallTitle: 'see more',
            onTap: () {},
          ),
          const SizedBox(height: 20),
          const HotSalesWidget(isNew: true),
          const SizedBox(height: 20),
          CategoriesText(
            bigTitle: 'Best seller',
            smallTitle: 'see more',
            onTap: () {},
          ),
          PhoneGridWidget(),
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

  List<Category> categories = [
    Category(icon: Icons.smartphone_outlined, title: 'Phones'),
    Category(icon: Icons.computer_outlined, title: 'Computer'),
    Category(icon: Icons.health_and_safety_outlined, title: 'Health'),
    Category(icon: Icons.book_outlined, title: 'Books'),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 115,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            separatorBuilder: (context, index) => const SizedBox(width: 10),
            itemBuilder: (context, index) {
              final category = categories[index];
              final isSelected = index == selectedCategoryIndex;

              return GestureDetector(
                onTap: () => _selectCategory(index),
                child: _CategoryItem(
                  isSelected: isSelected,
                  theIcon: category.icon,
                  title: category.title,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _CategoryItem extends StatelessWidget {
  final bool isSelected;
  final IconData theIcon;
  final String title;

  const _CategoryItem({
    Key? key,
    required this.isSelected,
    required this.theIcon,
    required this.title,
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
                  color: isSelected ? Colors.white : const Color(0xFF010035),
                  size: 30,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          title,
          style: TextStyle(
            color:
                isSelected ? const Color(0xFFFF6E4E) : const Color(0xFF010035),
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

class Category {
  final IconData icon;
  final String title;

  Category({required this.icon, required this.title});
}

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: Row(
        children: <Widget>[
          Expanded(child: _SearchBar()),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
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
              fontWeight: FontWeight.bold,
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
          foregroundColor: MaterialStateProperty.all(const Color(0xFFFF6E4E)),
        ),
      ),
    );
  }
}

class HotSalesWidget extends StatefulWidget {
  const HotSalesWidget({Key? key, required this.isNew}) : super(key: key);

  final bool isNew;

  @override
  _HotSalesWidgetState createState() => _HotSalesWidgetState();
}

class _HotSalesWidgetState extends State<HotSalesWidget> {
  final List<String> imageUrls = [
    'https://media.discordapp.net/attachments/988860107423100938/1111314904872386662/image.png',
    'https://media.discordapp.net/attachments/988860107423100938/1111314904872386662/image.png',
    'https://media.discordapp.net/attachments/988860107423100938/1111314904872386662/image.png',
  ];

  final List<String> pageTitles = [
    'Iphone 12',
    'Some other title',
    'Another title'
  ];

  final List<String> pageDescription = [
    'Súper. Mega. Rápido.',
    'Some other description',
    'Another description'
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 182,
      child: PageView.builder(
        itemCount: imageUrls.length,
        onPageChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    imageUrls[index],
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    top: 8,
                    left: 8,
                    child: Container(
                      width: 27,
                      height: 27,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFFFF6E4E),
                      ),
                      child: const Center(
                        child: Text(
                          'New',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 10,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 60,
                    left: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      color: Colors.black.withOpacity(0),
                      child: Text(
                        pageTitles[index],
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 90,
                    left: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      color: Colors.black.withOpacity(0),
                      child: Text(
                        pageDescription[index],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 120,
                    left: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      color: Colors.black.withOpacity(0),
                      child: TextButton(
                        onPressed: () {},
                        style: const ButtonStyle(
                          padding: MaterialStatePropertyAll(
                            EdgeInsets.symmetric(horizontal: 25),
                          ),
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.white),
                        ),
                        child: const Text(
                          'Buy now!',
                          style: TextStyle(
                            color: Color(0xFF010035),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class PhoneGridWidget extends StatelessWidget {
  final List<PhoneItem> phones = [
    PhoneItem(
      image:
          'https://media.discordapp.net/attachments/988860107423100938/1111334844522303528/image.png',
      currentPrice: '1,047',
      previousPrice: '1,500',
      name: 'Samsung Galaxy s20 Ultra',
    ),
    PhoneItem(
      image:
          'https://media.discordapp.net/attachments/988860107423100938/1111334909223645285/image.png',
      currentPrice: '300',
      previousPrice: '400',
      name: 'Xiaomi Mi 10 Pro',
    ),
    PhoneItem(
      image:
          'https://media.discordapp.net/attachments/988860107423100938/1111334933055672390/image.png',
      currentPrice: '1,047',
      previousPrice: '1500',
      name: 'Samsung Note 20 Ultra',
    ),
    PhoneItem(
      image:
          'https://media.discordapp.net/attachments/988860107423100938/1111334967562215484/image.png',
      currentPrice: '300',
      previousPrice: '400',
      name: 'Motorola One Edge',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 472,
      child: GridView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: phones.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.75,
        ),
        itemBuilder: (context, index) {
          final phone = phones[index];
          return PhoneCard(
            image: phone.image,
            currentPrice: phone.currentPrice,
            previousPrice: phone.previousPrice,
            name: phone.name,
          );
        },
      ),
    );
  }
}

class PhoneCard extends StatelessWidget {
  final String image;
  final String currentPrice;
  final String previousPrice;
  final String name;

  const PhoneCard({
    Key? key,
    required this.image,
    required this.currentPrice,
    required this.previousPrice,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              image,
              fit: BoxFit.cover,
              height: 150,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12, top: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    '\$$currentPrice',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF010035),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      '\$$previousPrice',
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.lineThrough,
                        color: Color(0xFFCCCCCC),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12, top: 4),
              child: Text(
                name,
                style: const TextStyle(
                  fontSize: 10,
                  color: Color(0xFF010035),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PhoneItem {
  final String image;
  final String currentPrice;
  final String previousPrice;
  final String name;

  PhoneItem({
    required this.image,
    required this.currentPrice,
    required this.previousPrice,
    required this.name,
  });
}
