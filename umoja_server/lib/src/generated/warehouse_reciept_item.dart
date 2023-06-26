/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

class WarehouseRecieptItem extends _i1.TableRow {
  WarehouseRecieptItem({
    int? id,
    required this.recieptId,
    this.commodityName,
    this.commodityCategory,
    this.grade,
    this.gradingComments,
    this.recommendation,
    this.commodityWeight,
  }) : super(id);

  factory WarehouseRecieptItem.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return WarehouseRecieptItem(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      recieptId:
          serializationManager.deserialize<int>(jsonSerialization['recieptId']),
      commodityName: serializationManager
          .deserialize<String?>(jsonSerialization['commodityName']),
      commodityCategory: serializationManager
          .deserialize<String?>(jsonSerialization['commodityCategory']),
      grade:
          serializationManager.deserialize<String?>(jsonSerialization['grade']),
      gradingComments: serializationManager
          .deserialize<String?>(jsonSerialization['gradingComments']),
      recommendation: serializationManager
          .deserialize<String?>(jsonSerialization['recommendation']),
      commodityWeight: serializationManager
          .deserialize<int?>(jsonSerialization['commodityWeight']),
    );
  }

  static final t = WarehouseRecieptItemTable();

  int recieptId;

  String? commodityName;

  String? commodityCategory;

  String? grade;

  String? gradingComments;

  String? recommendation;

  int? commodityWeight;

  @override
  String get tableName => 'warehouse_reciept_item';
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'recieptId': recieptId,
      'commodityName': commodityName,
      'commodityCategory': commodityCategory,
      'grade': grade,
      'gradingComments': gradingComments,
      'recommendation': recommendation,
      'commodityWeight': commodityWeight,
    };
  }

  @override
  Map<String, dynamic> toJsonForDatabase() {
    return {
      'id': id,
      'recieptId': recieptId,
      'commodityName': commodityName,
      'commodityCategory': commodityCategory,
      'grade': grade,
      'gradingComments': gradingComments,
      'recommendation': recommendation,
      'commodityWeight': commodityWeight,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      'id': id,
      'recieptId': recieptId,
      'commodityName': commodityName,
      'commodityCategory': commodityCategory,
      'grade': grade,
      'gradingComments': gradingComments,
      'recommendation': recommendation,
      'commodityWeight': commodityWeight,
    };
  }

  @override
  void setColumn(
    String columnName,
    value,
  ) {
    switch (columnName) {
      case 'id':
        id = value;
        return;
      case 'recieptId':
        recieptId = value;
        return;
      case 'commodityName':
        commodityName = value;
        return;
      case 'commodityCategory':
        commodityCategory = value;
        return;
      case 'grade':
        grade = value;
        return;
      case 'gradingComments':
        gradingComments = value;
        return;
      case 'recommendation':
        recommendation = value;
        return;
      case 'commodityWeight':
        commodityWeight = value;
        return;
      default:
        throw UnimplementedError();
    }
  }

  static Future<List<WarehouseRecieptItem>> find(
    _i1.Session session, {
    WarehouseRecieptItemExpressionBuilder? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<WarehouseRecieptItem>(
      where: where != null ? where(WarehouseRecieptItem.t) : null,
      limit: limit,
      offset: offset,
      orderBy: orderBy,
      orderByList: orderByList,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<WarehouseRecieptItem?> findSingleRow(
    _i1.Session session, {
    WarehouseRecieptItemExpressionBuilder? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findSingleRow<WarehouseRecieptItem>(
      where: where != null ? where(WarehouseRecieptItem.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<WarehouseRecieptItem?> findById(
    _i1.Session session,
    int id,
  ) async {
    return session.db.findById<WarehouseRecieptItem>(id);
  }

  static Future<int> delete(
    _i1.Session session, {
    required WarehouseRecieptItemExpressionBuilder where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<WarehouseRecieptItem>(
      where: where(WarehouseRecieptItem.t),
      transaction: transaction,
    );
  }

  static Future<bool> deleteRow(
    _i1.Session session,
    WarehouseRecieptItem row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow(
      row,
      transaction: transaction,
    );
  }

  static Future<bool> update(
    _i1.Session session,
    WarehouseRecieptItem row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.update(
      row,
      transaction: transaction,
    );
  }

  static Future<void> insert(
    _i1.Session session,
    WarehouseRecieptItem row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert(
      row,
      transaction: transaction,
    );
  }

  static Future<int> count(
    _i1.Session session, {
    WarehouseRecieptItemExpressionBuilder? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<WarehouseRecieptItem>(
      where: where != null ? where(WarehouseRecieptItem.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }
}

typedef WarehouseRecieptItemExpressionBuilder = _i1.Expression Function(
    WarehouseRecieptItemTable);

class WarehouseRecieptItemTable extends _i1.Table {
  WarehouseRecieptItemTable() : super(tableName: 'warehouse_reciept_item');

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  final id = _i1.ColumnInt('id');

  final recieptId = _i1.ColumnInt('recieptId');

  final commodityName = _i1.ColumnString('commodityName');

  final commodityCategory = _i1.ColumnString('commodityCategory');

  final grade = _i1.ColumnString('grade');

  final gradingComments = _i1.ColumnString('gradingComments');

  final recommendation = _i1.ColumnString('recommendation');

  final commodityWeight = _i1.ColumnInt('commodityWeight');

  @override
  List<_i1.Column> get columns => [
        id,
        recieptId,
        commodityName,
        commodityCategory,
        grade,
        gradingComments,
        recommendation,
        commodityWeight,
      ];
}

@Deprecated('Use WarehouseRecieptItemTable.t instead.')
WarehouseRecieptItemTable tWarehouseRecieptItem = WarehouseRecieptItemTable();
