// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AppDatabase.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

class $FloorFlutterDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$FlutterDatabaseBuilder databaseBuilder(String name) =>
      _$FlutterDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$FlutterDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$FlutterDatabaseBuilder(null);
}

class _$FlutterDatabaseBuilder {
  _$FlutterDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$FlutterDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$FlutterDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$FlutterDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$FlutterDatabase extends AppDatabase {
  _$FlutterDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  MovieDao? _taskDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback? callback]) async {
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
            'CREATE TABLE IF NOT EXISTS `Task` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `message` TEXT NOT NULL)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  MovieDao get movieDao {
    return _taskDaoInstance ??= _$MovieDao(database, changeListener);
  }
}

class _$MovieDao extends MovieDao {
  _$MovieDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _taskInsertionAdapter = InsertionAdapter(
            database,
            'Task',
                (MovieModel item) =>
            <String, Object?>{'id': item.id, 'title': item.title},
            changeListener),
        _taskUpdateAdapter = UpdateAdapter(
            database,
            'Task',
            ['id'],
                (MovieModel item) =>
            <String, Object?>{'id': item.id, 'title': item.title},
            changeListener),
        _taskDeletionAdapter = DeletionAdapter(
            database,
            'Task',
            ['id'],
                (MovieModel item) =>
            <String, Object?>{'id': item.id, 'title': item.title},
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<MovieModel> _taskInsertionAdapter;

  final UpdateAdapter<MovieModel> _taskUpdateAdapter;

  final DeletionAdapter<MovieModel> _taskDeletionAdapter;

  @override
  Future<MovieModel?> findTaskById(int id) async {
    return _queryAdapter.query('SELECT * FROM task WHERE id = ?1',
        mapper: (Map<String, Object?> row) =>
            MovieModel(id:row['id'] as int?, title:row['title'] as String),
        arguments: [id]);
  }

  @override
  Future<List<MovieModel>> findAllTasks() async {
    return _queryAdapter.queryList('SELECT * FROM task',
        mapper: (Map<String, Object?> row) =>
            MovieModel(id:row['id'] as int?, title:row['title'] as String));
  }





  @override
  Future<void> insertTasks(List<MovieModel> tasks) async {
    await _taskInsertionAdapter.insertList(tasks, OnConflictStrategy.abort);
  }


  @override
  Future<void> updateTasks(List<MovieModel> task) async {
    await _taskUpdateAdapter.updateList(task, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteTask(MovieModel task) async {
    await _taskDeletionAdapter.delete(task);
  }

  @override
  Future<void> deleteTasks(List<MovieModel> tasks) async {
    await _taskDeletionAdapter.deleteList(tasks);
  }

  @override
  Future<List<MovieModel>> findAllMovie() {
    // TODO: implement findAllMovie
    throw UnimplementedError();
  }

  @override
  Stream<MovieModel?> findMovieById(int id) {
    // TODO: implement findMovieById
    throw UnimplementedError();
  }

  @override
  Future<void> insertMovie(MovieModel movieModel) {
    // TODO: implement insertMovie
    throw UnimplementedError();
  }
}