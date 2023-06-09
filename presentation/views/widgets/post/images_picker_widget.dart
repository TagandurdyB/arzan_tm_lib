// ignore_for_file: must_be_immutable

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../../../../config/services/img_picker_service.dart';
import '../../../../config/services/my_size.dart';
import '../../../providers/view/provider_view_post.dart';

class ImagesPickerWidget extends StatelessWidget {
  ImagesPickerWidget({super.key});

  final double arentir = MySize.arentir;
  late BuildContext context;
  late PostP providPost;
  late PostP providPostDo;
  @override
  Widget build(BuildContext context) {
    this.context = context;
    providPost = PostP.of(context);
    providPostDo = PostP.of(context, listen: false);
    return Wrap(
      alignment: WrapAlignment.start,
      spacing: arentir * 0.05,
      runSpacing: arentir * 0.05,
      children: List.generate(
        providPost.imgPaths.length + 1,
        (index) {
          if (providPostDo.imgsLength != index) {
            return buildAddedImgCard(index);
          }
          return buildPickImgCard();
        },
      ),
    );
  }

  Widget buildPickImgCard() {
    return Visibility(
      visible: providPost.imgPaths.length<8,
      child: GestureDetector(
        onTap: () async => await ImgPicker.pick(context),
        child: DottedBorder(
          padding: const EdgeInsets.all(0),
          borderType: BorderType.RRect,
          radius: const Radius.circular(10),
          dashPattern: const [10, 10],
          color: Colors.grey,
          strokeWidth: 2,
          child: Container(
            width: arentir * 0.19,
            clipBehavior: Clip.hardEdge,
            padding: EdgeInsets.symmetric(
                vertical: arentir * 0.05, horizontal: arentir * 0.03),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children:  [
                const Icon(
                  Icons.add_photo_alternate_outlined,
                  color: Color(0xff0EC243),
                ),
                Text(
                  "Surat goş",
                  style: TextStyle(
                    fontSize: arentir*0.03,
                    color: const Color(0xff0EC243)),
                  maxLines: 2,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildAddedImgCard(int index) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Stack(
        alignment: Alignment.bottomRight,
        // mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: arentir * 0.19,
            height: arentir * 0.19,
            child: Image.file(providPost.imgFileAt(index)),
          ),
          GestureDetector(
            onTap: () => providPostDo.deleteImgPath(index),
            child: Container(
              decoration: const BoxDecoration(
                  color: Color(0xffE50027),
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(5))),
              padding: const EdgeInsets.all(6),
              child: Icon(
                Icons.delete_forever_outlined,
                color: Colors.white,
                size: arentir * 0.07,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
