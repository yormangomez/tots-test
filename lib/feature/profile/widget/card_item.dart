import 'package:flutter/material.dart';

class CardItem extends StatelessWidget {
  const CardItem({
    required this.rarity,
    required this.quantity,
    required this.cardFontSize,
    required this.cardWidth,
    required this.cardHeight,
    required this.itemBorderRadius,
    required this.containerWidth,
    required this.containerHeight,
    required this.imageUrl,
    super.key,
  });

  final String rarity;
  final String quantity;
  final double cardFontSize;
  final double cardWidth;
  final double cardHeight;
  final double itemBorderRadius;
  final double containerWidth;
  final double containerHeight;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromRGBO(61, 57, 53, 1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(itemBorderRadius),
      ),
      child: SizedBox(
        width: containerWidth,
        height: containerHeight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                rarity,
                style: const TextStyle(
                  fontFamily: 'Druk Text Wide ',
                  fontWeight: FontWeight.w500,
                  fontSize: 22,
                  color: Color.fromRGBO(255, 255, 255, 1),
                ),
              ),
            ),
            Image.network(
              imageUrl,
              width: 149,
              height: 206,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                quantity,
                style: const TextStyle(
                  fontFamily: 'Druk Text Wide ',
                  fontWeight: FontWeight.w500,
                  fontSize: 22,
                  color: Color.fromRGBO(255, 255, 255, 1),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
