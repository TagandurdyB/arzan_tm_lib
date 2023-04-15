import 'package:flutter/material.dart';

class ArzanLoginInputs extends StatefulWidget {
  final TextInputType type;
  final String tag;
  final IconData iconD;
  final String label;
  final bool isPressBefore;
  final Function? validator;
  const ArzanLoginInputs({
    super.key,
    this.validator,
    this.isPressBefore = false,
    this.type = TextInputType.text,
    required this.tag,
    this.iconD = Icons.edit,
    this.label = "",
  });

  @override
  State<ArzanLoginInputs> createState() => _ArzanLoginInputsState();
}

class _ArzanLoginInputsState extends State<ArzanLoginInputs> {
  bool isPassShow = false;
  final FocusNode focusNode = FocusNode();
  Color borderColor = Colors.grey;
  bool isFocus = false;

  @override
  void initState() {
    super.initState();
    focusNode.addListener(() {
      setState(() {
        borderColor = focusNode.hasFocus ? Colors.orange : Colors.grey;
        isFocus = focusNode.hasFocus ? true : false;
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
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: Theme.of(context).canvasColor,
        border:
            Border.all(width: 1, color: isFocus ? Colors.green : Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Icon(widget.iconD, color: isFocus ? Colors.green : Colors.grey),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: TextFormField(
                focusNode: focusNode,
                obscureText:
                    widget.type == TextInputType.visiblePassword && !isPassShow,
                obscuringCharacter: "*",
                style: const TextStyle(
                    color: Colors.black,
                    // fontSize: 16,
                    letterSpacing: 1,
                    decoration: TextDecoration.none,
                    overflow: TextOverflow.visible,
                    decorationStyle: TextDecorationStyle.dotted,
                    decorationColor: Colors.white),
                // enableSuggestions: false,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  // un show lable
                  //  floatingLabelBehavior: FloatingLabelBehavior.never,
                ),
                // decoration: InputDecoration(
                //     labelStyle: const TextStyle(color: Colors.green),
                //     prefixIcon: Icon(widget.iconD),
                //     prefixIconColor: Colors.green,
                //     suffixIcon: Visibility(
                //         visible: widget.tag == Tags.rILoginPass,
                //         child: GestureDetector(
                //             onTap: () => setState(() {
                //                   isPassShow = !isPassShow;
                //                 }),
                //             child: Icon(isPassShow
                //                 ? Icons.visibility_outlined
                //                 : Icons.visibility_off_outlined))),
                //     suffixIconColor: Colors.green,
                //     labelText: widget.label,
                //     border: const OutlineInputBorder(
                //         borderSide: BorderSide(color: Colors.grey)),
                //     focusColor: Colors.orange,
                //     focusedBorder: const OutlineInputBorder(
                //         borderSide: BorderSide(color: Colors.green)),
                //     enabledBorder: const OutlineInputBorder(
                //       borderRadius: BorderRadius.all(Radius.circular(8)),
                //       borderSide: BorderSide(color: Colors.grey),
                //     )),
                validator: (String? value) {
                  // if (value != null &&
                  //     value.length < 7 &&
                  //     widget.isPressBefore) {
                  //   return "Enter min 7 char at ${widget.tag}";
                  // }
                  // return null;
                  if (widget.validator != null) widget.validator!(value);
                  return null;
                },
              ),
            ),
          ),
          Visibility(
              visible: widget.type == TextInputType.visiblePassword,
              child: GestureDetector(
                  onTap: () => setState(() => isPassShow = !isPassShow),
                  child: Icon(isPassShow
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined))),
        ],
      ),
    );
  }
}
