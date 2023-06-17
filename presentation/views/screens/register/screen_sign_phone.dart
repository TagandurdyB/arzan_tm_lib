// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../../../../config/services/my_size.dart';
import '../../../../config/vars/constants.dart';
import '../../../providers/data/provider_acaunt.dart';
import '../../widgets/ReadyInput/login_arzan_input.dart';
import '../../widgets/ReadyInput/ready_input_base.dart';
import '../../widgets/form_error_message.dart';
import '../../widgets/my_container.dart';
import '../../widgets/next_btn.dart';

class SignPhoneScreen extends StatefulWidget {
  const SignPhoneScreen({super.key});

  @override
  State<SignPhoneScreen> createState() => _SignPhoneScreenState();
}

class _SignPhoneScreenState extends State<SignPhoneScreen> {
  final formKey = GlobalKey<FormState>();
  bool isPressBefore = false;
  bool openDrop = false;
  bool isCovenant = true;
  bool haveError = false;

  String? _validatorPhone() {
    if (isPressBefore) {
      final String phone = RIBase.getText(Tags.rISignPhone);
      if (phone.length < 8) {
        return "";
      } else if (phone == "") {
        return "";
      } else if (phone[0] != "6") {
        return "";
      }
    }
    return null;
  }

  void _nextFunc() async {
    setState(() {
      isPressBefore = true;
      final bool isValidForm = formKey.currentState!.validate();
      if (isValidForm) {
        //Sign phone
        AcauntP.of(context, listen: false).changeSign(1);
        haveError = false;
      } else {
        haveError = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Form(
        key: formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            //======================================================
            ArzanInputs(
              validator: (String? value) => _validatorPhone(),
              tag: Tags.rISignPhone,
              // iconD: Icons.phone,
              prefix: Container(
                  // color: Colors.red,
                  width: MySize.arentir * 0.23,
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.only(left: 8),
                  child: Row(
                    children: const [
                      Icon(Icons.phone),
                      Text(
                        " +993 |",
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  )),
              label: "Telefon belgisi",
              hidden: "   Telefon belgisi",
              type: TextInputType.phone,
            ),
            const SizedBox(height: 15),
            //===============================================================================
            Visibility(
              visible: _validatorPhone() != null,
              child: const Padding(
                padding: EdgeInsets.only(bottom: 20),
                child:
                    FormErrorMessage(visible: true, message: "Nädogry belgi!"),
              ),
            ),
            //===============================================================================
            Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(bottom: 10),
                child: const Text("Tassyklama görnüşi")),
            MyContainer(
              onTap: _dropDown,
              width: double.infinity,
              height: MySize.arentir * 0.12,
              borderWidth: 1,
              shape: MySize.arentir * 0.02,
              borderColor: const Color(0xffE5E5E5),
              color: Theme.of(context).canvasColor,
              padding: EdgeInsets.symmetric(horizontal: MySize.arentir * 0.02),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    selectedItem == 0
                        ? Words.vreification1
                        : Words.vreification2,
                    style: TextStyle(fontSize: MySize.arentir * 0.04),
                  ),
                  const Icon(Icons.keyboard_arrow_down)
                ],
              ),
            ),
            AnimatedCrossFade(
                firstChild: const SizedBox(width: double.infinity),
                secondChild: buildDropDown,
                crossFadeState: openDrop
                    ? CrossFadeState.showSecond
                    : CrossFadeState.showFirst,
                duration: const Duration(milliseconds: 300)),
            //===============================================================================
            const SizedBox(height: 20),
            Align(alignment: Alignment.center, child: buildRememberMe),
            const SizedBox(height: 20),
            buildIndicators(0),
            const SizedBox(height: 20),
            NextBtn(text: "Agza bol", func: _nextFunc),
          ],
        ),
      ),
    );
  }

  Widget buildIndicators(int pageIndex) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(3, (index) {
        final bool isSelect = index == pageIndex;
        return GestureDetector(
          onTap: () {
            AcauntP.of(context, listen: false).changeSign(index);
          },
          child: Container(
            margin: const EdgeInsets.all(2),
            decoration: BoxDecoration(
                color: isSelect
                    ? const Color(0xff00C52B)
                    : const Color(0xffA2D9AE),
                shape: isSelect ? BoxShape.rectangle : BoxShape.circle,
                borderRadius: isSelect ? BorderRadius.circular(8) : null),
            width: isSelect ? 25 : 10,
            height: 10,
          ),
        );
      }),
    );
  }

  Widget get buildRememberMe {
    return GestureDetector(
      onTap: _funcRememberMe,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildMyCheck(isCovenant),
          SizedBox(width: MySize.arentir * 0.02),
          Text("Düzgunnamany okadym we kabul etdim",
              style: TextStyle(
                  fontSize: MySize.arentir * 0.04,
                  decoration: TextDecoration.underline)),
        ],
      ),
    );
  }

  void _funcRememberMe() => setState(() => isCovenant = !isCovenant);

//==============================================

  void _dropDown() => setState(() => openDrop = !openDrop);

  Widget get buildDropDown {
    return Container(
      margin: const EdgeInsets.only(bottom: 4, left: 3, right: 3),
      width: double.infinity,
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
              offset: Offset(0, 2),
              blurRadius: 3,
              spreadRadius: 0,
              color: Color(0xffEAEAEA))
        ],
        color: Theme.of(context).canvasColor,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(MySize.arentir * 0.02),
          top: Radius.circular(MySize.arentir * 0.01),
        ),
      ),
      child: buildDropItems,
    );
  }

  Widget get buildDropItems {
    return Column(
      children: [
        // buildDropItem(selectedItem == 0, Words.vreification1, 0),
        buildDropItem(selectedItem == 1, Words.vreification2, 1),
      ],
    );
  }

  int selectedItem = 1;

  Widget buildDropItem(bool isCheck, String text, int index) {
    return InkWell(
      onTap: () => setState(() => selectedItem = index),
      child: Container(
        padding: EdgeInsets.all(MySize.arentir * 0.04),
        color: isCheck ? Colors.green.shade200 : Colors.transparent,
        child: Row(
          children: [
            buildMyCheck(isCheck),
            SizedBox(
              width: MySize.arentir * 0.04,
            ),
            Text(text)
          ],
        ),
      ),
    );
  }

  Widget buildMyCheck(bool isCheck) {
    return MyContainer(
      shape: MySize.arentir * 0.01,
      width: MySize.arentir * 0.05,
      height: MySize.arentir * 0.05,
      color: isCheck ? const Color(0xff0EC243) : Colors.transparent,
      borderWidth: 1,
      borderColor: isCheck ? Colors.green : Colors.grey,
      child: Visibility(
        visible: isCheck,
        child: Icon(
          Icons.check,
          color: Colors.white,
          size: MySize.arentir * 0.04,
        ),
      ),
    );
  }
}
