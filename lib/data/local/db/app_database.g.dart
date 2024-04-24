// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  TestDao? _testDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `TestEntity` (`id` TEXT NOT NULL, `name` TEXT NOT NULL, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  TestDao get testDao {
    return _testDaoInstance ??= _$TestDao(database, changeListener);
  }
}

class _$TestDao extends TestDao {
  _$TestDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database, changeListener),
        _testEntityInsertionAdapter = InsertionAdapter(
            database,
            'TestEntity',
            (TestEntity item) =>
                <String, Object?>{'id': item.id, 'name': item.name},
            changeListener),
        _testEntityUpdateAdapter = UpdateAdapter(
            database,
            'TestEntity',
            ['id'],
            (TestEntity item) =>
                <String, Object?>{'id': item.id, 'name': item.name},
            changeListener),
        _testEntityDeletionAdapter = DeletionAdapter(
            database,
            'TestEntity',
            ['id'],
            (TestEntity item) =>
                <String, Object?>{'id': item.id, 'name': item.name},
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<TestEntity> _testEntityInsertionAdapter;

  final UpdateAdapter<TestEntity> _testEntityUpdateAdapter;

  final DeletionAdapter<TestEntity> _testEntityDeletionAdapter;

  @override
  Stream<List<TestEntity>> getAllTests() {
    return _queryAdapter.queryListStream('SELECT * FROM TestEntity',
        mapper: (Map<String, Object?> row) =>
            TestEntity(id: row['id'] as String, name: row['name'] as String),
        queryableName: 'TestEntity',
        isView: false);
  }

  @override
  Stream<TestEntity?> getTestById(String id) {
    return _queryAdapter.queryStream('SELECT * FROM TestEntity WHERE id = ?1',
        mapper: (Map<String, Object?> row) =>
            TestEntity(id: row['id'] as String, name: row['name'] as String),
        arguments: [id],
        queryableName: 'TestEntity',
        isView: false);
  }

  @override
  Future<void> deleteAllTests() async {
    await _queryAdapter.queryNoReturn('DELETE FROM TestEntity');
  }

  @override
  Future<void> insertTest(TestEntity test) async {
    await _testEntityInsertionAdapter.insert(test, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateTest(TestEntity test) async {
    await _testEntityUpdateAdapter.update(test, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteTest(TestEntity test) async {
    await _testEntityDeletionAdapter.delete(test);
  }
}
