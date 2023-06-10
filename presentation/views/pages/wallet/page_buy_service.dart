// ignore_for_file: must_be_immutable

import '../../../../config/routes/my_route.dart';
import '/presentation/views/widgets/my_pop_widget.dart';

import '/presentation/views/widgets/next_btn.dart';

import '../../../../config/vars/constants.dart';
import '../../../../config/vars/formater.dart';
import '../../../providers/data/hive_provider.dart';
import '/domanin/entities/buy_service_entity.dart';

import '../../widgets/custom_dropdown.dart';
import '/presentation/views/widgets/arzan_coin.dart';

import '/presentation/views/widgets/custom_avatar.dart';

import '../../../../config/services/my_size.dart';
import '/presentation/views/scaffold/no_app_bar_scaffold.dart';
import 'package:flutter/material.dart';

class BuyServicePage extends StatefulWidget {
  const BuyServicePage({super.key});

  @override
  State<BuyServicePage> createState() => _BuyServicePageState();
}

class _BuyServicePageState extends State<BuyServicePage> {
  @override
  late BuildContext context;

  final double arentir = MySize.arentir;

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return ScaffoldNo(
      body: Column(children: [
        buildTopBar,
        buildUser,
        Expanded(child: buildContent),
      ]),
    );
  }

  Widget get buildTopBar => Container(
        color: Colors.white54,
        height: kToolbarHeight,
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            const BackButton(),
            Text(
              "Hyzmat satyn almak",
              style: TextStyle(fontSize: MySize.arentir * 0.065),
            ),
          ],
        ),
      );

  Widget get buildUser => Container(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            CustomAvatar(
              goAcaunt: true,
              radius: arentir * 0.12,
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Visibility(
                        visible: HiveP.of(context).readStr(Tags.hiveRole) ==
                            "official",
                        child: buildStar),
                    Text(
                      "100haryt.com",
                      style: TextStyle(fontSize: arentir * 0.04),
                    ),
                  ],
                ),
                Visibility(
                  visible:
                      HiveP.of(context).readStr(Tags.hiveRole) == "official",
                  child: Text(
                    "Gutarýan wagty: ${Formater.calendar(DateTime.now())}",
                    style: TextStyle(
                        color: const Color(0xffAAAAAA),
                        fontSize: arentir * 0.03),
                  ),
                ),
              ],
            ),
            const Expanded(child: SizedBox()),
            Text(
              "1285",
              style: TextStyle(
                  color: const Color(0xffE79E12), fontSize: arentir * 0.04),
            ),
            const SizedBox(width: 5),
            ArzanCoin(radius: arentir * 0.05),
          ],
        ),
      );

  Container get buildStar {
    return Container(
      margin: EdgeInsets.only(right: arentir * 0.01),
      decoration: BoxDecoration(
          color: const Color(0xffB47D3F),
          border: Border.all(color: const Color(0xffE2BD83), width: 1),
          borderRadius: BorderRadius.circular(10)),
      child: const Icon(
        Icons.star,
        color: Color(0xffE2BD83),
        size: 12,
      ),
    );
  }

  List<BuyServiceEntity> objs = [
    BuyServiceEntity(
      img:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTgIcaunOj3K20p2LQXlEh58Zv38qeBb5AVMA&usqp=CAU",
      name: "Albom döretmek",
      coin: 600,
    ),
    BuyServiceEntity(
      img:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTgIcaunOj3K20p2LQXlEh58Zv38qeBb5AVMA&usqp=CAU",
      name: "Bildiriş ugratmak",
      coin: 1200,
    ),
    BuyServiceEntity(
      img:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTgIcaunOj3K20p2LQXlEh58Zv38qeBb5AVMA&usqp=CAU",
      name: "Banner goýmak",
      coin: 700,
    ),
  ];

  List<String> dates = [
    "6 aý",
    "4 aý",
    "3 aý",
    "1 aý",
    "14 gün",
    "7 gün",
    "5 gün",
    "2 gün",
    "1 gün",
  ];

  int selectedService = -1;
  int selectedTime = -1;
  List<String> selectedLocations = [];
  bool canBuy = false;

  Widget get buildContent => ListView(
        children: [
          buildTitle("Hyzmatyň görnüşini saýlaň:"),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: buildService(),
          ),
          buildTitle("Wagty:"),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: buildDate(),
          ),
          buildTitle("Ýeri:"),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: buildLocations(),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: buildSum(),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: NextBtn(func: buyFunc, text: "Satyn al"),
          )
        ],
      );

  void buyFunc() {
    if (canBuy) {
      MyPopUpp.popLoading(context);

      Future.delayed(const Duration(seconds: 3)).then((value) {
        const status = true;
        MyPopUpp.popMessage(context, () {
          if (status) {
            Navigator.pushNamed(context, Rout.boughts);
          }
        }, status ? Words.buyOk : Words.buyNo, !status);
      });
    } else {
      MyPopUpp.popLoading(context);
      MyPopUpp.popMessage(context, () {}, Words.buyValidation, !false);
    }
  }

  Visibility buildSum() {
    canBuy = selectedService != -1 &&
        selectedTime != -1 &&
        selectedLocations.isNotEmpty;
    return Visibility(
        visible: canBuy,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Umumy bahasy:",
              style: TextStyle(fontSize: arentir * 0.033),
            ),
            SizedBox(height: arentir * 0.03),
            Row(
              children: [
                Text(
                  "1345",
                  style: TextStyle(
                      color: const Color(0xffE79E12),
                      fontSize: arentir * 0.033),
                ),
                const SizedBox(width: 5),
                ArzanCoin(radius: arentir * 0.04)
              ],
            ),
          ],
        ));
  }

  Widget buildTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        title,
        style: TextStyle(fontSize: arentir * 0.033),
      ),
    );
  }

  Widget buildService() {
    return CustomDropDown(
      isOpen: true,
      height: arentir * 0.1,
      mainValue: selectedService == -1
          ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text("Hyzmat saýla",
                  style: TextStyle(fontSize: arentir * 0.03)),
            )
          : buildItem(objs[selectedService]),
      items: objs.map((e) => buildItem(e)).toList(),
      onChange: (int index) {
        setState(() => selectedService = index);
      },
    );
  }

  Widget buildItem(BuyServiceEntity obj) => Container(
        height: arentir * 0.1,
        margin: const EdgeInsets.all(8),
        child: Row(
          children: [
            SizedBox(
                width: arentir * 0.1,
                height: arentir * 0.05,
                child: Image.network(obj.img)),
            Expanded(
                child:
                    Text(obj.name, style: TextStyle(fontSize: arentir * 0.03))),
            Text(
              "${obj.coin}",
              style: TextStyle(
                  color: const Color(0xffE79E12), fontSize: arentir * 0.04),
            ),
            const SizedBox(width: 10),
            ArzanCoin(radius: arentir * 0.04),
          ],
        ),
      );

  Widget buildDate() {
    return CustomDropDown(
      height: arentir * 0.1,
      mainValue: selectedTime == -1
          ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text("Wagt sayla",
                  style: TextStyle(fontSize: arentir * 0.03)),
            )
          : buildDateI(dates[selectedTime]),
      items: dates.map((e) => buildDateI(e)).toList(),
      onChange: (int index) {
        setState(() => selectedTime = index);
      },
    );
  }

  Widget buildDateI(String date) => Row(
        children: [
          Expanded(
            child: Container(
              // height: arentir * 0.1,
              padding: const EdgeInsets.all(8),
              child: Text(date),
            ),
          ),
        ],
      );

  Widget buildLocations() {
    return CustomCheckDrop(
      height: arentir * 0.1,
      mainValue: selectedLocations.isEmpty
          ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child:
                  Text("Ýer saýla", style: TextStyle(fontSize: arentir * 0.03)),
            )
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(Formater.locations(selectedLocations)),
            ),
      items: Words.welayats
          .map((e) => DDItem(
                value: e,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(e),
                ),
              ))
          .toList(),
      onChange: (List<DDItem> checks) {
        setState(() => selectedLocations = checks.map((e) => e.value).toList());
      },
    );
  }
}
