/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

class ServiceOrder extends _i1.TableRow {
  ServiceOrder({
    int? id,
    this.orderDate,
    required this.accountId,
    this.orderTrackerHash,
    required this.commodityId,
    this.commodityName,
    this.commodityCategory,
    this.commodityWeight,
    this.orderingAccountId,
    this.serviceInRequest,
    this.servingAccountId,
    this.servingStatus,
    this.servingStep,
    this.quantity,
    this.orderStatus,
    this.tradingStatus,
    this.status,
    this.orderStep,
    this.modifiedStatus,
    this.newOrderId,
    this.transporterDeliveryTime,
    this.transporterPickUpTime,
    this.transporterVehicleId,
  }) : super(id);

  factory ServiceOrder.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return ServiceOrder(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      orderDate: serializationManager
          .deserialize<String?>(jsonSerialization['orderDate']),
      accountId:
          serializationManager.deserialize<int>(jsonSerialization['accountId']),
      orderTrackerHash: serializationManager
          .deserialize<String?>(jsonSerialization['orderTrackerHash']),
      commodityId: serializationManager
          .deserialize<int>(jsonSerialization['commodityId']),
      commodityName: serializationManager
          .deserialize<String?>(jsonSerialization['commodityName']),
      commodityCategory: serializationManager
          .deserialize<String?>(jsonSerialization['commodityCategory']),
      commodityWeight: serializationManager
          .deserialize<int?>(jsonSerialization['commodityWeight']),
      orderingAccountId: serializationManager
          .deserialize<String?>(jsonSerialization['orderingAccountId']),
      serviceInRequest: serializationManager
          .deserialize<String?>(jsonSerialization['serviceInRequest']),
      servingAccountId: serializationManager
          .deserialize<String?>(jsonSerialization['servingAccountId']),
      servingStatus: serializationManager
          .deserialize<String?>(jsonSerialization['servingStatus']),
      servingStep: serializationManager
          .deserialize<int?>(jsonSerialization['servingStep']),
      quantity:
          serializationManager.deserialize<int?>(jsonSerialization['quantity']),
      orderStatus: serializationManager
          .deserialize<String?>(jsonSerialization['orderStatus']),
      tradingStatus: serializationManager
          .deserialize<String?>(jsonSerialization['tradingStatus']),
      status: serializationManager
          .deserialize<String?>(jsonSerialization['status']),
      orderStep: serializationManager
          .deserialize<int?>(jsonSerialization['orderStep']),
      modifiedStatus: serializationManager
          .deserialize<String?>(jsonSerialization['modifiedStatus']),
      newOrderId: serializationManager
          .deserialize<String?>(jsonSerialization['newOrderId']),
      transporterDeliveryTime: serializationManager
          .deserialize<String?>(jsonSerialization['transporterDeliveryTime']),
      transporterPickUpTime: serializationManager
          .deserialize<String?>(jsonSerialization['transporterPickUpTime']),
      transporterVehicleId: serializationManager
          .deserialize<String?>(jsonSerialization['transporterVehicleId']),
    );
  }

  static final t = ServiceOrderTable();

  String? orderDate;

  int accountId;

  String? orderTrackerHash;

  int commodityId;

  String? commodityName;

  String? commodityCategory;

  int? commodityWeight;

  String? orderingAccountId;

  String? serviceInRequest;

  String? servingAccountId;

  String? servingStatus;

  int? servingStep;

  int? quantity;

  String? orderStatus;

  String? tradingStatus;

  String? status;

  int? orderStep;

  String? modifiedStatus;

  String? newOrderId;

  String? transporterDeliveryTime;

  String? transporterPickUpTime;

  String? transporterVehicleId;

  @override
  String get tableName => 'service_order';
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'orderDate': orderDate,
      'accountId': accountId,
      'orderTrackerHash': orderTrackerHash,
      'commodityId': commodityId,
      'commodityName': commodityName,
      'commodityCategory': commodityCategory,
      'commodityWeight': commodityWeight,
      'orderingAccountId': orderingAccountId,
      'serviceInRequest': serviceInRequest,
      'servingAccountId': servingAccountId,
      'servingStatus': servingStatus,
      'servingStep': servingStep,
      'quantity': quantity,
      'orderStatus': orderStatus,
      'tradingStatus': tradingStatus,
      'status': status,
      'orderStep': orderStep,
      'modifiedStatus': modifiedStatus,
      'newOrderId': newOrderId,
      'transporterDeliveryTime': transporterDeliveryTime,
      'transporterPickUpTime': transporterPickUpTime,
      'transporterVehicleId': transporterVehicleId,
    };
  }

  @override
  Map<String, dynamic> toJsonForDatabase() {
    return {
      'id': id,
      'orderDate': orderDate,
      'accountId': accountId,
      'orderTrackerHash': orderTrackerHash,
      'commodityId': commodityId,
      'commodityName': commodityName,
      'commodityCategory': commodityCategory,
      'commodityWeight': commodityWeight,
      'orderingAccountId': orderingAccountId,
      'serviceInRequest': serviceInRequest,
      'servingAccountId': servingAccountId,
      'servingStatus': servingStatus,
      'servingStep': servingStep,
      'quantity': quantity,
      'orderStatus': orderStatus,
      'tradingStatus': tradingStatus,
      'status': status,
      'orderStep': orderStep,
      'modifiedStatus': modifiedStatus,
      'newOrderId': newOrderId,
      'transporterDeliveryTime': transporterDeliveryTime,
      'transporterPickUpTime': transporterPickUpTime,
      'transporterVehicleId': transporterVehicleId,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      'id': id,
      'orderDate': orderDate,
      'accountId': accountId,
      'orderTrackerHash': orderTrackerHash,
      'commodityId': commodityId,
      'commodityName': commodityName,
      'commodityCategory': commodityCategory,
      'commodityWeight': commodityWeight,
      'orderingAccountId': orderingAccountId,
      'serviceInRequest': serviceInRequest,
      'servingAccountId': servingAccountId,
      'servingStatus': servingStatus,
      'servingStep': servingStep,
      'quantity': quantity,
      'orderStatus': orderStatus,
      'tradingStatus': tradingStatus,
      'status': status,
      'orderStep': orderStep,
      'modifiedStatus': modifiedStatus,
      'newOrderId': newOrderId,
      'transporterDeliveryTime': transporterDeliveryTime,
      'transporterPickUpTime': transporterPickUpTime,
      'transporterVehicleId': transporterVehicleId,
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
      case 'orderDate':
        orderDate = value;
        return;
      case 'accountId':
        accountId = value;
        return;
      case 'orderTrackerHash':
        orderTrackerHash = value;
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
      case 'commodityWeight':
        commodityWeight = value;
        return;
      case 'orderingAccountId':
        orderingAccountId = value;
        return;
      case 'serviceInRequest':
        serviceInRequest = value;
        return;
      case 'servingAccountId':
        servingAccountId = value;
        return;
      case 'servingStatus':
        servingStatus = value;
        return;
      case 'servingStep':
        servingStep = value;
        return;
      case 'quantity':
        quantity = value;
        return;
      case 'orderStatus':
        orderStatus = value;
        return;
      case 'tradingStatus':
        tradingStatus = value;
        return;
      case 'status':
        status = value;
        return;
      case 'orderStep':
        orderStep = value;
        return;
      case 'modifiedStatus':
        modifiedStatus = value;
        return;
      case 'newOrderId':
        newOrderId = value;
        return;
      case 'transporterDeliveryTime':
        transporterDeliveryTime = value;
        return;
      case 'transporterPickUpTime':
        transporterPickUpTime = value;
        return;
      case 'transporterVehicleId':
        transporterVehicleId = value;
        return;
      default:
        throw UnimplementedError();
    }
  }

  static Future<List<ServiceOrder>> find(
    _i1.Session session, {
    ServiceOrderExpressionBuilder? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<ServiceOrder>(
      where: where != null ? where(ServiceOrder.t) : null,
      limit: limit,
      offset: offset,
      orderBy: orderBy,
      orderByList: orderByList,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<ServiceOrder?> findSingleRow(
    _i1.Session session, {
    ServiceOrderExpressionBuilder? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findSingleRow<ServiceOrder>(
      where: where != null ? where(ServiceOrder.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<ServiceOrder?> findById(
    _i1.Session session,
    int id,
  ) async {
    return session.db.findById<ServiceOrder>(id);
  }

  static Future<int> delete(
    _i1.Session session, {
    required ServiceOrderExpressionBuilder where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<ServiceOrder>(
      where: where(ServiceOrder.t),
      transaction: transaction,
    );
  }

  static Future<bool> deleteRow(
    _i1.Session session,
    ServiceOrder row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow(
      row,
      transaction: transaction,
    );
  }

  static Future<bool> update(
    _i1.Session session,
    ServiceOrder row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.update(
      row,
      transaction: transaction,
    );
  }

  static Future<void> insert(
    _i1.Session session,
    ServiceOrder row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert(
      row,
      transaction: transaction,
    );
  }

  static Future<int> count(
    _i1.Session session, {
    ServiceOrderExpressionBuilder? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<ServiceOrder>(
      where: where != null ? where(ServiceOrder.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }
}

typedef ServiceOrderExpressionBuilder = _i1.Expression Function(
    ServiceOrderTable);

class ServiceOrderTable extends _i1.Table {
  ServiceOrderTable() : super(tableName: 'service_order');

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  final id = _i1.ColumnInt('id');

  final orderDate = _i1.ColumnString('orderDate');

  final accountId = _i1.ColumnInt('accountId');

  final orderTrackerHash = _i1.ColumnString('orderTrackerHash');

  final commodityId = _i1.ColumnInt('commodityId');

  final commodityName = _i1.ColumnString('commodityName');

  final commodityCategory = _i1.ColumnString('commodityCategory');

  final commodityWeight = _i1.ColumnInt('commodityWeight');

  final orderingAccountId = _i1.ColumnString('orderingAccountId');

  final serviceInRequest = _i1.ColumnString('serviceInRequest');

  final servingAccountId = _i1.ColumnString('servingAccountId');

  final servingStatus = _i1.ColumnString('servingStatus');

  final servingStep = _i1.ColumnInt('servingStep');

  final quantity = _i1.ColumnInt('quantity');

  final orderStatus = _i1.ColumnString('orderStatus');

  final tradingStatus = _i1.ColumnString('tradingStatus');

  final status = _i1.ColumnString('status');

  final orderStep = _i1.ColumnInt('orderStep');

  final modifiedStatus = _i1.ColumnString('modifiedStatus');

  final newOrderId = _i1.ColumnString('newOrderId');

  final transporterDeliveryTime = _i1.ColumnString('transporterDeliveryTime');

  final transporterPickUpTime = _i1.ColumnString('transporterPickUpTime');

  final transporterVehicleId = _i1.ColumnString('transporterVehicleId');

  @override
  List<_i1.Column> get columns => [
        id,
        orderDate,
        accountId,
        orderTrackerHash,
        commodityId,
        commodityName,
        commodityCategory,
        commodityWeight,
        orderingAccountId,
        serviceInRequest,
        servingAccountId,
        servingStatus,
        servingStep,
        quantity,
        orderStatus,
        tradingStatus,
        status,
        orderStep,
        modifiedStatus,
        newOrderId,
        transporterDeliveryTime,
        transporterPickUpTime,
        transporterVehicleId,
      ];
}

@Deprecated('Use ServiceOrderTable.t instead.')
ServiceOrderTable tServiceOrder = ServiceOrderTable();
