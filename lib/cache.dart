import 'package:hive_flutter/hive_flutter.dart';
import 'gazbuy.dart';

class Cache {
  static Future<void> saveBuy(Gazbuy gaz) async {
    
    Hive.box('gazbuy').put('date', gaz.date);
    Hive.box('gazbuy').put('payed', gaz.payed);
    Hive.box('gazbuy').put('recived', gaz.recived);
    Hive.box('gazbuy').put('returned', gaz.ruterned);
    
  }

  static Box<Gazbuy> getGazBuys() {
    // var box =  Hive.openBox('gazbuy');
    return Hive.box<Gazbuy>('gazbuy');
  }
}
