import 'package:basic_command_app/local_database/transaction_db.dart';
import 'package:basic_command_app/models/TransactionInfos.dart';
import 'package:flutter/foundation.dart';

class TransactionProvider with ChangeNotifier {
  List<TransactionInFos> transaction = [];

  //ดึวงข้อมูล
  List<TransactionInFos> getTransaction() {
    return transaction;
  }

  addTransaction(TransactionInFos info) {
    //สร้างหรือเปิด db
    var db = TransactionInFoDB("transanction.db").openDatabase();
    print(db);

    transaction.insert(0, info);

    //แจ้งเตือน Consumer
    notifyListeners();
  }
}
