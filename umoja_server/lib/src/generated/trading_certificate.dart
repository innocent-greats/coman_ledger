/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

class TradingCertificate extends _i1.TableRow {
  TradingCertificate({
    int? id,
    this.createdDate,
    this.orderTrackerHash,
    required this.recieptId,
    required this.recieptItemId,
    this.certificateTag,
    this.tradingStatus,
    this.tokenValue,
    this.certificaterl,
    this.publicDescription,
    required this.holderAccountId,
    required this.issuerAccountId,
    this.holderOrg,
  }) : super(id);

  factory TradingCertificate.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return TradingCertificate(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      createdDate: serializationManager
          .deserialize<String?>(jsonSerialization['createdDate']),
      orderTrackerHash: serializationManager
          .deserialize<String?>(jsonSerialization['orderTrackerHash']),
      recieptId:
          serializationManager.deserialize<int>(jsonSerialization['recieptId']),
      recieptItemId: serializationManager
          .deserialize<int>(jsonSerialization['recieptItemId']),
      certificateTag: serializationManager
          .deserialize<String?>(jsonSerialization['certificateTag']),
      tradingStatus: serializationManager
          .deserialize<String?>(jsonSerialization['tradingStatus']),
      tokenValue: serializationManager
          .deserialize<String?>(jsonSerialization['tokenValue']),
      certificaterl: serializationManager
          .deserialize<String?>(jsonSerialization['certificaterl']),
      publicDescription: serializationManager
          .deserialize<String?>(jsonSerialization['publicDescription']),
      holderAccountId: serializationManager
          .deserialize<int>(jsonSerialization['holderAccountId']),
      issuerAccountId: serializationManager
          .deserialize<int>(jsonSerialization['issuerAccountId']),
      holderOrg: serializationManager
          .deserialize<String?>(jsonSerialization['holderOrg']),
    );
  }

  static final t = TradingCertificateTable();

  String? createdDate;

  String? orderTrackerHash;

  int recieptId;

  int recieptItemId;

  String? certificateTag;

  String? tradingStatus;

  String? tokenValue;

  String? certificaterl;

  String? publicDescription;

  int holderAccountId;

  int issuerAccountId;

  String? holderOrg;

  @override
  String get tableName => 'trading_certificate';
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'createdDate': createdDate,
      'orderTrackerHash': orderTrackerHash,
      'recieptId': recieptId,
      'recieptItemId': recieptItemId,
      'certificateTag': certificateTag,
      'tradingStatus': tradingStatus,
      'tokenValue': tokenValue,
      'certificaterl': certificaterl,
      'publicDescription': publicDescription,
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
      'orderTrackerHash': orderTrackerHash,
      'recieptId': recieptId,
      'recieptItemId': recieptItemId,
      'certificateTag': certificateTag,
      'tradingStatus': tradingStatus,
      'tokenValue': tokenValue,
      'certificaterl': certificaterl,
      'publicDescription': publicDescription,
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
      'orderTrackerHash': orderTrackerHash,
      'recieptId': recieptId,
      'recieptItemId': recieptItemId,
      'certificateTag': certificateTag,
      'tradingStatus': tradingStatus,
      'tokenValue': tokenValue,
      'certificaterl': certificaterl,
      'publicDescription': publicDescription,
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
      case 'orderTrackerHash':
        orderTrackerHash = value;
        return;
      case 'recieptId':
        recieptId = value;
        return;
      case 'recieptItemId':
        recieptItemId = value;
        return;
      case 'certificateTag':
        certificateTag = value;
        return;
      case 'tradingStatus':
        tradingStatus = value;
        return;
      case 'tokenValue':
        tokenValue = value;
        return;
      case 'certificaterl':
        certificaterl = value;
        return;
      case 'publicDescription':
        publicDescription = value;
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

  static Future<List<TradingCertificate>> find(
    _i1.Session session, {
    TradingCertificateExpressionBuilder? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<TradingCertificate>(
      where: where != null ? where(TradingCertificate.t) : null,
      limit: limit,
      offset: offset,
      orderBy: orderBy,
      orderByList: orderByList,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<TradingCertificate?> findSingleRow(
    _i1.Session session, {
    TradingCertificateExpressionBuilder? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findSingleRow<TradingCertificate>(
      where: where != null ? where(TradingCertificate.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<TradingCertificate?> findById(
    _i1.Session session,
    int id,
  ) async {
    return session.db.findById<TradingCertificate>(id);
  }

  static Future<int> delete(
    _i1.Session session, {
    required TradingCertificateExpressionBuilder where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<TradingCertificate>(
      where: where(TradingCertificate.t),
      transaction: transaction,
    );
  }

  static Future<bool> deleteRow(
    _i1.Session session,
    TradingCertificate row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow(
      row,
      transaction: transaction,
    );
  }

  static Future<bool> update(
    _i1.Session session,
    TradingCertificate row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.update(
      row,
      transaction: transaction,
    );
  }

  static Future<void> insert(
    _i1.Session session,
    TradingCertificate row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert(
      row,
      transaction: transaction,
    );
  }

  static Future<int> count(
    _i1.Session session, {
    TradingCertificateExpressionBuilder? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<TradingCertificate>(
      where: where != null ? where(TradingCertificate.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }
}

typedef TradingCertificateExpressionBuilder = _i1.Expression Function(
    TradingCertificateTable);

class TradingCertificateTable extends _i1.Table {
  TradingCertificateTable() : super(tableName: 'trading_certificate');

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  final id = _i1.ColumnInt('id');

  final createdDate = _i1.ColumnString('createdDate');

  final orderTrackerHash = _i1.ColumnString('orderTrackerHash');

  final recieptId = _i1.ColumnInt('recieptId');

  final recieptItemId = _i1.ColumnInt('recieptItemId');

  final certificateTag = _i1.ColumnString('certificateTag');

  final tradingStatus = _i1.ColumnString('tradingStatus');

  final tokenValue = _i1.ColumnString('tokenValue');

  final certificaterl = _i1.ColumnString('certificaterl');

  final publicDescription = _i1.ColumnString('publicDescription');

  final holderAccountId = _i1.ColumnInt('holderAccountId');

  final issuerAccountId = _i1.ColumnInt('issuerAccountId');

  final holderOrg = _i1.ColumnString('holderOrg');

  @override
  List<_i1.Column> get columns => [
        id,
        createdDate,
        orderTrackerHash,
        recieptId,
        recieptItemId,
        certificateTag,
        tradingStatus,
        tokenValue,
        certificaterl,
        publicDescription,
        holderAccountId,
        issuerAccountId,
        holderOrg,
      ];
}

@Deprecated('Use TradingCertificateTable.t instead.')
TradingCertificateTable tTradingCertificate = TradingCertificateTable();
