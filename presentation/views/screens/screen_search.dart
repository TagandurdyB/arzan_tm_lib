// ignore_for_file: must_be_immutable

import '/config/system_info/my_size.dart';
import '/domanin/entities/search_entity.dart';

import '../../providers/view/provider_navigation.dart';
import 'package:flutter/material.dart';

import '../widgets/search_view.dart';

class ScreenSearch extends StatelessWidget {
  ScreenSearch({super.key});

  late BuildContext context;
  final double arentir = MySize.arentir;
  @override
  Widget build(BuildContext context) {
    this.context = context;
    return Scaffold(
      backgroundColor: ProviderNav.of(context).searchBg,
      //ThemeP.of(context).colors.searchCanvas,
      body: SearchView(
        objs: [
          SearchEntity(
            created: DateTime.now(),
            viewed: 123,
            title: "Samsung S22 Ultra 512 GB 8 RAM",
            imageUrl:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQVP_0KxPtS9k8ot2uwWIKWsyb3uKl3JmqAxw&usqp=CAU",
          ),
          SearchEntity(
            created: DateTime.now(),
            viewed: 123,
            title: "Samsung S22 Ultra 512 GB 8 RAM",
            imageUrl:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRYlr4rmRuW-VoBTQYjCVO89Kb08b34_GSrWQ&usqp=CAU",
          ),
          SearchEntity(
            created: DateTime.now(),
            viewed: 123,
            title: "Samsung S22 Ultra 512 GB 8 RAM",
            imageUrl:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQVP_0KxPtS9k8ot2uwWIKWsyb3uKl3JmqAxw&usqp=CAU",
          ),
          SearchEntity(
            created: DateTime.now(),
            viewed: 123,
            title: "Samsung S22 Ultra 512 GB 8 RAM",
            imageUrl:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQVP_0KxPtS9k8ot2uwWIKWsyb3uKl3JmqAxw&usqp=CAU",
          ),
          SearchEntity(
            created: DateTime.now(),
            viewed: 123,
            title: "Samsung S22 Ultra 512 GB 8 RAM",
            imageUrl:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRYlr4rmRuW-VoBTQYjCVO89Kb08b34_GSrWQ&usqp=CAU",
          ),
          SearchEntity(
            created: DateTime.now(),
            viewed: 123,
            title: "Samsung S22 Ultra 512 GB 8 RAM",
            imageUrl:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQVP_0KxPtS9k8ot2uwWIKWsyb3uKl3JmqAxw&usqp=CAU",
          ),
          SearchEntity(
            created: DateTime.now(),
            viewed: 123,
            title: "Samsung S22 Ultra 512 GB 8 RAM",
            imageUrl:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQVP_0KxPtS9k8ot2uwWIKWsyb3uKl3JmqAxw&usqp=CAU",
          ),
          SearchEntity(
            created: DateTime.now(),
            viewed: 123,
            title: "Samsung S22 Ultra 512 GB 8 RAM",
            imageUrl:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRYlr4rmRuW-VoBTQYjCVO89Kb08b34_GSrWQ&usqp=CAU",
          ),
          SearchEntity(
            created: DateTime.now(),
            viewed: 123,
            title: "Samsung S22 Ultra 512 GB 8 RAM",
            imageUrl:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQVP_0KxPtS9k8ot2uwWIKWsyb3uKl3JmqAxw&usqp=CAU",
          ),
        ],
      ),
    );
  }
}
