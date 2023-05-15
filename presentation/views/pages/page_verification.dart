// ignore_for_file: must_be_immutable, avoid_print

import 'dart:async';

import '../../../config/vars/constants.dart';
import '../scaffold/recovery_scaffold.dart';
import 'package:flutter/material.dart';

import '../widgets/ReadyInput/ready_input_base.dart';
import '../widgets/ReadyInput/verification_input.dart';
import '../widgets/form_error_message.dart';
import '../widgets/next_btn.dart';

class VerificarionPage extends StatefulWidget {
  final String? title;
  final String? btnName;
  final Function? btnFunc;
  const VerificarionPage({this.btnFunc, this.title, this.btnName, super.key});

  @override
  State<VerificarionPage> createState() => _VerificarionPageState();
}

class _VerificarionPageState extends State<VerificarionPage> {
  final formKey = GlobalKey<FormState>();
  bool isPressedBefore = false;
  bool haveError = false;
  bool canSend = true;
  int waitTime = 60;
  Timer timer = Timer(Duration.zero, () {});

  void _funcNext() {
    setState(() {
      isPressedBefore = true;
      final bool isValidForm = formKey.currentState!.validate();
      if (isValidForm) {
        //Login post
        haveError = false;
        if (widget.btnFunc != null) {
          widget.btnFunc!();
        } 
        // RecoveryP.of(context, listen: false).nextPage;
      } else {
        haveError = true;
      }
    });
  }

  String? _haveError() {
    final String code = RIBase.getText(Tags.rIVerification);
    if (code.contains(" ") && isPressedBefore) {
      return "";
    }
    return null;
  }

  void _sendSecondSMS() {
    if (canSend) {
      ///send SMS repeat!
      setState(() => canSend = false);
      timer = Timer.periodic(const Duration(seconds: 1), (value) {
        setState(() {
          if (waitTime > 0) {
            waitTime--;
          } else {
            waitTime = 60;
            canSend = true;
            timer.cancel();
          }
        });
      });
    }
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RecoveryScaffold(
      title: widget.title,
      text: '''+993 ${RIBase.getText(Tags.rIPhone)} belgä ugradylan 
6-belgili tassyklama kodyny giriziň:''',
      content: Form(
        key: formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            buildInput,
            FormErrorMessage(visible: haveError, message: "Kody doly ýazyň!"),
            const SizedBox(height: 20),
            NextBtn(text: widget.btnName ?? "Indiki", func: _funcNext),
            const SizedBox(height: 20),
            buildTimer
          ],
        ),
      ),
    );
  }

  Widget get buildInput => VerificationInput(
        tag: Tags.rIVerification,
        validator: (String? val) => _haveError(),
      );

  Widget get buildTimer {
    return TextButton(
      style: canSend
          ? null
          : ButtonStyle(
              overlayColor: MaterialStateProperty.all(Colors.transparent),
            ),
      onPressed: _sendSecondSMS,
      child: Text(
        canSend ? "Täzeden iber" : "Täzeden iber (${seperateClock(waitTime)})",
        style: TextStyle(
            color: canSend ? Colors.green : Colors.grey,
            fontWeight: FontWeight.bold),
      ),
    );
  }

  String timeFormat(int num) {
    return "$num".padLeft(2, "0");
  }

  String seperateClock(int time) {
    final int min = time ~/ 60;
    final int sec = (time - (min * 60)) % 60;
    return "${timeFormat(min)}:${timeFormat(sec)}";
  }
}
