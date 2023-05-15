import '/config/services/my_size.dart';
import 'package:flutter/material.dart';

class ZoomPage extends StatefulWidget {
  final String image;
  const ZoomPage({required this.image, super.key});

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
      controller.value=animation!.value;
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    animControl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(alignment: Alignment.center, children: [
        Container(
            width: double.infinity,
            alignment: Alignment.center,
            child: buildViewer),
        const Positioned(
          top: 10,
          left: 10,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20.0),
            child: BackButton(color: Colors.white),
          ),
        ),
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
              child: Image.network(widget.image, fit: BoxFit.fitWidth)),
        ),
      );
}
