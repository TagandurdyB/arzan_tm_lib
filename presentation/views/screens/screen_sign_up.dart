// ignore_for_file: must_be_immutable

import 'package:arzan_tm/config/system_info/my_size.dart';
import 'package:arzan_tm/presentation/views/widgets/my_container.dart';
import 'package:flutter/material.dart';

import '../../../config/routes/my_route.dart';
import '../../../config/vars/constants.dart';
import '../pages/page_verification.dart';
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
      if (RIBase.getText(Tags.rISignCall).length < 5) {
        //return "Enter min 7 char at Name";
        return "";
      }
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
      if (pass != passAgain) {
        return "";
      }
    }
    return null;
  }

  void _loginFunc() {
    setState(() {
      isPressBefore = true;
      final bool isValidForm = formKey.currentState!.validate();
      if (isValidForm) {
        //Login post
        haveError = false;
        Navigator.pushNamed(context, Rout.signUpVerifi);
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
          Visibility(
            visible: _validatorUser() != null,
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
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
          Align(alignment: Alignment.centerLeft, child: buildRememberMe),
          const SizedBox(height: 20),
          RecovertNextBtn(text: "Agza bol", func: _loginFunc),
        ]),
      ),
    );
  }

  bool isRemember = true;
  Widget get buildRememberMe {
    return GestureDetector(
      onTap: _funcRememberMe,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          MyContainer(
            shape: MySize.arentir * 0.01,
            width: MySize.arentir * 0.05,
            height: MySize.arentir * 0.05,
            color: isRemember ? const Color(0xff0EC243) : Colors.transparent,
            borderWidth: 1,
            borderColor: isRemember ? Colors.green : Colors.grey,
            child: Visibility(
              visible: isRemember,
              child: Icon(
                Icons.check,
                color: Colors.white,
                size: MySize.arentir * 0.04,
              ),
            ),
          ),
          SizedBox(width: MySize.arentir * 0.02),
          Text("Düzgunnamany okadym we kabul etdim",
              style: TextStyle(
                  fontSize: MySize.arentir * 0.04,
                  decoration: TextDecoration.underline)),
        ],
      ),
    );
  }

  void _funcRememberMe() {
    setState(() {
      isRemember = !isRemember;
    });
  }
}
