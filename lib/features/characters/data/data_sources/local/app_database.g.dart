// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

abstract class $AppDatabaseBuilderContract {
  /// Adds migrations to the builder.
  $AppDatabaseBuilderContract addMigrations(List<Migration> migrations);

  /// Adds a database [Callback] to the builder.
  $AppDatabaseBuilderContract addCallback(Callback callback);

  /// Creates the database and initializes it.
  Future<AppDatabase> build();
}

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $AppDatabaseBuilderContract databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $AppDatabaseBuilderContract inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder implements $AppDatabaseBuilderContract {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  @override
  $AppDatabaseBuilderContract addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  @override
  $AppDatabaseBuilderContract addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  @override
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

  CharacterDao? _characterDaoInstance;

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
            'CREATE TABLE IF NOT EXISTS `characters` (`id` INTEGER, `name` TEXT, `status` TEXT, `species` TEXT, `type` TEXT, `gender` TEXT, `locationName` TEXT, `locationUrl` TEXT, `originName` TEXT, `originUrl` TEXT, `image` TEXT, `episode` TEXT, `url` TEXT, `created` TEXT, `isFavorite` INTEGER, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  CharacterDao get characterDao {
    return _characterDaoInstance ??= _$CharacterDao(database, changeListener);
  }
}

class _$CharacterDao extends CharacterDao {
  _$CharacterDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _characterModelInsertionAdapter = InsertionAdapter(
            database,
            'characters',
            (CharacterModel item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'status': item.status,
                  'species': item.species,
                  'type': item.type,
                  'gender': item.gender,
                  'locationName': item.locationName,
                  'locationUrl': item.locationUrl,
                  'originName': item.originName,
                  'originUrl': item.originUrl,
                  'image': item.image,
                  'episode': _stringListConverter.encode(item.episode),
                  'url': item.url,
                  'created': item.created,
                  'isFavorite': item.isFavorite == null
                      ? null
                      : (item.isFavorite! ? 1 : 0)
                }),
        _characterModelDeletionAdapter = DeletionAdapter(
            database,
            'characters',
            ['id'],
            (CharacterModel item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'status': item.status,
                  'species': item.species,
                  'type': item.type,
                  'gender': item.gender,
                  'locationName': item.locationName,
                  'locationUrl': item.locationUrl,
                  'originName': item.originName,
                  'originUrl': item.originUrl,
                  'image': item.image,
                  'episode': _stringListConverter.encode(item.episode),
                  'url': item.url,
                  'created': item.created,
                  'isFavorite': item.isFavorite == null
                      ? null
                      : (item.isFavorite! ? 1 : 0)
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<CharacterModel> _characterModelInsertionAdapter;

  final DeletionAdapter<CharacterModel> _characterModelDeletionAdapter;

  @override
  Future<List<CharacterModel>> getAllCharacters() async {
    return _queryAdapter.queryList('SELECT * FROM characters',
        mapper: (Map<String, Object?> row) => CharacterModel(
            id: row['id'] as int?,
            name: row['name'] as String?,
            status: row['status'] as String?,
            species: row['species'] as String?,
            type: row['type'] as String?,
            gender: row['gender'] as String?,
            locationName: row['locationName'] as String?,
            locationUrl: row['locationUrl'] as String?,
            originName: row['originName'] as String?,
            originUrl: row['originUrl'] as String?,
            image: row['image'] as String?,
            episode: _stringListConverter.decode(row['episode'] as String?),
            url: row['url'] as String?,
            created: row['created'] as String?));
  }

  @override
  Future<CharacterModel?> getCharacterById(int id) async {
    return _queryAdapter.query('SELECT * FROM characters WHERE id = ?1',
        mapper: (Map<String, Object?> row) => CharacterModel(
            id: row['id'] as int?,
            name: row['name'] as String?,
            status: row['status'] as String?,
            species: row['species'] as String?,
            type: row['type'] as String?,
            gender: row['gender'] as String?,
            locationName: row['locationName'] as String?,
            locationUrl: row['locationUrl'] as String?,
            originName: row['originName'] as String?,
            originUrl: row['originUrl'] as String?,
            image: row['image'] as String?,
            episode: _stringListConverter.decode(row['episode'] as String?),
            url: row['url'] as String?,
            created: row['created'] as String?),
        arguments: [id]);
  }

  @override
  Future<void> insertCharacter(CharacterModel character) async {
    await _characterModelInsertionAdapter.insert(
        character, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteCharacter(CharacterModel character) async {
    await _characterModelDeletionAdapter.delete(character);
  }
}

// ignore_for_file: unused_element
final _stringListConverter = StringListConverter();
