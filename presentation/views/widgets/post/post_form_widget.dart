import 'package:arzan/domanin/entities/user_entity.dart';
import 'package:arzan/presentation/views/widgets/ReadyInput/ready_input_base.dart';
import 'package:arzan/presentation/views/widgets/shimmer_img.dart';

import '../../../../domanin/entities/discounts/discount_detal_entity.dart';
import '../../../providers/data/hive_provider.dart';
import '../../screens/discounts/screen_discout_detal.dart';
import '../my_pop_widget.dart';
import '/domanin/entities/discounts/discount_category_entity.dart';
import '/presentation/views/widgets/custom_dropdown.dart';

import '../../../providers/data/discount_data_provider.dart';
import '../../../providers/view/provider_view_post.dart';
import '/config/vars/formater.dart';

import '/config/services/my_size.dart';
import 'package:flutter/material.dart';

import '../../../../config/vars/constants.dart';
import '../ReadyInput/login_arzan_input.dart';
import '../check_group.dart';

String validateFunc(BuildContext context) {
  final providPostDo = PostP.of(context, listen: false);
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

  String validate = "";

  if (providPostDo.imgPaths.isEmpty) {
    validate = "Surat saýlaň";
  } else if (name == "") {
    validate = "Ad ýazyň";
  } else if (description == "") {
    validate = "Doly maglumat ýazyň";
  } else if (categoryId == 0) {
    validate = "Kategoriýa saýlaň";
  } else if (subCategoryId == 0) {
    validate = "Bölüm saýlaň";
  } else if (price == "0") {
    validate = "Baha ýazyň";
  } else if (!PostP.of(context, listen: false).isReaded) {
    validate = "Düzgünleri okaň";
  }

  return validate;
}

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

  bool isLight = true;

  late PostP providPost, providPostDo;

  late DiscountDataP providDD;

  ScrollController tagControl = ScrollController();

  final double arentir = MySize.arentir;
  @override
  Widget build(BuildContext context) {
    providPost = PostP.of(context);
    providPostDo = PostP.of(context, listen: false);
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
          prefix: SingleChildScrollView(
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
                            providPostDo.removeTag(index);
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                  color: const Color(0xff09C24E),
                                  borderRadius:
                                      BorderRadius.circular(arentir * 0.01)),
                              padding: EdgeInsets.symmetric(
                                  horizontal: arentir * 0.005),
                              margin: EdgeInsets.symmetric(
                                  horizontal: arentir * 0.01),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "#${providPost.tags[index]}",
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                  Icon(
                                    Icons.delete_forever_outlined,
                                    color: Colors.white,
                                    size: arentir * 0.04,
                                  )
                                ],
                              )),
                        ))),
          ),
          label: "Hash tag (#tag #tag2)",
          hidden: "Hash tag (#tag #tag2)",
          onChanged: (String value) {
            if (value[value.length - 1] == " ") {
              RIBase.getControl(Tags.rIPostHash).clear();
              providPostDo.addTag(value);
              setState(() {
                Future.delayed(const Duration(milliseconds: 100))
                    .then((value) => tagControl.animateTo(
                          tagControl.position.maxScrollExtent,
                          duration: const Duration(milliseconds: 100),
                          curve: Curves.fastOutSlowIn,
                        ));
              });
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
                RIBase.eraseDate(Tags.rIPostPhone);
                providPostDo.changePhone(val);
                // setState(() => isPhone = val);
              },
            ),
            Expanded(
              child: ArzanInputs(
                readOnly: !providPost.isPhone,
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
    isLight = Theme.of(context).brightness == Brightness.dark;
    return Column(
      children: [
        CustomDropDown(
          bgColor: isLight ? const Color(0xffF9FAFC) : Colors.transparent,
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
            providPostDo.changeCategory(category!.id);
            providPostDo.changeSubId(0);
          },
        ),
        const SizedBox(height: 16),
        Visibility(
          visible: subCategories.isNotEmpty,
          child: CustomDropDown(
            bgColor: isLight ? const Color(0xffF9FAFC) : Colors.transparent,
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
              providPostDo.changeSubId(sub!.id);
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
            providPostDo.changeIsDate(val);
            // setState(() => isDate = val);
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
        if (providPostDo.isDate) _calendar(isStart);
      },
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: isLight ? const Color(0xffF9FAFC) : Colors.transparent,
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
        providPostDo.changeStart(date!);
      } else {
        providPostDo.changeEnd(date!);
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
            // setState(() => isInfo = val);
            providPostDo.changeReader(val);
          },
        ),
        const Expanded(child: Text("Düzgünleri okadym")),
        GestureDetector(
          onTap: () {
            //Navigator.pushNamed(context, Rout.legalInfo);
            MyPopUpp.popLoading(context);
            final String validate = validateFunc(context);
            if (validate != "") {
              MyPopUpp.popMessage(context, null, validate, true);
            } else {
              Navigator.pop(context);
              final hiveDo = HiveP.of(context, listen: false);
              final price = RIBase.getText(Tags.rIPostPrice);
              final int priceInt = price.isEmpty ? 0 : int.parse(price);
              final discount = RIBase.getText(Tags.rIPostDiscount);
              final int discountInt =
                  discount.isEmpty ? 0 : int.parse(discount);

              final DiscountDetalEntity obj = DiscountDetalEntity(
                id: 0,
                user: UserEntity(
                    id: hiveDo.readInt(Tags.hiveId) ?? 0,
                    avatarImg: "",
                    name: "100haryt123",
                    role: Role.User),
                about: RIBase.getText(Tags.rIPostAbout),
                createdAt: DateTime.now(),
                endedAt: providPostDo.endDate ?? DateTime.now(),
                startedAt: providPostDo.startDate ?? DateTime.now(),
                oldPrice: price.isEmpty ? 0 : int.parse(price),
                newPrice: discount.isEmpty ? 0 : int.parse(discount),
                liked: 0,
                chated: 0,
                isOfficial: false,
                mod: Formater.modFinder(priceInt, discountInt),
                phone: RIBase.getText(Tags.rIPostPhone),
                pictures: providPostDo.imgPaths,
                tags: providPostDo.tags,
                title: RIBase.getText(Tags.rIPostName),
                viewed: 0,
                isEmpty: false,
              );
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DiscountDetalScreen(
                            type: ImageType.file,
                            obj: obj,
                          )));
            }
          },
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
