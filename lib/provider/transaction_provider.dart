import 'package:basic_command_app/local_database/transaction_db.dart';
import 'package:basic_command_app/models/TransactionInfos.dart';
import 'package:flutter/foundation.dart';

class TransactionMemberProvider with ChangeNotifier {
  List<TransactionInFos> memberTransaction = [];

  //ดึวงข้อมูล
  List<TransactionInFos> getTransaction() {
    return memberTransaction;
  }

  void initData() async {
    var db = await TransactionInFoDB("transanction.db");
    //ดึงข้อมูลมาแสดง
    memberTransaction = await db.loadMemberData();
    notifyListeners();
  }

  void addTransaction(TransactionInFos info) async {
    //สร้างหรือเปิด db
    var db = await TransactionInFoDB("transanction.db");
    //บันทึกข้อมูล
    await db.InsertData(info);

    //ดึงข้อมูลมาแสดง
    memberTransaction = await db.loadMemberData();

    memberTransaction.insert(0, info);
    //แจ้งเตือน Consumer
    notifyListeners();
  }
}
