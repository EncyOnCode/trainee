import 'package:flutter/material.dart';

class BestSellerPhoneGrid extends StatelessWidget {
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

  BestSellerPhoneGrid({super.key});

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