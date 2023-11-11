
import 'package:floor/floor.dart';

@entity
class TestEntity {
  @primaryKey
  final String id;
  final String name;

  TestEntity({
    required this.id,
    required this.name,
  });
}