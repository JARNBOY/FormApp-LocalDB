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

//dbName = transanction.db
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
}
