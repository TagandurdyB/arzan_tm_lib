//Like Effect==================================================
import 'package:arzan/presentation/providers/data/video_data_provider.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import '../../../config/services/soud_service.dart';

class Bubble {
  final Color color;
  final double direction;
  final double speed;
  final double size;
  final double initialPosition;

  Bubble({
    required this.color,
    required this.direction,
    required this.speed,
    required this.size,
    required this.initialPosition,
  });
}

class LikeEffect extends StatefulWidget {
  final int bubbleCount;
  final Widget? child;
  final bool isLiked;
  final Function? onTap;
  final Duration duration;
  const LikeEffect(
      {required this.bubbleCount,
      this.onTap,
      this.duration = const Duration(seconds: 3),
      this.isLiked = false,
      this.child,
      super.key});

  @override
  State<LikeEffect> createState() => _LikeEffectState();
}

class _LikeEffectState extends State<LikeEffect>
    with SingleTickerProviderStateMixin {
  late AnimationController _animControl;
  late Animation<double> _prossesAnim;
  late bool isLiked;
  late VideoDataP videoDo, videoP;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _animControl = AnimationController(
        vsync: this,
        duration: widget.duration,
      );
      _prossesAnim = CurvedAnimation(
        parent: _animControl,
        curve: const Interval(0.0, 0.65),
      );

      videoDo = VideoDataP.of(context, listen: false);
      videoDo.changeLikeAnim(_animControl);
      videoDo.changeLikeProsses(_prossesAnim);
    });

    isLiked = widget.isLiked;
    bubblGenerator(widget.bubbleCount);

    super.initState();
  }

  @override
  void dispose() {
    _animControl.dispose();
    super.dispose();
  }

  List<Bubble> bubbles = [];
  void bubblGenerator(int count) => bubbles = List.generate(count, (index) {
        final size = math.Random().nextInt(20) + 5.0;
        final double speed = math.Random().nextInt(50) + 1;
        final directionRandom = math.Random().nextBool();
        final colorRandom = math.Random().nextBool();
        final double direction =
            math.Random().nextInt(250) * (directionRandom ? 1.0 : -1);
        final color = colorRandom ? Colors.red[700]! : const Color(0xffE50027);
        return Bubble(
            color: color,
            direction: direction,
            speed: speed,
            size: size,
            initialPosition: index * 10);
      });

  @override
  Widget build(BuildContext context) {
    videoP = VideoDataP.of(context);
    videoDo = VideoDataP.of(context, listen: false);
    if (videoDo.likeProssesAnim != null && videoDo.likeAnim != null) {
      _prossesAnim = videoP.likeProssesAnim!;
      _animControl = videoP.likeAnim!;
      return AnimatedBuilder(
          animation: Listenable.merge([
            videoP.likeProssesAnim,
          ]),
          builder: (context, ss) {
            final query = MediaQuery.of(context).size;
            final circleSize =
                (query.height * 0.2) * math.pow((_prossesAnim.value + 1), 2);
            return Stack(
              alignment: Alignment.topCenter,
              children: [
                Center(
                  child: GestureDetector(
                    onTap: () {
                      if (!isLiked) {
                        videoP.playLike;
                        // _animControl.reset();
                        // _animControl.forward();
                     //   SoundService.playLike;
                      }
                      isLiked = !isLiked;
                      if (widget.onTap != null) widget.onTap!(isLiked);
                    },
                    child: widget.child ??
                        const Icon(
                          Icons.favorite,
                          color: Colors.red,
                        ),
                  ),
                  // child: GestureDetector(
                  //   onTap: () {
                  //     _animControl.reset();
                  //     _animControl.forward();
                  //     // if (_animControl.isCompleted) {
                  //     //   print("reverse");
                  //     //   _animControl.reset();
                  //     //   _animControl.forward();
                  //     // } else {
                  //     //   print("forward");
                  //     //   _animControl.forward();
                  //     // }
                  //   },
                  //   child: const Icon(
                  //     Icons.favorite,
                  //     size: 110,
                  //     color: Colors.red,
                  //   ),
                  // ),
                ),
                Positioned(
                  height: circleSize / 2,
                  width: circleSize,
                  bottom: 0,
                  child: AnimatedOpacity(
                    opacity: 1 - _prossesAnim.value,
                    duration: const Duration(milliseconds: 200),
                    child: CustomPaint(
                      foregroundPainter: BubblePainter(_prossesAnim, bubbles),
                    ),
                  ),
                ),
              ],
            );
          });
    } else {
      return const SizedBox();
    }
  }
}

class BubblePainter extends CustomPainter {
  BubblePainter(this.animation, this.bubbles) : super(repaint: animation);

  final Animation<double> animation;
  final List<Bubble> bubbles;

  @override
  void paint(Canvas canvas, Size size) {
    for (Bubble bubble in bubbles) {
      final offset = Offset(
        size.width / 2 + bubble.direction * animation.value,
        size.height * 1.7 * (1 - animation.value) -
            bubble.speed * animation.value +
            bubble.initialPosition * (1 - animation.value),
      );

      // final width = bubble.size * 2;
      // final height = bubble.size * 2;
      // Path path = Path();
      // path.moveTo(0.5 * width, height * 0.35);
      // path.cubicTo(0.2 * width, height * 0.1, -0.25 * width, height * 0.6,
      //     0.5 * width, height);
      // path.moveTo(0.5 * width, height * 0.35);
      // path.cubicTo(0.8 * width, height * 0.1, 1.25 * width, height * 0.6,
      //     0.5 * width, height);
      // Paint paint = Paint()..color = bubble.color;

      // canvas.drawPath(path, paint);
      canvas.drawCircle(
          offset, bubble.size * animation.value, Paint()..color = bubble.color);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegete) => false;
}
//!Like Effect=================================================
