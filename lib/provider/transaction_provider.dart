import 'package:basic_command_app/local_database/transaction_db.dart';
import 'package:basic_command_app/models/TransactionInfos.dart';
import 'package:flutter/foundation.dart';

class TransactionProvider with ChangeNotifier {
  List<TransactionInFos> transaction = [];

  //ดึวงข้อมูล
  List<TransactionInFos> getTransaction() {
    return transaction;
  }

  addTransaction(TransactionInFos info) async {
    //สร้างหรือเปิด db
    var db = await TransactionInFoDB("transanction.db");
    //บันทึกข้อมูล
    await db.InsertData(info);

    //ดึงข้อมูลมาแสดง
    await db.loadMemberData();

    transaction.insert(0, info);
    //แจ้งเตือน Consumer
    notifyListeners();
  }
}
