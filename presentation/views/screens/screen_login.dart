// ignore_for_file: must_be_immutable

import 'package:arzan_tm/config/system_info/my_size.dart';
import 'package:arzan_tm/presentation/views/widgets/my_container.dart';
import 'package:flutter/material.dart';

import '../../../config/routes/my_route.dart';
import '../../../config/vars/constants.dart';
import '../../providers/data/provider_revovery.dart';
import '../widgets/ReadyInput/login_arzan_input.dart';
import '../widgets/ReadyInput/ready_input_base.dart';
import '../widgets/form_error_message.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isPassShow = false;
  bool isPressBefore = false;
  bool haveError = false;

  @override
  late BuildContext context;
  final formKey = GlobalKey<FormState>();

  String? _haveAnyValid() {
    if (isPressBefore) {
      if (RIBase.getText(Tags.rILoginPass).length < 5) {
        //return "Enter min 7 char at Name";
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
        Navigator.pushNamed(context, Rout.user);
      } else {
        haveError = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(children: [
          LoginArzanInputs(
            validator: (String? value) {
              return _haveAnyValid();
            },
            tag: Tags.rILoginUser,
            iconD: Icons.assignment_ind_outlined,
            label: "Ulanyjy ady",
            hidden: "Ulanyjy ady",
          ),
          const SizedBox(height: 20),
          LoginArzanInputs(
            validator: (String? value) {
              return _haveAnyValid();
            },
            tag: Tags.rILoginPass,
            iconD: Icons.vpn_key_outlined,
            label: "Açar sözi",
            hidden: "Açar sözi",
            type: TextInputType.visiblePassword,
          ),
          const SizedBox(height: 20),
          FormErrorMessage(
              visible: haveError,
              message: "Ulanyjy ady ýada açar sözi nädogry girizildi!"),
          buildBottomSide,
          const SizedBox(height: 20),
          ElevatedButton(onPressed: _loginFunc, child: const Text("Ulgama gir"))
        ]),
      ),
    );
  }

  Widget get buildBottomSide {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      //  color: Colors.orange,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildRememberMe,
          buildRecovery,
        ],
      ),
    );
  }

  bool isRemember = true;
  Widget get buildRememberMe {
    return InkWell(
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
          Text("Ýatda sakla",
              style: TextStyle(fontSize: MySize.arentir * 0.043)),
        ],
      ),
    );
  }

  void _funcRememberMe() {
    setState(() {
      isRemember = !isRemember;
    });
  }

  Widget get buildRecovery {
    return TextButton(
      onPressed: () {
        RecoveryP.of(context, listen: false).resetPage;
        Navigator.pushNamed(context, Rout.recovey);
      },
      child: Text(
        "Açar sözi unutdym",
        style: TextStyle(
            color: const Color(0xffAAAAAA),
            decoration: TextDecoration.underline,
            fontSize: MySize.arentir * 0.043),
      ),
    );
  }
}
