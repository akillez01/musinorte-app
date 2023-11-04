import 'package:flutter/material.dart';

class SongCard extends StatelessWidget {
  final AssetImage image;

  const SongCard({required Key key, required this.image}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140,
      child: Column(
        children: [
          Image(
            image: image,
            width: 140,
            height: 140,
          ),
          Text(
            "A arca de noe, A Mensagem, São miguel, Daime Sorrindo",
            style: Theme.of(context).textTheme.labelLarge,
            softWrap: true,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
        ],
      ),
    );
  }
}
