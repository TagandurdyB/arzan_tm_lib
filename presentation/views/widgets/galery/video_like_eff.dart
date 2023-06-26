import 'package:arzan/presentation/providers/data/video_data_provider.dart';

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
      bubbleCount: 75,
      onTap: (bool val) {
        final videoDo = VideoDataP.of(context, listen: false);
        final int index = videoDo.videoIndex;
        videoDo.likePost(videoDo.videos![index].id);
        setState(() => isLike = val);
      },
      child: Container(
          alignment: Alignment.bottomRight,
          margin: EdgeInsets.symmetric(
              vertical: arentir * 0.15, horizontal: arentir * 0.06),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                isLike ? Icons.favorite : Icons.favorite_border,
                size: arentir*0.07,
                color: const Color(0xffE50027),
              ),
              Text(" 1560",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: arentir * 0.05)),
            ],
          )),
    );
  }
}
