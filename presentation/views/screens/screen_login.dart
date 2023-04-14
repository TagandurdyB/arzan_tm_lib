// ignore_for_file: must_be_immutable

import 'package:arzan_tm/config/system_info/my_size.dart';
import 'package:arzan_tm/presentation/views/widgets/ReadyInput/ready_input.dart';
import 'package:arzan_tm/presentation/views/widgets/my_container.dart';
import 'package:flutter/material.dart';

import '../../../config/vars/constants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isPassShow = false;
  bool isPressBefore = false;

  @override
  late BuildContext context;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(children: [
          const ArzanLoginInputs(
            tag: Tags.rILoginUser,
            iconD: Icons.assignment_ind_outlined,
            label: "Ulanyjy ady",
          ),
          const SizedBox(height: 20),
          const ArzanLoginInputs(
            tag: Tags.rILoginPass,
            iconD: Icons.vpn_key_outlined,
            label: "Açar sözi",
            isPass: true,
          ),
          const SizedBox(height: 20),
          ElevatedButton(onPressed: _loginFunc, child: const Text("Ulgama gir"))
        ]),
      ),
    );
  }

  void _loginFunc() {
    final bool isValidForm = formKey.currentState!.validate();
    if (isValidForm) {
      //Login post
    }
    setState(() {
      isPressBefore = true;
    });
  }

  Widget buildInput(String tag, IconData iconD, String label, Type type) {
    final themeColors = Theme.of(context).inputDecorationTheme;
    return MyContainer(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      borderWidth: 1,
      borderColor: const Color(0xffAAAAAA),
      shape: MySize.arentir * 0.02,
      height: MySize.arentir * 0.12,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Icon(iconD),
          ),
          Expanded(
            child: ReadyInput(
              maxline: 1,
              maxLength: 15,
              type: isPassShow ? Type.text : type,
              cursorColor: Colors.grey,
              inputStyle: themeColors.counterStyle!,
              enabledBorderColor: themeColors.fillColor!,
              focusedBorderColor: themeColors.focusColor!,
              labelColor: const Color(0xffC4C4C4),
              hintColor: const Color(0xffC4C4C4),
              label: label,
              hidden: label,
              // autoFocus: true,
              reightWidget: const SizedBox(),
              tag: tag,
              // shape: true,
              borderRad: 8,
            ),
          ),
          Visibility(
              visible: tag == Tags.rILoginPass,
              child: GestureDetector(
                  onTap: () => setState(() {
                        isPassShow = !isPassShow;
                      }),
                  child: Icon(isPassShow
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined)))
        ],
      ),
    );
  }
}

class ArzanLoginInputs extends StatefulWidget {
  final String tag;
  final IconData iconD;
  final String label;
  final bool isPass;
  const ArzanLoginInputs({
    super.key,
    required this.tag,
    required this.iconD,
    this.label = "",
    this.isPass = false,
  });

  @override
  State<ArzanLoginInputs> createState() => _ArzanLoginInputsState();
}

class _ArzanLoginInputsState extends State<ArzanLoginInputs> {
  bool isPassShow = false;
  bool isPressBefore = false;
  final FocusNode focusNode = FocusNode();
  Color borderColor = Colors.grey;

  @override
  void initState() {
    super.initState();
    focusNode.addListener(() {
      setState(() {
        borderColor = focusNode.hasFocus ? Colors.orange : Colors.grey;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: borderColor,
          width: 100,
          height: 20,
        ),
        buildFormInput(),
      ],
    );
  }

  Widget buildFormInput() {
    return TextFormField(
      focusNode: focusNode,
      obscureText: widget.isPass && !isPassShow,
      obscuringCharacter: "*",
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
          labelStyle: const TextStyle(color: Colors.green),
          prefixIcon: Icon(widget.iconD),
          prefixIconColor: Colors.green,
          suffixIcon: Visibility(
              visible: widget.tag == Tags.rILoginPass,
              child: GestureDetector(
                  onTap: () => setState(() {
                        isPassShow = !isPassShow;
                      }),
                  child: Icon(isPassShow
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined))),
          suffixIconColor: Colors.green,
          labelText: widget.label,
          border: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey)),
          focusColor: Colors.orange,
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.green)),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(color: Colors.grey),
          )),
      validator: (value) {
        if (value != null && value.length < 7 && isPressBefore) {
          return "Enter min 7 char at ${widget.tag}";
        }
        return null;
      },
    );
  }
}
