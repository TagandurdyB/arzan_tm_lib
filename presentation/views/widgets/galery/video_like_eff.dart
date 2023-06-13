import '/config/services/my_size.dart';
import 'package:flutter/material.dart';

import '../like_effect_widget.dart';

class VideoLikeEff extends StatefulWidget {
  const VideoLikeEff({super.key});

  @override
  State<VideoLikeEff> createState() => _VideoLikeEffState();
}

class _VideoLikeEffState extends State<VideoLikeEff> {
  bool isLike = false;

  final double arentir = MySize.arentir;
  @override
  Widget build(BuildContext context) {
    return LikeEffect(
      bubbleCount: 500,
      onTap: (bool val) {
        setState(() => isLike = val);
      },
      child: Container(
          alignment: Alignment.bottomRight,
          margin: EdgeInsets.symmetric(
              vertical: arentir * 0.13, horizontal: arentir * 0.06),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                isLike ? Icons.favorite : Icons.favorite_border,
                size: 21,
                color: const Color(0xffE50027),
              ),
              Text("1521",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: arentir * 0.04)),
            ],
          )),
    );
  }
}
