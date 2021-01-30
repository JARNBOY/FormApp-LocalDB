import 'package:basic_command_app/models/TransactionInfos.dart';
import 'package:flutter/foundation.dart';

class TransactionProvider with ChangeNotifier {
  List<TransactionInFos> transaction = [];

  //ดึวงข้อมูล
  List<TransactionInFos> getTransaction() {
    return transaction;
  }

  addTransaction(TransactionInFos info) {
    transaction.insert(0, info);

    //แจ้งเตือน Consumer
    notifyListeners();
  }
}
