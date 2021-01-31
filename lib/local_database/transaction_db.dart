import 'package:basic_command_app/models/TransactionInfos.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

class TransactionInFoDB {
  //บริการเกี่ยวกับฐานข้อมูล

  String dbName; //เก็บชื่อฐานข้อมูล

  //ถ้ายังไม่ถูกสร้าง => สร้าง
  //ถูกสร้างไว้แล้ว => เปิด
  TransactionInFoDB(this.dbName);

  Future<Database> openDatabase() async {
    //หาตำแหน่งที่จะเก็บข้อมูล
    var appDirectory = await getApplicationDocumentsDirectory();
    String dbLocation =
        join(appDirectory.path, dbName); //(hostpath,transanction.db)

    //สร้าง DB
    DatabaseFactory dbFactory = await databaseFactoryIo;
    Database db = await dbFactory.openDatabase(dbLocation);
    return db;
  }

  //บันทึกข้อมูล
  Future<int> InsertData(TransactionInFos info) async {
    //ฐานข้อมูล => store
    var db = await this.openDatabase();
    var store = intMapStoreFactory.store("listMember");

    //เก็บข้อมูลแบบ json
    var keyId = store.add(db, {
      "name": info.name,
      "surname": info.surname,
      "phone": info.phone,
      "score": info.score,
      "date": info.date.toIso8601String(),
    });
    db.close();
    return keyId;
  }

  //ดึงข้อมูล
  Future<List<TransactionInFos>> loadMemberData() async {
    var db = await this.openDatabase();
    var store = intMapStoreFactory.store("listMember");
    //false คือเรียงจากใหม่ไปเก่า , มากไปน้อย

    var snapshot = await store.find(db,
        finder: Finder(sortOrders: [SortOrder(Field.key, false)]));
    print(snapshot);
    List memberList = List<TransactionInFos>();
    //ดึงข้อมูลมาทีละแถว
    for (var record in snapshot) {
      memberList.add(TransactionInFos(
          name: record["name"],
          surname: record["surname"],
          phone: record["phone"],
          score: record["score"],
          date: DateTime.parse(record["date"])));
    }

    return memberList;
  }
}
