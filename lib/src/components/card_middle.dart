import 'package:flutter/material.dart';

class CardMiddle extends StatelessWidget {
  const CardMiddle({super.key, required this.srcImg, required this.name});
  final String srcImg;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Card(
      // color: Colors.white60,
      elevation: 5,
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        splashColor: Colors.blue,
        onTap: () {
          debugPrint('Card tapped');
        },
        child: Column(
          children: [
            Image.network(srcImg),
            Padding(
              padding: const EdgeInsets.only(left: 8, top: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Flexible(
                    child: Title(color: Colors.black, child: Text(
                      name,
                      style: const TextStyle(
                          fontSize: 20),
                    ),)
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
