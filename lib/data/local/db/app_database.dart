import 'package:floor/floor.dart';
import 'package:homme/data/local/db/dao/test_dao.dart';
import 'package:homme/data/local/db/model/test.dart';

part 'app_database.g.dart';

@Database(version: 1, entities: [TestEntity])
abstract class AppDatabase extends FloorDatabase {

  TestDao get testDao;

}