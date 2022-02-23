import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class MyNumber {
  final int id;
  final int episode, n1, n2, n3, n4, n5, n6, bonus;

  MyNumber({required this.id, required this.episode, required this.n1,
    required this.n2, required this.n3, required this.n4, required this.n5,
    required this.n6, required this.bonus});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'episode': episode,
      'n1': n1,
      'n2': n2,
      'n3': n3,
      'n4': n4,
      'n5': n5,
      'n6': n6,
      'bonus': bonus,
    };
  }

  // 각 dog 정보를 보기 쉽도록 print 문을 사용하여 toString을 구현하세요
  @override
  String toString() {
    return 'MyNumber{id: $id, episode: $episode, n1: $n1, n2: $n2, n3: $n3, '
        'n4: $n4, n5: $n5, n6: $n6, bonus: $bonus}';
  }
}

void main() async {
  final database = openDatabase(
    // 데이터베이스 경로를 지정합니다. 참고: `path` 패키지의 `join` 함수를 사용하는 것이
    // 각 플랫폼 별로 경로가 제대로 생성됐는지 보장할 수 있는 가장 좋은 방법입니다.
    join(await getDatabasesPath(), 'number_database.db'),
    // 데이터베이스가 처음 생성될 때, 번호를 저장하기 위한 테이블을 생성합니다.
    onCreate: (db, version) {
      return db.execute(
        "CREATE TABLE numbers(id INTEGER PRIMARY KEY, episode INTEGER, n1 INTEGER, n2 INTEGER,"
            "n3 INTEGER, n4 INTEGER, n5 INTEGER, n6 INTEGER, bonus INTEGER)",
      );
    },
    // 버전을 설정하세요. onCreate 함수에서 수행되며 데이터베이스 업그레이드와 다운그레이드를
    // 수행하기 위한 경로를 제공합니다.
    version: 1,
  );

  //삽입
  Future<void> insertMyNumber(MyNumber number) async {
    // 데이터베이스 reference를 얻습니다.
    final Database db = await database;

    // MyNumber를 올바른 테이블에 추가하세요. 또한
    // `conflictAlgorithm`을 명시할 것입니다. 본 예제에서는
    // 만약 동일한 number가 여러번 추가되면, 이전 데이터를 덮어쓸 것입니다.
    await db.insert(
      'numbers',
      number.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  //db 출력
  Future<List<MyNumber>> numbers() async {
    final Database db = await database;

    // 모든 MyNumber를 얻기 위해 테이블에 질의합니다.
    final List<Map<String, dynamic>> maps = await db.query('numbers');

    // List<Map<String, dynamic>를 List<MyNumber>으로 변환합니다.
    return List.generate(maps.length, (i) {
      return MyNumber(
        id: maps[i]['id'],
        episode: maps[i]['episode'],
        n1: maps[i]['n1'],
        n2: maps[i]['n2'],
        n3: maps[i]['n3'],
        n4: maps[i]['n4'],
        n5: maps[i]['n5'],
        n6: maps[i]['n6'],
        bonus: maps[i]['bonus'],
      );
    });
  }

  final fido = MyNumber(
    id: 0,
    episode: 99,
    n1: 30,
    n2: 35,
    n3: 22,
    n4: 13,
    n5: 2,
    n6: 40,
    bonus: 5
  );

  await insertMyNumber(fido);
  print(await numbers());

  //수정
  Future<void> updateMyNumber(MyNumber number) async {
    final db = await database;

    // 주어진 MyNumber를 수정합니다.
    await db.update(
      'numbers',
      number.toMap(),
      // MyNumber의 id가 일치하는 지 확인합니다.
      where: "id = ?",
      // MyNumber의 id를 whereArg로 넘겨 SQL injection을 방지합니다.
      whereArgs: [number.id],
    );
  }

  //삭제
  Future<void> deleteMyNumber(int id) async {
    final db = await database;

    // 데이터베이스에서 MyNumber를 삭제합니다.
    await db.delete(
      'numbers',
      // 특정 dog를 제거하기 위해 `where` 절을 사용하세요
      where: "id = ?",
      // Dog의 id를 where의 인자로 넘겨 SQL injection을 방지합니다.
      whereArgs: [id],
    );
  }
}

