import 'package:arzan/presentation/views/widgets/ReadyInput/ready_input_base.dart';

import '/domanin/entities/discounts/discount_category_entity.dart';
import '/presentation/views/widgets/custom_dropdown.dart';

import '../../../providers/data/discount_data_provider.dart';
import '../../../providers/view/provider_view_post.dart';
import '/config/vars/formater.dart';

import '/config/services/my_size.dart';
import 'package:flutter/material.dart';

import '../../../../config/routes/my_route.dart';
import '../../../../config/vars/constants.dart';
import '../ReadyInput/login_arzan_input.dart';
import '../check_group.dart';

class PostFormWidget extends StatefulWidget {
  const PostFormWidget({super.key});

  @override
  State<PostFormWidget> createState() => _PostFormWidgetState();
}

class _PostFormWidgetState extends State<PostFormWidget> {
  bool isPhone = true;
  bool isPrice = false;
  bool isDate = false;
  bool isInfo = false;

  late PostP providPost;
  late PostP providPostdo;

  late DiscountDataP providDD;

  ScrollController tagControl = ScrollController();

  final double arentir = MySize.arentir;
  @override
  Widget build(BuildContext context) {
    providPost = PostP.of(context);
    providPostdo = PostP.of(context, listen: false);
    providDD = DiscountDataP.of(context);
    return Column(
      children: [
        const ArzanInputs(
          tag: Tags.rIPostName,
          padding: EdgeInsets.symmetric(horizontal: 10),
          prefix: SizedBox(),
          label: "Post ady",
          hidden: "Post ady",
        ),
        const ArzanInputs(
          tag: Tags.rIPostAbout,
          maxLines: 6,
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          prefix: SizedBox(),
          label: "Doly maglumaty",
          hidden: "Doly maglumaty",
        ),
        buildSections,
        ArzanInputs(
          tag: Tags.rIPostHash,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          prefix: Container(
            // color: Colors.red,
            // margin: EdgeInsets.only(right: arentir*0.1),sdfshjhhh
            // width: arentir * 0.7,
            child: SingleChildScrollView(
              // controller: ,
              controller: tagControl,
              scrollDirection: Axis.horizontal,
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  // mainAxisSize: MainAxisSize.min,
                  children: List.generate(
                      providPost.tags.length,
                      (index) => GestureDetector(
                            onTap: () {
                              providPostdo.removeTag(index);
                            },
                            child: Container(
                                decoration: BoxDecoration(
                                    color: const Color(0xff09C24E),
                                    borderRadius:
                                        BorderRadius.circular(arentir * 0.01)),
                                padding: EdgeInsets.all(arentir * 0.005),
                                margin: EdgeInsets.symmetric(
                                    horizontal: arentir * 0.01),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      "#${providPost.tags[index]}",
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                    //  IcoASDn(Icons.delete_forever_outlined, color: Colors.white , size: arentir*0.04,)
                                  ],
                                )),
                          ))
                  // tags
                  //     .map((e) => GestureDetector(
                  //       onTap: (){
                  //         setState(() {
                  //           tags.removeAt(value)
                  //         });
                  //       },
                  //       child: Container(
                  //           decoration: BoxDecoration(
                  //               color: const Color(0xff09C24E),
                  //               borderRadius:
                  //                   BorderRadius.circular(arentir * 0.01)),
                  //           padding: EdgeInsets.all(arentir * 0.005),
                  //           margin:
                  //               EdgeInsets.symmetric(horizontal: arentir * 0.01),
                  //           child: Text(
                  //             e,
                  //             style: const TextStyle(color: Colors.white),
                  //           )),
                  //     ))
                  //     .toList(),
                  ),
            ),
          ),
          label: "Hash tag (#tag #tag2)",
          hidden: "Hash tag (#tag #tag2)",
          onChanged: (String value) {
            if (value[value.length - 1] == " ") {
              RIBase.getControl(Tags.rIPostHash).clear();
              providPostdo.addTag(value);
              setState(() {
                Future.delayed(const Duration(milliseconds: 100))
                    .then((value) => tagControl.animateTo(
                          tagControl.position.maxScrollExtent,
                          duration: const Duration(milliseconds: 100),
                          curve: Curves.fastOutSlowIn,
                        ));
              });
              print("space");
            }
          },
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            CustomCheck(
              startVal: true,
              padding: const EdgeInsets.only(bottom: 15),
              onChange: (bool val) {
                setState(() => isPhone = val);
              },
            ),
            Expanded(
              child: ArzanInputs(
                readOnly: !isPhone,
                tag: Tags.rIPostPhone,
                maxLength: 8,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                prefix: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 3),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(Icons.phone),
                      Text(
                        "+993",
                        style: TextStyle(color: Color(0xffAAAAAA)),
                      )
                    ],
                  ),
                ),
                type: TextInputType.phone,
                label: "Telefon belgi",
                hidden: "Telefon belgi",
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        buildPrice,
        const SizedBox(height: 20),
        buildDates,
        const SizedBox(height: 20),
        buildLegalInformation,
      ],
    );
  }

  // List<DiscountCategoryEntity> objc = [];
  DiscountCategoryEntity? category;
  DiscountSubcategoryEntity? sub;

  List<Widget> subCategories = [];

  Widget categoryVal =
      CategoryText("Kategoriýa saýlaň", color: const Color(0xffAAAAAA));
  Widget subcategVal =
      CategoryText("Bölüm saýlaň", color: const Color(0xffAAAAAA));

  Widget get buildSections {
    // objc = [];
    // // ignore: avoid_function_literals_in_foreach_calls
    // providDD.categories.forEach((cetegory) async {
    //   objc.add(await cetegory);
    // });

    final categories = providDD.categories
        .map((cetegory) => buildCategories(cetegory))
        .toList();

    return Column(
      children: [
        CustomDropDown(
          isShadow: false,
          padding: 0,
          height: arentir * 0.1,
          mainValue: categoryVal,
          items: categories,
          onChange: (index) {
            setState(() {
              category =
                  DiscountDataP.of(context, listen: false).categories[index];
              categoryVal = buildCategories(category!);
              subcategVal =
                  CategoryText("Bölüm saýlaň", color: const Color(0xffAAAAAA));
              subCategories =
                  category!.subs.map((e) => CategoryText(e.name)).toList();
            });
            providPostdo.changeCategory(category!.id);
          },
        ),
        const SizedBox(height: 16),
        Visibility(
          visible: subCategories.isNotEmpty,
          child: CustomDropDown(
            isShadow: false,
            padding: 0,
            height: arentir * 0.1,
            mainValue: subcategVal,
            items: subCategories,
            onChange: (index) {
              setState(() {
                sub = category!.subs[index];
                subcategVal = subCategories[index];
              });
              providPostdo.changeSubId(sub!.id);
            },
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget buildCategories(DiscountCategoryEntity obj) {
    return CategoryText(obj.name);
  }

  Widget get buildPrice {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        CustomCheck(
          padding: const EdgeInsets.only(bottom: 15),
          onChange: (bool val) {
            setState(() => isPrice = val);
          },
        ),
        const Expanded(
          child: ArzanInputs(
            // readOnly: !isPrice,
            tag: Tags.rIPostPrice,
            padding: EdgeInsets.symmetric(horizontal: 10),
            prefix: SizedBox(),
            type: TextInputType.number,
            label: "Baha",
            hidden: "Baha",
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: ArzanInputs(
            readOnly: !isPrice,
            tag: Tags.rIPostDiscount,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            prefix: const SizedBox(),
            type: TextInputType.number,
            label: "Arzanladyş",
            hidden: "Arzanladyş",
          ),
        ),
      ],
    );
  }

  Widget get buildDates {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        CustomCheck(
          padding: const EdgeInsets.only(bottom: 6),
          onChange: (bool val) {
            setState(() => isDate = val);
          },
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Mahabat döwri"),
            const SizedBox(height: 5),
            buildDate(true),
          ],
        ),
        const SizedBox(width: 10),
        Expanded(child: buildDate(false)),
      ],
    );
  }

  Widget buildDate(bool isStart) {
    return GestureDetector(
      onTap: () {
        if (isDate) _calendar(isStart);
      },
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: const Color(0xffF9FAFC),
            border: Border.all(color: const Color(0xffE5E5E5), width: 1),
            borderRadius: BorderRadius.circular(10)),
        height: arentir * 0.1,
        width: arentir * 0.415,
        child: Text(
          isStart
              ? providPost.startDate != null
                  ? Formater.calendar(providPost.startDate!)
                  : "gg.aa.ýýýý"
              : providPost.endDate != null
                  ? Formater.calendar(providPost.endDate!)
                  : "gg.aa.ýýýý",
          style: TextStyle(
              color: const Color(0xffAAAAAA), fontSize: arentir * 0.04),
        ),
      ),
    );
  }

  void _calendar(bool isStart) {
    showDatePicker(
      context: context,
      firstDate: DateTime(1950),
      initialDate: isStart
          ? providPost.startDate ?? DateTime.now()
          : providPost.endDate ?? DateTime.now().add(const Duration(days: 1)),
      lastDate: DateTime(2100),
      initialEntryMode: DatePickerEntryMode.calendarOnly,
    ).then((date) {
      if (isStart) {
        providPostdo.changeStart(date!);
      } else {
        providPostdo.changeEnd(date!);
      }
    });
  }

  Widget get buildLegalInformation {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomCheck(
          // padding: const EdgeInsets.only(bottom: 15),
          onChange: (bool val) {
            setState(() => isInfo = val);
          },
        ),
        const Expanded(child: Text("Düzgünleri okadym")),
        GestureDetector(
          onTap: () => Navigator.pushNamed(context, Rout.legalInfo),
          child: Row(children: const [
            Icon(Icons.remove_red_eye_outlined, color: Color(0xff0EC243)),
            SizedBox(width: 8),
            Text("Öňünden syn", style: TextStyle(color: Color(0xff0EC243)))
          ]),
        )
      ],
    );
  }
}

class CategoryText extends StatelessWidget {
  CategoryText(
    this.name, {
    this.color,
    super.key,
  });
  final String name;
  final Color? color;

  final double arentir = MySize.arentir;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: arentir * 0.01),
        color: Colors.transparent,
        alignment: Alignment.centerLeft,
        child: Text(
          name,
          style: TextStyle(color: color, fontSize: arentir * 0.035),
        ));
  }
}
