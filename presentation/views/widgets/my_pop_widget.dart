import 'package:flutter/material.dart';

import 'my_container.dart';

class ActionTeam {
  final Function? func;
  final String text;
  final bool canPop;
  final Widget? child;
  ActionTeam({
    this.func,
    this.child,
    this.text = "",
    this.canPop = true,
  });
}

class MyPopUpp {
  final double? width;
  final double? height;
  final double? borderRadius;
  Color? bgColor;
  final String? title;
  final bool centerTitle;
  final Widget? content;
  final List<ActionTeam>? actions;
  final EdgeInsetsGeometry? padding;
  final bool barrierDismissible;
  MyPopUpp({
    this.content,
    this.centerTitle = true,
    this.width,
    this.height,
    this.title,
    this.borderRadius,
    this.bgColor,
    this.actions,
    this.padding,
    this.barrierDismissible = false,
  });
  late BuildContext context;
  void pop(BuildContext context) => showDialog(
      barrierDismissible: barrierDismissible,
      context: context,
      builder: (context) {
        bgColor = bgColor ?? Theme.of(context).canvasColor;
        this.context = context;
        return Center(child: buildPop());
      });

  Widget buildPop() => Material(
        type: MaterialType.transparency,
        child: MyContainer(
            shape: borderRadius ?? 0,
            width: width,
            height: height,
            color: bgColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Visibility(
                  visible: title != null,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      title != null ? title! : "",
                      textAlign:
                          centerTitle ? TextAlign.center : TextAlign.start,
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                Padding(
                  padding: padding ?? const EdgeInsets.all(8),
                  child: content ?? const SizedBox(),
                ),
                PopBtns(actions: actions),
              ],
            )),
      );
}

// ignore: must_be_immutable
class PopBtns extends StatelessWidget {
  final List<ActionTeam>? actions;
  final bool isPopEnable;
  PopBtns({super.key, this.actions, this.isPopEnable = true});
  late BuildContext context;
  @override
  Widget build(BuildContext context) {
    this.context = context;
    return buildBtns();
  }

  Widget buildBtns() => actions == null || actions!.isEmpty
      ? const SizedBox()
      : Row(
          children: List.generate(actions!.length,
              (index) => Expanded(child: buildBtn(actions![index]))));

  Widget buildBtn(ActionTeam obj) {
    if (obj.child != null) {
      return GestureDetector(onTap: () => _tabFunc(obj), child: obj.child!);
    } else if (obj.text != "") {
      return MaterialButton(
          onPressed: () => _tabFunc(obj),
          child: Text(
            obj.text,
            style: const TextStyle(),
          ));
    } else {
      return const SizedBox();
    }
  }

  void _tabFunc(ActionTeam obj) {
    if (obj.func != null) {
      obj.func!();
    }
    if (isPopEnable && obj.canPop) {
      Navigator.pop(context);
    }
  }
}
