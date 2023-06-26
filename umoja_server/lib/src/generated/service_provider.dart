/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

class ServiceProvider extends _i1.TableRow {
  ServiceProvider({
    int? id,
    required this.providerId,
    required this.adminId,
    required this.accountType,
    this.logo,
    this.tradingName,
    this.tradingCategory,
    this.org,
  }) : super(id);

  factory ServiceProvider.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return ServiceProvider(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      providerId: serializationManager
          .deserialize<String>(jsonSerialization['providerId']),
      adminId:
          serializationManager.deserialize<int>(jsonSerialization['adminId']),
      accountType: serializationManager
          .deserialize<String>(jsonSerialization['accountType']),
      logo:
          serializationManager.deserialize<String?>(jsonSerialization['logo']),
      tradingName: serializationManager
          .deserialize<String?>(jsonSerialization['tradingName']),
      tradingCategory: serializationManager
          .deserialize<String?>(jsonSerialization['tradingCategory']),
      org: serializationManager.deserialize<String?>(jsonSerialization['org']),
    );
  }

  static final t = ServiceProviderTable();

  String providerId;

  int adminId;

  String accountType;

  String? logo;

  String? tradingName;

  String? tradingCategory;

  String? org;

  @override
  String get tableName => 'service_provider';
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'providerId': providerId,
      'adminId': adminId,
      'accountType': accountType,
      'logo': logo,
      'tradingName': tradingName,
      'tradingCategory': tradingCategory,
      'org': org,
    };
  }

  @override
  Map<String, dynamic> toJsonForDatabase() {
    return {
      'id': id,
      'providerId': providerId,
      'adminId': adminId,
      'accountType': accountType,
      'logo': logo,
      'tradingName': tradingName,
      'tradingCategory': tradingCategory,
      'org': org,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      'id': id,
      'providerId': providerId,
      'adminId': adminId,
      'accountType': accountType,
      'logo': logo,
      'tradingName': tradingName,
      'tradingCategory': tradingCategory,
      'org': org,
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
      case 'providerId':
        providerId = value;
        return;
      case 'adminId':
        adminId = value;
        return;
      case 'accountType':
        accountType = value;
        return;
      case 'logo':
        logo = value;
        return;
      case 'tradingName':
        tradingName = value;
        return;
      case 'tradingCategory':
        tradingCategory = value;
        return;
      case 'org':
        org = value;
        return;
      default:
        throw UnimplementedError();
    }
  }

  static Future<List<ServiceProvider>> find(
    _i1.Session session, {
    ServiceProviderExpressionBuilder? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<ServiceProvider>(
      where: where != null ? where(ServiceProvider.t) : null,
      limit: limit,
      offset: offset,
      orderBy: orderBy,
      orderByList: orderByList,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<ServiceProvider?> findSingleRow(
    _i1.Session session, {
    ServiceProviderExpressionBuilder? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findSingleRow<ServiceProvider>(
      where: where != null ? where(ServiceProvider.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<ServiceProvider?> findById(
    _i1.Session session,
    int id,
  ) async {
    return session.db.findById<ServiceProvider>(id);
  }

  static Future<int> delete(
    _i1.Session session, {
    required ServiceProviderExpressionBuilder where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<ServiceProvider>(
      where: where(ServiceProvider.t),
      transaction: transaction,
    );
  }

  static Future<bool> deleteRow(
    _i1.Session session,
    ServiceProvider row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow(
      row,
      transaction: transaction,
    );
  }

  static Future<bool> update(
    _i1.Session session,
    ServiceProvider row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.update(
      row,
      transaction: transaction,
    );
  }

  static Future<void> insert(
    _i1.Session session,
    ServiceProvider row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert(
      row,
      transaction: transaction,
    );
  }

  static Future<int> count(
    _i1.Session session, {
    ServiceProviderExpressionBuilder? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<ServiceProvider>(
      where: where != null ? where(ServiceProvider.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }
}

typedef ServiceProviderExpressionBuilder = _i1.Expression Function(
    ServiceProviderTable);

class ServiceProviderTable extends _i1.Table {
  ServiceProviderTable() : super(tableName: 'service_provider');

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  final id = _i1.ColumnInt('id');

  final providerId = _i1.ColumnString('providerId');

  final adminId = _i1.ColumnInt('adminId');

  final accountType = _i1.ColumnString('accountType');

  final logo = _i1.ColumnString('logo');

  final tradingName = _i1.ColumnString('tradingName');

  final tradingCategory = _i1.ColumnString('tradingCategory');

  final org = _i1.ColumnString('org');

  @override
  List<_i1.Column> get columns => [
        id,
        providerId,
        adminId,
        accountType,
        logo,
        tradingName,
        tradingCategory,
        org,
      ];
}

@Deprecated('Use ServiceProviderTable.t instead.')
ServiceProviderTable tServiceProvider = ServiceProviderTable();
