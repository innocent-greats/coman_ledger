/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

class WarehouseReciept extends _i1.TableRow {
  WarehouseReciept({
    int? id,
    required this.createdDate,
    this.certificateTag,
    this.orderTrackerHash,
    required this.orderId,
    required this.commodityId,
    this.commodityName,
    this.commodityCategory,
    this.orderStatus,
    this.tradingStatus,
    required this.holderAccountId,
    required this.issuerAccountId,
    this.holderOrg,
  }) : super(id);

  factory WarehouseReciept.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return WarehouseReciept(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      createdDate: serializationManager
          .deserialize<DateTime>(jsonSerialization['createdDate']),
      certificateTag: serializationManager
          .deserialize<String?>(jsonSerialization['certificateTag']),
      orderTrackerHash: serializationManager
          .deserialize<String?>(jsonSerialization['orderTrackerHash']),
      orderId:
          serializationManager.deserialize<int>(jsonSerialization['orderId']),
      commodityId: serializationManager
          .deserialize<int>(jsonSerialization['commodityId']),
      commodityName: serializationManager
          .deserialize<String?>(jsonSerialization['commodityName']),
      commodityCategory: serializationManager
          .deserialize<String?>(jsonSerialization['commodityCategory']),
      orderStatus: serializationManager
          .deserialize<String?>(jsonSerialization['orderStatus']),
      tradingStatus: serializationManager
          .deserialize<String?>(jsonSerialization['tradingStatus']),
      holderAccountId: serializationManager
          .deserialize<int>(jsonSerialization['holderAccountId']),
      issuerAccountId: serializationManager
          .deserialize<int>(jsonSerialization['issuerAccountId']),
      holderOrg: serializationManager
          .deserialize<String?>(jsonSerialization['holderOrg']),
    );
  }

  static final t = WarehouseRecieptTable();

  DateTime createdDate;

  String? certificateTag;

  String? orderTrackerHash;

  int orderId;

  int commodityId;

  String? commodityName;

  String? commodityCategory;

  String? orderStatus;

  String? tradingStatus;

  int holderAccountId;

  int issuerAccountId;

  String? holderOrg;

  @override
  String get tableName => 'warehouse_reciept';
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'createdDate': createdDate,
      'certificateTag': certificateTag,
      'orderTrackerHash': orderTrackerHash,
      'orderId': orderId,
      'commodityId': commodityId,
      'commodityName': commodityName,
      'commodityCategory': commodityCategory,
      'orderStatus': orderStatus,
      'tradingStatus': tradingStatus,
      'holderAccountId': holderAccountId,
      'issuerAccountId': issuerAccountId,
      'holderOrg': holderOrg,
    };
  }

  @override
  Map<String, dynamic> toJsonForDatabase() {
    return {
      'id': id,
      'createdDate': createdDate,
      'certificateTag': certificateTag,
      'orderTrackerHash': orderTrackerHash,
      'orderId': orderId,
      'commodityId': commodityId,
      'commodityName': commodityName,
      'commodityCategory': commodityCategory,
      'orderStatus': orderStatus,
      'tradingStatus': tradingStatus,
      'holderAccountId': holderAccountId,
      'issuerAccountId': issuerAccountId,
      'holderOrg': holderOrg,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      'id': id,
      'createdDate': createdDate,
      'certificateTag': certificateTag,
      'orderTrackerHash': orderTrackerHash,
      'orderId': orderId,
      'commodityId': commodityId,
      'commodityName': commodityName,
      'commodityCategory': commodityCategory,
      'orderStatus': orderStatus,
      'tradingStatus': tradingStatus,
      'holderAccountId': holderAccountId,
      'issuerAccountId': issuerAccountId,
      'holderOrg': holderOrg,
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
      case 'createdDate':
        createdDate = value;
        return;
      case 'certificateTag':
        certificateTag = value;
        return;
      case 'orderTrackerHash':
        orderTrackerHash = value;
        return;
      case 'orderId':
        orderId = value;
        return;
      case 'commodityId':
        commodityId = value;
        return;
      case 'commodityName':
        commodityName = value;
        return;
      case 'commodityCategory':
        commodityCategory = value;
        return;
      case 'orderStatus':
        orderStatus = value;
        return;
      case 'tradingStatus':
        tradingStatus = value;
        return;
      case 'holderAccountId':
        holderAccountId = value;
        return;
      case 'issuerAccountId':
        issuerAccountId = value;
        return;
      case 'holderOrg':
        holderOrg = value;
        return;
      default:
        throw UnimplementedError();
    }
  }

  static Future<List<WarehouseReciept>> find(
    _i1.Session session, {
    WarehouseRecieptExpressionBuilder? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<WarehouseReciept>(
      where: where != null ? where(WarehouseReciept.t) : null,
      limit: limit,
      offset: offset,
      orderBy: orderBy,
      orderByList: orderByList,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<WarehouseReciept?> findSingleRow(
    _i1.Session session, {
    WarehouseRecieptExpressionBuilder? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findSingleRow<WarehouseReciept>(
      where: where != null ? where(WarehouseReciept.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<WarehouseReciept?> findById(
    _i1.Session session,
    int id,
  ) async {
    return session.db.findById<WarehouseReciept>(id);
  }

  static Future<int> delete(
    _i1.Session session, {
    required WarehouseRecieptExpressionBuilder where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<WarehouseReciept>(
      where: where(WarehouseReciept.t),
      transaction: transaction,
    );
  }

  static Future<bool> deleteRow(
    _i1.Session session,
    WarehouseReciept row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow(
      row,
      transaction: transaction,
    );
  }

  static Future<bool> update(
    _i1.Session session,
    WarehouseReciept row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.update(
      row,
      transaction: transaction,
    );
  }

  static Future<void> insert(
    _i1.Session session,
    WarehouseReciept row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert(
      row,
      transaction: transaction,
    );
  }

  static Future<int> count(
    _i1.Session session, {
    WarehouseRecieptExpressionBuilder? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<WarehouseReciept>(
      where: where != null ? where(WarehouseReciept.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }
}

typedef WarehouseRecieptExpressionBuilder = _i1.Expression Function(
    WarehouseRecieptTable);

class WarehouseRecieptTable extends _i1.Table {
  WarehouseRecieptTable() : super(tableName: 'warehouse_reciept');

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  final id = _i1.ColumnInt('id');

  final createdDate = _i1.ColumnDateTime('createdDate');

  final certificateTag = _i1.ColumnString('certificateTag');

  final orderTrackerHash = _i1.ColumnString('orderTrackerHash');

  final orderId = _i1.ColumnInt('orderId');

  final commodityId = _i1.ColumnInt('commodityId');

  final commodityName = _i1.ColumnString('commodityName');

  final commodityCategory = _i1.ColumnString('commodityCategory');

  final orderStatus = _i1.ColumnString('orderStatus');

  final tradingStatus = _i1.ColumnString('tradingStatus');

  final holderAccountId = _i1.ColumnInt('holderAccountId');

  final issuerAccountId = _i1.ColumnInt('issuerAccountId');

  final holderOrg = _i1.ColumnString('holderOrg');

  @override
  List<_i1.Column> get columns => [
        id,
        createdDate,
        certificateTag,
        orderTrackerHash,
        orderId,
        commodityId,
        commodityName,
        commodityCategory,
        orderStatus,
        tradingStatus,
        holderAccountId,
        issuerAccountId,
        holderOrg,
      ];
}

@Deprecated('Use WarehouseRecieptTable.t instead.')
WarehouseRecieptTable tWarehouseReciept = WarehouseRecieptTable();
