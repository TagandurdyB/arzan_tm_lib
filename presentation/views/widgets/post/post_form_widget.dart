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

  final double arentir = MySize.arentir;
  @override
  Widget build(BuildContext context) {
    providPost = PostP.of(context);
    providPostdo = PostP.of(context, listen: false);
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
        const ArzanInputs(
          tag: Tags.rIPostHash,
          padding: EdgeInsets.symmetric(horizontal: 10),
          prefix: SizedBox(),
          label: "Hash tag (#tag #tag2)",
          hidden: "Hash tag (#tag #tag2)",
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
        Expanded(
          child: ArzanInputs(
            readOnly: !isPrice,
            tag: Tags.rIPostPrice,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            prefix: const SizedBox(),
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
      onTap: () => _calendar(isStart),
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
