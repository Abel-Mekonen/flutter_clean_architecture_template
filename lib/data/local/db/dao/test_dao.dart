import 'package:floor/floor.dart';
import 'package:homme/data/local/db/model/test.dart';

@dao
abstract class TestDao {

  @Query('SELECT * FROM TestEntity')
  Stream<List<TestEntity>> getAllTests();

  @Query('SELECT * FROM TestEntity WHERE id = :id')
  Stream<TestEntity?> getTestById(String id);

  @insert
  Future<void> insertTest(TestEntity test);

  @update
  Future<void> updateTest(TestEntity test);

  @delete
  Future<void> deleteTest(TestEntity test);

  @Query('DELETE FROM TestEntity')
  Future<void> deleteAllTests();
}