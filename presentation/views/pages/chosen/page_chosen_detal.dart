import '../../../providers/data/main_page_provider.dart';
import '../../widgets/tags_widget.dart';
import '/presentation/views/widgets/shimmer_img.dart';
import 'package:provider/provider.dart';

import '../../../../config/vars/formater.dart';
import '../../widgets/btns_group.dart';
import '/domanin/entities/chosens/chosen_detal_entity.dart';

import '/presentation/providers/data/chosen_data_provider.dart';

import '/presentation/views/scaffold/custom_app_bar.dart';

import '/config/services/my_size.dart';

import '/presentation/views/scaffold/no_app_bar_scaffold.dart';
import 'package:flutter/material.dart';

class ChosenDetalPage extends StatefulWidget {
  // final int id;
  // final ChosenDetalEntity obj;
  const ChosenDetalPage({
    // required this.id,
    super.key,
  });

  @override
  State<ChosenDetalPage> createState() => _ChosenDetalPageState();
}

class _ChosenDetalPageState extends State<ChosenDetalPage> {
  final double arentir = MySize.arentir;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ChosenDataP.of(context, listen: false).fillEntity();
    });
    super.initState();
  }

  late List<ChosenDetalEntity> objs;
  late ChosenDetalEntity obj;

  @override
  Widget build(BuildContext context) {
    objs = context.watch<ChosenDataP>().entities;
    obj = context.watch<ChosenDataP>().entity;
    return ScaffoldNo(
      body: PageView.builder(
        controller:
            PageController(initialPage: ChosenDataP.of(context).selectedIndex),
        itemCount: MainPageP.of(context).entity.saylananlarCount,
        itemBuilder: (context, index) {
          return Column(children: [
            CustomAppBar(title: ""),
            Expanded(child: SingleChildScrollView(child: buildContent)),
            // SettingsContent()
          ]);
        },
      ),
    );
  }

  Widget get buildContent {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            height: MySize.width,
            child: PageView(
                scrollDirection: Axis.vertical,
                children: List.generate(
                    obj.images.length, (index) => buildImgCard(index))),
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  obj.title,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: arentir * 0.04),
                ),
                const Divider(color: Colors.black),
                buildInformationIndicators,
                const Divider(color: Colors.black),
                Text(
                  obj.whom,
                  style: TextStyle(
                    fontSize: arentir * 0.038,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  obj.message,
                  style: TextStyle(
                    fontSize: arentir * 0.038,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  "Habarlaşmak üçin:",
                  style: TextStyle(
                    fontSize: arentir * 0.038,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "Tel: ${obj.phone}",
                  style: const TextStyle(
                      color: Color(0xff0000EE),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      decoration: TextDecoration.underline),
                ),
                const SizedBox(height: 20),
                TagsWidget(tags: "#tag#phone#tablet"),
                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: arentir * 0.3,
                    child: BorderBtn(
                      onTap: () {},
                    ),
                  ),
                ),
                const SizedBox(height: 50),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildImgCard(int index) {
    return Container(
      clipBehavior: Clip.hardEdge,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Theme.of(context).canvasColor,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(width: 1, color: const Color(0xffE9E9E9)),
          boxShadow: const [
            BoxShadow(color: Color(0xffE9E9E9), blurRadius: 2, spreadRadius: 2)
          ]),
      child: ShimmerImg(fit: BoxFit.fitWidth, imageUrl: obj.images[index]),
    );
  }

  Widget get buildInformationIndicators {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          Formater.calendar(obj.createdAt),
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: arentir * 0.04,
            color: const Color(0xff5F5B5B),
          ),
        ),
        Row(
          children: [
            const Icon(
              Icons.remove_red_eye_outlined,
              color: Color(0xff5F5B5B),
            ),
            const SizedBox(width: 4),
            Text(
              "${obj.viewed}",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: arentir * 0.04,
                color: const Color(0xff5F5B5B),
              ),
            ),
          ],
        ),
        const Icon(
          Icons.share_outlined,
          color: Color(0xff656161),
        ),
        LikeBtn(
          onTap: (bool val) {},
          likeCount: 3,
          iconSize: arentir * 0.05,
          textSize: arentir * 0.04,
          textColor: const Color(0xff5F5B5B),
        ),
      ],
    );
  }
}
