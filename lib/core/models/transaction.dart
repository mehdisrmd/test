import 'package:hive/hive.dart';

part 'transaction.g.dart';

@HiveType(typeId: 0)
class TransactionModel extends HiveObject {
  @HiveField(0)
  double? price;

  @HiveField(1)
  String? data;

  @HiveField(2)
  DateTime? date;
  TransactionModel({
    required this.price,
    required this.data,
    required this.date,
  });
}
