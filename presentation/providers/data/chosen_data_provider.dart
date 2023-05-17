import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../../domanin/entities/chosens/chosen_detal_entity.dart';

class ChosenDataP extends ChangeNotifier {
  List<ChosenDetalEntity> entities = [];

  List<int> _chosenIds = [];
  List<int> get chosenIds => _chosenIds;
  void changeChosenIds(List<int> ids) {
    _chosenIds = ids;
    entities = ids.map((e) => ChosenDetalEntity.empty).toList();
    print("$entities");
    notifyListeners();
  }

  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;
  void changeIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  void fillEntitys() {
    try {
      final int pageId = _chosenIds[_selectedIndex];
      /*
     entities[_selectedIndex]= chosenCase.getDetal(pageId); //ChosenDetalEntity
      */
      notifyListeners();
    } catch (err) {
      throw ("+*+ Error in ChosenDataP fillEntitys: $err");
    }
  }

  void fillNextPage() {}

  ChosenDetalEntity entity = ChosenDetalEntity(
    id: 1,
    images: [
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS92eisuWOx3tEjeW14mT9ACVgXDwIRBGtnww&usqp=CAU",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS92eisuWOx3tEjeW14mT9ACVgXDwIRBGtnww&usqp=CAU",
    ],
    title: "Magtumguly adyndaky tiyatr",
    viewed: 6,
    liked: 0,
    whom: "Mähriban agzalar",
    message: "asfasf sdafsa asfj nsdaklf ansdlfk ansdkf ansdkf ",
    phone: "+99365000000",
    tags: "#telfon#kino#tablet",
    createdAt: DateTime.now(),
    isEmpty: false,
  );
  // ChosenDetalEntity entity = ChosenDetalEntity.empty;

  Future<void> fillEntity() async {
    // try {
    //   entity = await mainPageCase.get();
    //   notifyListeners();
    // } catch (err) {
    //   throw ("+*+* Error ChosenDataP fillEntity: $err");
    // }
  }

  static ChosenDataP of(BuildContext context, {bool listen = true}) =>
      Provider.of<ChosenDataP>(context, listen: listen);
}
