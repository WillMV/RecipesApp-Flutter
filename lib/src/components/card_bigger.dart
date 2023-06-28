import 'package:flutter/material.dart';

class CardBigger extends StatelessWidget {
  const CardBigger({super.key, required this.srcImg, required this.name});
  final String srcImg;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            srcImg,
            width: 170,
          ),
          Expanded(
            child: Column(
                children: [
                  ListTile(
                    title: Text(name),
                    subtitle: Text(name),
                  ),
                  const ListBody(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                        Icon(Icons.share), Icon(Icons.favorite)
                        ],
                      )
                    ],
                  )
                ],
            ),
          )
        ],
      ),
    );
  }
}
