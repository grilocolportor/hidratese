import 'package:sqflite/sqflite.dart';

abstract class ISQLDataBaseHelper {
  Future<int> insert(Map<String, dynamic> row, String table);
  Future<int> insertDayleTarget(Map<String, dynamic> row, String table);
  Future<int?> queryRowCount(String table);
  Future<List<Map<String, dynamic>>> queryAllRows(String table);
  Future<List<Map<String, dynamic>>> queryAllRowsByDate(
      String table, String date);
  Future<int> update(Map<String, dynamic> row, int id, String table);
  Future<int> delete(int id, String table);
}

class DatabaseHelper implements ISQLDataBaseHelper {
  static Database? _database;

//  static final table = 'User';
  // ignore: non_constant_identifier_names
  static final table_segestao = 'Sugestao';

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  Future<Database> get database async {
    if (_database != null) return _database!;
    // instancia o db na primeira vez que for acessado
    _database = await _initDatabase();

    // ignore: unused_local_variable
    for (var row in (await _database!
        .query('sqlite_master', columns: ['type', 'name']))) {}

    return _database!;
  }

  // abre o banco de dados e o cria se ele não existir
  _initDatabase() async {
    return await openDatabase('Hidratese');
  }

  @override
  Future<int> insert(Map<String, dynamic> row, String table) async {
    Database db = await instance.database;
    return await db.insert(table, row);
  }

  @override
  Future<int> insertDayleTarget(Map<String, dynamic> row, String table) async {
    Database db = await instance.database;
    return await db.insert(table, row);
  }

  // Esse método usa uma consulta bruta para fornecer a contagem de linhas.
  @override
  Future<int?> queryRowCount(String table) async {
    Database db = await instance.database;
    return Sqflite.firstIntValue(
        await db.rawQuery('SELECT COUNT(*) FROM $table'));
  }

  // uma lista de valores-chave de colunade users.
  @override
  Future<List<Map<String, dynamic>>> queryAllRows(String table) async {
    Database db = await instance.database;
    return await db.query(table);
  }

  // uma lista de valores pela data users.
  @override
  Future<List<Map<String, dynamic>>> queryAllRowsByDate(
      String table, String date) async {
    Database db = await instance.database;
    // return await db
    //    .rawQuery("SELELCT * FROM $table WHERE date = '$date' ORDER BY time");
    return await db.query(table,
        where: 'date = ?', whereArgs: [date], orderBy: 'time');
    // return await db.query(table, orderBy: 'time');
  }

  //get by periodo 7 dias
  Future<List<Map<String, dynamic>>> queryAllRowsByPeriodic7() async {
    Database db = await instance.database;
    List<Map<String, dynamic>> d = await db.query('historico',
        columns: ['date', 'sum(ml)  as total'],
        groupBy: 'date',
        orderBy: 'date',
        limit: 7);

    return d;
    // return await db.rawQuery(
    //     "Select  date, sum(ml)  as total  from historico group by date order by date");
  }

  //get by periodo 7 dias
  Future<List<Map<String, dynamic>>> queryAllRowsByPeriodicMonth() async {
    Database db = await instance.database;
    return await db.query('historico',
        columns: ['date', 'sum(ml)  as total'],
        groupBy: 'date',
        orderBy: 'date');
    // return await db.rawQuery(
    //     "Select  date, sum(ml)  as total  from historico group by date order by date");
  }

  Future<double> getPercentagemDrinkedDayle(String date) async {
    Database db = await instance.database;
    List<Map<String, dynamic>> d = await db.query(
      'Dayle_target',
      where: 'date  = ? ',
      whereArgs: [date],
    );

    return 0.0;
  }

  // valores das colunas serão usados para atualizar a linha.
  @override
  Future<int> update(Map<String, dynamic> row, int id, String table) async {
    Database db = await instance.database;
    return await db.update(table, row, where: '$id = ?', whereArgs: [id]);
  }

  // Exclui a linha especificada pelo id. O número de linhas afetadas é
  // retornada. Isso deve ser igual a 1, contanto que a linha exista.
  @override
  Future<int> delete(int id, String table) async {
    Database db = await instance.database;
    return await db.delete(table, where: '$id = ?', whereArgs: [id]);
  }
}
