import 'package:basic_command_app/models/TransactionInfo.dart';
import 'package:flutter/foundation.dart';

class TransactionProvider with ChangeNotifier {
  List<TransactionInFo> transaction = [];

  //ดึวงข้อมูล
  List<TransactionInFo> getTransaction() {
    return transaction;
  }

  addTransaction(TransactionInFo info) {
    transaction.insert(0, info);

    //แจ้งเตือน Consumer
    notifyListeners();
  }
}
