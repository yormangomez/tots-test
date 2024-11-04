import 'package:api_helper/api_helper.dart';
import 'package:flutter/material.dart';
import 'package:tots/feature/profile/widget/card_item.dart';
import 'package:tots_ui/tots_ui.dart';

class MyCardsTab extends StatelessWidget {
  const MyCardsTab({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final bool isTablet = screenSize.width >= 768 && screenSize.width < 1366;
    final bool isDesktop = screenSize.width >= 1366;

    double cardWidth = isTablet
        ? 180
        : isDesktop
            ? 240
            : 70.0;
    double cardHeight = isTablet
        ? 240
        : isDesktop
            ? 335
            : 125.0;
    double containerWidth = 169.0;
    double containerHeight = 288.0;

    final List<Map<String, String>> cardData = [
      {
        'rarity': 'COMUN',
        'quantity': 'X100,000',
        'imageUrl': '$baseS3Url/Images/Rarities/GameCards/I.png'
      },
      {
        'rarity': 'POCO COMUN',
        'quantity': 'X90,000',
        'imageUrl': '$baseS3Url/Images/Rarities/GameCards/H.png'
      },
      {
        'rarity': 'RARA',
        'quantity': 'X8,000',
        'imageUrl': '$baseS3Url/Images/Rarities/GameCards/G.png'
      },
      {
        'rarity': 'EPICA',
        'quantity': 'X700',
        'imageUrl': '$baseS3Url/Images/Rarities/GameCards/F.png'
      },
      {
        'rarity': 'LEGENDARIA',
        'quantity': 'X60',
        'imageUrl': '$baseS3Url/Images/Rarities/GameCards/E.png'
      },
      {
        'rarity': 'CELESTIAL',
        'quantity': 'X30',
        'imageUrl': '$baseS3Url/Images/Rarities/GameCards/D.png'
      },
      {
        'rarity': 'IMPERIAL',
        'quantity': 'X21',
        'imageUrl': '$baseS3Url/Images/Rarities/GameCards/C.png'
      },
      {
        'rarity': 'REALEZA',
        'quantity': 'X13',
        'imageUrl': '$baseS3Url/Images/Rarities/GameCards/A.png'
      },
    ];

    return Padding(
      padding: const EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'MIS CARTAS POR RAREZA',
              style: UITextStyle.captions.captionMedium.copyWith(
                fontSize: 16,
                color: const Color.fromRGBO(255, 255, 255, 1),
                fontFamily: 'Archivo',
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: isDesktop
                    ? 5
                    : isTablet
                        ? 3
                        : 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                childAspectRatio: cardWidth / cardHeight,
              ),
              itemCount: cardData.length,
              itemBuilder: (context, index) {
                final card = cardData[index];
                return CardItem(
                  rarity: card['rarity']!,
                  quantity: card['quantity']!,
                  cardFontSize: 32,
                  cardWidth: cardWidth,
                  cardHeight: cardHeight,
                  itemBorderRadius: 15,
                  containerWidth: containerWidth,
                  containerHeight: containerHeight,
                  imageUrl: card['imageUrl']!,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
