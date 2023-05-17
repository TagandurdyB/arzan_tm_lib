// ignore_for_file: must_be_immutable

import '/config/vars/formater.dart';
import 'package:flutter/material.dart';

class TagsWidget extends StatelessWidget {
  final String tags;
  TagsWidget({
    super.key,
    required this.tags,
  });

  late List<String> tagsList;
  @override
  Widget build(BuildContext context) {
    tagsList = Formater.tagSeperator(tags);
    return Wrap(
      spacing: 2,
      runSpacing: 3,
      children: List.generate(tagsList.length, (index) => buildTagCard(index)),
    );
  }

  Widget buildTagCard(int index) {
    return Container(
      color: Colors.green.shade200,
      child: Text(tagsList[index]),
    );
  }
}
