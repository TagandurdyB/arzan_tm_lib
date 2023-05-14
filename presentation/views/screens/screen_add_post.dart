// ignore_for_file: must_be_immutable

import 'package:arzan_tm/config/services/my_size.dart';
import 'package:arzan_tm/presentation/views/widgets/my_pop_widget.dart';
import 'package:arzan_tm/presentation/views/widgets/next_btn.dart';
import 'package:arzan_tm/presentation/views/widgets/post/images_picker_widget.dart';
import 'package:flutter/material.dart';

import '../../providers/view/provider_view_post.dart';
import '../scaffold/custom_app_bar.dart';
import '../widgets/post/post_form_widget.dart';

class AddPostScreen extends StatelessWidget {
  AddPostScreen({super.key});

  final double arentir = MySize.arentir;
  late BuildContext context;
  late PostP providPost;
  late PostP providPostDo;
  @override
  Widget build(BuildContext context) {
    this.context = context;
    providPost = PostP.of(context);
    providPostDo = PostP.of(context, listen: false);
    return Column(children: [
      CustomAppBar(
        leading: const SizedBox(),
        title: "Post goşmak",
        style: TextStyle(fontSize: arentir * 0.06, fontWeight: FontWeight.bold),
      ),
      Expanded(
          child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        physics: const BouncingScrollPhysics(),
        child: buildContent,
      ))
    ]);
  }

  Widget get buildContent {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ImagesPickerWidget(),
        const SizedBox(height: 20),
        const PostFormWidget(),
        const SizedBox(height: 20),
        NextBtn(func: _addFunc, text: "Goşmak"),
      ],
    );
  }

  void _addFunc() {
    MyPopUpp(
        borderRadius: arentir * 0.04,
        width: arentir * 0.5,
        height: arentir * 0.4,
        content: Column(
          children: [
            const CircularProgressIndicator(
              color: Color(0xff0EC243),
            ),
            const SizedBox(height: 10),
            Text("Az wagt garaşmagyňyzy haýyş edýäris!",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: arentir * 0.04)),
          ],
        )).pop(context);
  }
}
