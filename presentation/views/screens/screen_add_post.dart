// ignore_for_file: must_be_immutable

import 'package:arzan_tm/presentation/views/widgets/ReadyInput/ready_input_base.dart';

import '../../../config/vars/constants.dart';
import '../../providers/data/hive_provider.dart';
import '/domanin/entities/discounts/post_discount_entity.dart';

import '../../providers/data/discount_data_provider.dart';
import '/config/services/my_size.dart';
import '/presentation/views/widgets/my_pop_widget.dart';
import '/presentation/views/widgets/next_btn.dart';
import '/presentation/views/widgets/post/images_picker_widget.dart';
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
        NextBtn(
            func: () {
              _loadPop();
              DiscountDataP.of(context, listen: false)
                  .addPost(PostDiscountEntity(
                    images: providPostDo.imgPaths,
                    name: RIBase.getText(Tags.rIPostName),
                    description: RIBase.getText(Tags.rIPostAbout),
                    hashtags: RIBase.getText(Tags.rIPostHash),
                    phone: RIBase.getText(Tags.rIPostPhone),
                    price: int.parse(RIBase.getText(Tags.rIPostPrice)),
                    oldPrice: int.parse(RIBase.getText(Tags.rIPostDiscount)),
                    statedAt: providPostDo.startDate!,
                    endedAt: providPostDo.endDate!,
                    welayat: HiveP.of(context, listen: false)
                        .readStr(Tags.hiveWelayat)!,
                    categoryId: 1,
                    subCategoryId: 1,
                  ))
                  .then(
                      (entity) => _popMessage(entity.message, entity.succsess));
            },
            text: "Goşmak"),
      ],
    );
  }

  void _loadPop() {
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

  void _popMessage(String message, bool isError) {
    MyPopUpp(
        width: arentir * 0.5,
        height: arentir * 0.4,
        borderRadius: arentir * 0.04,
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
    });
  }
}
