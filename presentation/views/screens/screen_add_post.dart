// ignore_for_file: must_be_immutable

import '../../../domanin/entities/discounts/post_discount_entity.dart';
import '../../providers/data/discount_data_provider.dart';
import '/presentation/views/widgets/ReadyInput/ready_input_base.dart';

import '../../../config/vars/constants.dart';

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
              final List<String> images = providPostDo.imgPaths;
              final String name = RIBase.getText(Tags.rIPostName);
              final String description = RIBase.getText(Tags.rIPostAbout);
              final List<String> tags = providPostDo.tags;
              final String phone = "+993${RIBase.getText(Tags.rIPostPhone)}";
              final String price = RIBase.getText(Tags.rIPostPrice).isEmpty
                  ? "0"
                  : RIBase.getText(Tags.rIPostPrice);
              final String discont = RIBase.getText(Tags.rIPostDiscount).isEmpty
                  ? "0"
                  : RIBase.getText(Tags.rIPostDiscount);
              final DateTime? start = providPostDo.startDate;
              final DateTime? end = providPostDo.endDate;
              final int categoryId = providPostDo.categoryId;
              final int subCategoryId = providPostDo.subCategoryId;

              final list = [
                images,
                RIBase.getText(Tags.rIPostName),
                description,
                tags,
                phone,
                price,
                discont,
                start,
                end,
                categoryId,
                subCategoryId
              ];
              print("PostDiscountEntity:=$list");
              MyPopUpp.popLoading(context);
              final String validate = validateFunc(context);
              if (validate != "") {
                MyPopUpp.popMessage(context, null, validate, true);
              } else {
                DiscountDataP.of(context, listen: false)
                    .addPost(PostDiscountEntity(
                      images: images,
                      name: name,
                      description: description,
                      hashtags: tags,
                      phone: phone,
                      price: int.parse(price),
                      oldPrice: int.parse(discont),
                      statedAt: start,
                      endedAt: end,
                      categoryId: categoryId,
                      subCategoryId: subCategoryId,
                    ))
                    .then((entity) => MyPopUpp.popMessage(
                        context, null, entity.result, !entity.status));
              }
            },
            text: "Goşmak"),
      ],
    );
  }
}
