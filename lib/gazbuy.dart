import 'package:hive/hive.dart';

part 'gazbuy.g.dart';



@HiveType(typeId: 22)
class Gazbuy extends HiveObject{
  @HiveField(1)
  late DateTime date;
  @HiveField(2)
  late int payed;
  @HiveField(3)
  late int ruterned;
  @HiveField(4)
  late int recived;
 
  Gazbuy({required this.date,required this.payed,required this.recived,required this.ruterned});
}
