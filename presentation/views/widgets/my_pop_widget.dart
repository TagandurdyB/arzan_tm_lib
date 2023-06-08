import 'package:arzan_tm/config/services/my_size.dart';
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

  static void popLoading(BuildContext context) {
    final arentir = MySize.arentir;
    MyPopUpp(
        width: arentir * 0.6,
        height: arentir * 0.4,
        borderRadius: 10,
        content: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const CircularProgressIndicator(),
              const SizedBox(height: 10),
              Text(
                "Garaşmagyňyzy haýyş edýeris!",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: arentir * 0.04),
              ),
            ],
          ),
        )).pop(context);
  }

  static void popMessage(
      BuildContext context, Function? onDo, String message, bool isError) {
    final arentir = MySize.arentir;
    MyPopUpp(
        width: arentir * 0.6,
        height: arentir * 0.4,
        borderRadius: 10,
        content: Column(
          children: [
            Icon(
              isError ? Icons.error_outline : Icons.check_circle_outlined,
              color: isError ? Colors.red : Colors.green,
              size: arentir * 0.15,
            ),
            const SizedBox(height: 10),
            Text(
              message,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: arentir * 0.04),
            ),
          ],
        )).pop(context);
    Future.delayed(const Duration(seconds: 3)).then((value) {
      Navigator.pop(context);
      Navigator.pop(context);
      // if (!isError) AcauntP.of(context, listen: false).changeScreen(0);
      if (!isError) {
        if (onDo != null) onDo();
      }
    });
  }

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
