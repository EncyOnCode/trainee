import 'package:flutter/material.dart';
import '../../../domain/category_data.dart';


class CategoryData {

  final bool isSelected;
  final Icon icon;

  CategoryData({required this.isSelected, required this.icon});
}

class CategoryTextWidget extends StatefulWidget {
  const CategoryTextWidget({Key? key}) : super(key: key);

  @override
  CategoryTextWidgetState createState() => CategoryTextWidgetState();
}

class CategoryTextWidgetState extends State<CategoryTextWidget> {
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

  final List<Category> categories = [
    const Category(icon: Icons.smartphone_outlined, title: 'Phones'),
    const Category(icon: Icons.computer_outlined, title: 'Computer'),
    const Category(icon: Icons.health_and_safety_outlined, title: 'Health'),
    const Category(icon: Icons.book_outlined, title: 'Books'),
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