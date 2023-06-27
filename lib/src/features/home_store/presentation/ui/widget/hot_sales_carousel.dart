import 'package:flutter/material.dart';

import '../../../domain/sales_item_data.dart';

class HotSalesCarousel extends StatefulWidget {
  const HotSalesCarousel({Key? key, required this.isNew}) : super(key: key);

  final bool isNew;

  @override
  HotSalesCarouselState createState() => HotSalesCarouselState();
}

class HotSalesCarouselState extends State<HotSalesCarousel> {
  final List<SalesItem> salesItems = [
    const SalesItem(
      imageUrl: 'https://media.discordapp.net/attachments/988860107423100938/1111314904872386662/image.png',
      pageTitle: 'Iphone 12',
      pageDescription: 'Super. Mega. Rapido.',
    ),
    const SalesItem(
      imageUrl: 'https://media.discordapp.net/attachments/988860107423100938/1111314904872386662/image.png',
      pageTitle: 'Some other title',
      pageDescription: 'Some other description',
    ),
    const SalesItem(
      imageUrl: 'https://media.discordapp.net/attachments/988860107423100938/1111314904872386662/image.png',
      pageTitle: 'Another title',
      pageDescription: 'Another description',
    )
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 182,
      child: PageView.builder(
        itemCount: salesItems.length,
        itemBuilder: (context, index) {
          final item = salesItems[index];

          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.network(
                  item.imageUrl,
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
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      item.pageTitle,
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
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      item.pageDescription,
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
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: TextButton(
                      onPressed: () {},
                      style: const ButtonStyle(
                        padding: MaterialStatePropertyAll(
                          EdgeInsets.symmetric(horizontal: 25),
                        ),
                        backgroundColor: MaterialStatePropertyAll(
                          Colors.white,
                        ),
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
          );
        },
      ),
    );
  }
}
