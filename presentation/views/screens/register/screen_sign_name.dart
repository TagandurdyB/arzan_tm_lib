// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../../../../config/vars/constants.dart';
import '../../../providers/data/provider_acaunt.dart';
import '../../widgets/ReadyInput/login_arzan_input.dart';
import '../../widgets/ReadyInput/ready_input_base.dart';
import '../../widgets/form_error_message.dart';
import '../../widgets/next_btn.dart';

class SignNameScreen extends StatefulWidget {
  const SignNameScreen({super.key});

  @override
  State<SignNameScreen> createState() => _SignNameScreenState();
}

class _SignNameScreenState extends State<SignNameScreen> {
  final formKey = GlobalKey<FormState>();

  bool isPressBefore = false;

  bool openDrop = false;

  bool isCovenant = true;

  bool haveError = false;

  String? _validatorUser() {
    if (isPressBefore) {
      if (RIBase.getText(Tags.rISignUser).length < 8) {
        //return "Enter min 7 char at Name";
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
        //Sign name
        print("salma 1");
        AcauntP.of(context, listen: false).changeSign(2);
        print("salma 2");

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
        child: Column(children: [
          //===============================================================================
          ArzanInputs(
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
                  visible: true,
                  message: "Adyňyz azyndan 8 simboldan ybarat bolmaly!"),
            ),
          ),
          //===============================================================================
          buildIndicators(1),
          const SizedBox(height: 20),

          NextBtn(text: "Agza bol", func: _nextFunc),
        ]),
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
}
