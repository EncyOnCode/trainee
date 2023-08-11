import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

import '../widget/gps_widget.dart';
import '../widget/category_text_widget.dart';
import '../widget/categories_text.dart';
import '../widget/hot_sales_carousel.dart';
import '../widget/best_seller_phone_grid.dart';
import '../widget/nav_bar.dart';
import '../widget/search_bar.dart';

@RoutePage()
class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: const NavBar(),
      backgroundColor: const Color(0xFFF8F8F8),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF8F8F8),
        elevation: 0,
        centerTitle: true,
        title: const GPSWidget(),
      ),
      body: ListView(
        children: [
          CategoriesText(
            bigTitle: 'Select Category',
            smallTitle: 'view all',
            onTap: () {},
          ),
          const SizedBox(height: 10),
          const CategoryTextWidget(),
          const SizedBox(height: 20),
          const SearchLine(),
          const SizedBox(height: 20),
          CategoriesText(
            bigTitle: 'Hot Sales',
            smallTitle: 'see more',
            onTap: () {},
          ),
          const SizedBox(height: 20),
          const HotSalesCarousel(isNew: true),
          const SizedBox(height: 20),
          CategoriesText(
            bigTitle: 'Best Seller',
            smallTitle: 'see more',
            onTap: () {},
          ),
          BestSellerPhoneGrid(),
        ],
      ),
    );
  }
}
