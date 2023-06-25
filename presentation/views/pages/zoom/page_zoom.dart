import '../../scaffold/no_app_bar_scaffold.dart';
import '../../widgets/btns_group.dart';
import '../../widgets/shimmer_img.dart';
import '/presentation/views/scaffold/custom_app_bar.dart';

import '/config/services/my_size.dart';
import 'package:flutter/material.dart';

class ZoomPage extends StatefulWidget {
  final String image;
  final ImageType type;
  final int count, index;
  final int? liked;
  const ZoomPage(
      {required this.image,
      required this.count,
      this.type = ImageType.network,
      required this.index,
      this.liked,
      super.key});

  @override
  State<ZoomPage> createState() => _ZoomPageState();
}

class _ZoomPageState extends State<ZoomPage>
    with SingleTickerProviderStateMixin {
  late TransformationController controller;
  TapDownDetails? tapDownDeteil;

  late AnimationController animControl;
  Animation<Matrix4>? animation;

  @override
  void initState() {
    controller = TransformationController();
    animControl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    )..addListener(() {
        controller.value = animation!.value;
      });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    animControl.dispose();
    super.dispose();
  }

  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    return ScaffoldNo(
      bgColor: Colors.black,
      body: Stack(alignment: Alignment.topCenter, children: [
        Container(
            width: double.infinity,
            alignment: Alignment.center,
            child: buildViewer),
        CustomAppBar(
          bgColor: Colors.transparent,
          color: Colors.white,
          title: "",
          actions: [
            Text(
              "${widget.index}/${widget.count}",
              style: const TextStyle(color: Colors.white),
            )
          ],
        ),
        Positioned(
          bottom: MySize.arentir*0.15,
          right: 30,
          child: Visibility(
            visible: widget.liked != null,
            child: LikeBtn(
              onTap: (bool val) {},
              textSize: MySize.arentir*0.06,
              iconSize: MySize.arentir*0.07,
              likeCount: widget.liked ?? 0,
            ),
          ),
        )
      ]),
    );
  }

  Widget get buildViewer => GestureDetector(
        onDoubleTapDown: (details) => tapDownDeteil = details,
        onDoubleTap: () {
          final position = tapDownDeteil!.localPosition;
          const double scale = 3;
          final x = -position.dx * (scale - 1);
          final y = -position.dy * (scale - 1);
          final zoomed = Matrix4.identity()
            ..translate(x, y)
            ..scale(scale);

          // final value=
          // controller.value.isIdentity()? zoomed:Matrix4.identity();
          // controller.value = value;

          final end =
              controller.value.isIdentity() ? zoomed : Matrix4.identity();

          animation = Matrix4Tween(
            begin: controller.value,
            end: end,
          ).animate(CurveTween(curve: Curves.easeOut).animate(animControl));

          animControl.forward(from: 0);
        },
        child: InteractiveViewer(
          // clipBehavior: Clip.none,
          // panEnabled: false,
          maxScale: 4,
          minScale: 1,
          transformationController: controller,
          // scaleEnabled: false,
          child: SizedBox(
            height: double.infinity,
            width: MySize.width,
            child: ShimmerImg(
                imageUrl: widget.image,
                type: widget.type,
                fit: BoxFit.fitWidth),
            //child: Image.network(widget.image, fit: BoxFit.fitWidth)
          ),
        ),
      );
}
