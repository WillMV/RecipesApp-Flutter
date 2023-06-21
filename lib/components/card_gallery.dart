import 'package:flutter/material.dart';

class CardGallery extends StatelessWidget {
  const CardGallery({super.key, required this.srcImg, required this.name});
  final String srcImg;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Card(
      semanticContainer: false,
      color: Colors.grey,
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        splashColor: Colors.blue,
        onTap: () {
          debugPrint('Card tapped');
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.network(srcImg),
            Padding(
              padding: const EdgeInsets.only(left: 8, top: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
