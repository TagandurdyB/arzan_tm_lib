// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../../../../config/routes/my_route.dart';
import '../../../../config/vars/constants.dart';
import '../../../../config/vars/formater.dart';
import '../../../../domanin/entities/register/sign_up_entity.dart';
import '../../../providers/data/provider_acaunt.dart';
import '../../widgets/ReadyInput/login_arzan_input.dart';
import '../../widgets/ReadyInput/ready_input_base.dart';
import '../../widgets/form_error_message.dart';
import '../../widgets/my_pop_widget.dart';
import '../../widgets/next_btn.dart';

class SignPassScreen extends StatefulWidget {
  const SignPassScreen({super.key});

  @override
  State<SignPassScreen> createState() => _SignPassScreenState();
}

class _SignPassScreenState extends State<SignPassScreen> {
  final formKey = GlobalKey<FormState>();

  bool isPressBefore = false;

  bool openDrop = false;

  bool isCovenant = true;

  bool haveError = false;

  String validationMessage = "";

  String? _validatorPass() {
    if (isPressBefore) {
      final String pass = RIBase.getText(Tags.rISignPass);
      final String passAgain = RIBase.getText(Tags.rISignPassAgain);
      if (pass != passAgain) {
        validationMessage = "Açar sözi gabat gelenok!";
        return "";
      } else if (pass == "") {
        validationMessage = "Açar sözi giriziň!";
        return "";
      } else if (pass.length < 8) {
        validationMessage = "Açar sözi 8 simboldan kiçi bolmaly däl!";
        return "";
      } else if (!Formater.hasLower(pass)) {
        validationMessage = "Açar sözünde azyndan 1 setir harp bolmaly!";
        return "";
      } else if (!Formater.hasUpper(pass)) {
        validationMessage = "Açar sözünde azyndan 1 baş harp bolmaly!";
        return "";
      } else if (!Formater.hasNum(pass)) {
        validationMessage = "Açar sözünde azyndan 1 san bolmaly!";
        return "";
      } else if (!Formater.hasSimbol(pass)) {
        validationMessage = "Açar sözünde azyndan 1 simbol bolmaly!";
        return "";
      }
    }
    return null;
  }

  void _signFunc() async {
    setState(() {
      isPressBefore = true;
      final bool isValidForm = formKey.currentState!.validate();
      if (isValidForm) {
        //Sign phone
        MyPopUpp.popLoading(context);
        AcauntP.of(context, listen: false)
            .signUp(SignUpEntity(
          inviterLink: RIBase.getText(Tags.rISignCall),
          userName: RIBase.getText(Tags.rISignUser),
          userPassword: RIBase.getText(Tags.rISignPass),
          userPhone: RIBase.getText(Tags.rISignPhone),
        ))
            .then((response) {
          final bool status = response.status;
          // if (!status) AcauntP.of(context, listen: false).changeScreen(0);
          MyPopUpp.popMessage(context, () {
            if (status) {
              Navigator.pushNamed(context, Rout.sendSMS);
            } else {
              AcauntP.of(context, listen: false).changeSign(0);
            }
          }, !status ? "Bu hasap öň bar!" : "Hasaba alynmak üçin SMS ugradyň!",
              !status);
        });

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
            validator: (String? value) => _validatorPass(),
            tag: Tags.rISignPass,
            iconD: Icons.vpn_key_outlined,
            label: "Açar sözi",
            hidden: "Açar sözi",
            type: TextInputType.visiblePassword,
          ),
          const SizedBox(height: 20),
          //===============================================================================
          ArzanInputs(
            validator: (String? value) => _validatorPass(),
            tag: Tags.rISignPassAgain,
            iconD: Icons.vpn_key_outlined,
            label: "Açar sözi (tassykla)",
            hidden: "Açar sözi (tassykla)",
            type: TextInputType.visiblePassword,
          ),
          //===============================================================================
          FormErrorMessage(
              visible: _validatorPass() != null, message: validationMessage),
          //===============================================================================
          const SizedBox(height: 20),

          buildIndicators(2),
          const SizedBox(height: 20),

          NextBtn(text: "Agza bol", func: _signFunc),
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
