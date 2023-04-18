// ignore_for_file: must_be_immutable

import 'package:arzan_tm/config/system_info/my_size.dart';
import 'package:arzan_tm/presentation/views/widgets/my_container.dart';
import 'package:flutter/material.dart';

import '../../../config/routes/my_route.dart';
import '../../../config/vars/constants.dart';
import '../widgets/ReadyInput/login_arzan_input.dart';
import '../widgets/ReadyInput/ready_input_base.dart';
import '../widgets/form_error_message.dart';
import '../widgets/recovery_next_btn.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isPassShow = false;
  bool isPressBefore = false;
  bool haveError = false;

  @override
  late BuildContext context;
  final formKey = GlobalKey<FormState>();

  String? _haveAnyValid() {
    if (isPressBefore) {
      // if (RIBase.getText(Tags.rISignCall).length < 5) {
      //   //return "Enter min 7 char at Name";
      //   return "";
      // }
    }
    return null;
  }

  String? _validatorUser() {
    if (isPressBefore) {
      if (RIBase.getText(Tags.rISignUser).length < 5) {
        //return "Enter min 7 char at Name";
        return "";
      }
    }
    return null;
  }

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

  String? _validatorPass() {
    if (isPressBefore) {
      final String pass = RIBase.getText(Tags.rISignPass);
      final String passAgain = RIBase.getText(Tags.rISignPassAgain);
      if (pass != passAgain || pass == "") {
        return "";
      }
    }
    return null;
  }

  bool openDrop = false;
  void _dropDown() {
    setState(() {
      openDrop = !openDrop;
    });
  }

  void _loginFunc() {
    setState(() {
      isPressBefore = true;
      final bool isValidForm = formKey.currentState!.validate();
      if (isValidForm) {
        //Login post
        haveError = false;
        String route = "";
        if (selectedItem == 0) {
          route = Rout.signUpVerifi;
        } else {
          route = Rout.sendSMS;
        }
        Navigator.pushNamed(context, route);
      } else {
        haveError = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Form(
        key: formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(children: [
          //===============================================================================
          LoginArzanInputs(
            validator: (String? value) => _haveAnyValid(),
            tag: Tags.rISignCall,
            iconD: Icons.assignment_ind_sharp,
            label: "Çagyranyň linki, QR-kody ýa-da nomeri",
            hidden: "Çagyranyň linki, QR-kody ýa-da nomeri",
          ),
          const SizedBox(height: 20),
          //===============================================================================
          LoginArzanInputs(
            validator: (String? value) => _validatorUser(),
            tag: Tags.rISignUser,
            iconD: Icons.assignment_ind_outlined,
            label: "Ulanyjy ady",
            hidden: "Ulanyjy ady",
          ),
          const SizedBox(height: 20),
          Visibility(
            visible: _validatorUser() != null,
            child: const Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: FormErrorMessage(
                  visible: true, message: "Bul at eýýäm bar. Başga at goýuň!"),
            ),
          ),
          //===============================================================================
          LoginArzanInputs(
            validator: (String? value) => _validatorPhone(),
            tag: Tags.rISignPhone,
            // iconD: Icons.phone,
            prefix: Container(
                // color: Colors.red,
                width: MySize.arentir * 0.23,
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.all(8),
                child: Row(
                  children: [
                    const Icon(Icons.phone),
                    Text(
                      " +993 |",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: MySize.arentir * 0.04,
                      ),
                    ),
                  ],
                )),
            label: "Telefon belgisi",
            hidden: "Telefon belgisi",
            type: TextInputType.phone,
          ),
          const SizedBox(height: 20),
          Visibility(
            visible: _validatorPhone() != null,
            child: const Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: FormErrorMessage(visible: true, message: "Nädogry belgi!"),
            ),
          ),
          //===============================================================================
          LoginArzanInputs(
            validator: (String? value) => _validatorPass(),
            tag: Tags.rISignPass,
            iconD: Icons.vpn_key_outlined,
            label: "Açar sözi",
            hidden: "Açar sözi",
            type: TextInputType.visiblePassword,
          ),
          const SizedBox(height: 20),
          //===============================================================================
          LoginArzanInputs(
            validator: (String? value) => _validatorPass(),
            tag: Tags.rISignPassAgain,
            iconD: Icons.vpn_key_outlined,
            label: "Açar sözi (tassykla)",
            hidden: "Açar sözi (tassykla)",
            type: TextInputType.visiblePassword,
          ),
          const SizedBox(height: 20),
          //===============================================================================
          FormErrorMessage(
              visible: _validatorPass() != null,
              message: "Açar sözleri gabat gelenok!"),
          const SizedBox(height: 20),
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
            color: const Color(0xffF9FAFC),
            padding: EdgeInsets.symmetric(horizontal: MySize.arentir * 0.02),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  selectedItem == 0 ? Words.vreification1 : Words.vreification2,
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
          Align(alignment: Alignment.centerLeft, child: buildRememberMe),
          const SizedBox(height: 20),
          RecovertNextBtn(text: "Agza bol", func: _loginFunc),
        ]),
      ),
    );
  }

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
        color: Colors.white,
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
        buildDropItem(selectedItem == 0, Words.vreification1, 0),
        buildDropItem(selectedItem == 1, Words.vreification2, 1),
      ],
    );
  }

  int selectedItem = 0;
  Widget buildDropItem(bool isCheck, String text, int index) {
    return InkWell(
      onTap: () => setState(() => selectedItem = index),
      child: Container(
        padding: EdgeInsets.all(MySize.arentir * 0.04),
        color: isCheck ? const Color(0xffF3FBF4) : Colors.transparent,
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

  bool isCovenant = true;
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

  void _funcRememberMe() {
    setState(() {
      isCovenant = !isCovenant;
    });
  }
}
