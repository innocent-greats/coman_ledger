/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

class Commodity extends _i1.TableRow {
  Commodity({
    int? id,
    required this.assetType,
    required this.accountId,
    required this.category,
    required this.name,
    this.species,
    this.marketPrice,
    required this.weight,
    this.trackerId,
    this.location,
    this.imageUrl,
    this.ownershipDeedUrl,
    this.medicalCertificateUrl,
    required this.publicDescription,
    this.tradingStatus,
    this.orderTradingStep,
    this.orderTrackerHash,
    this.ownerOrg,
  }) : super(id);

  factory Commodity.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return Commodity(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      assetType: serializationManager
          .deserialize<String>(jsonSerialization['assetType']),
      accountId: serializationManager
          .deserialize<String>(jsonSerialization['accountId']),
      category: serializationManager
          .deserialize<String>(jsonSerialization['category']),
      name: serializationManager.deserialize<String>(jsonSerialization['name']),
      species: serializationManager
          .deserialize<String?>(jsonSerialization['species']),
      marketPrice: serializationManager
          .deserialize<double?>(jsonSerialization['marketPrice']),
      weight:
          serializationManager.deserialize<double>(jsonSerialization['weight']),
      trackerId: serializationManager
          .deserialize<String?>(jsonSerialization['trackerId']),
      location: serializationManager
          .deserialize<String?>(jsonSerialization['location']),
      imageUrl: serializationManager
          .deserialize<String?>(jsonSerialization['imageUrl']),
      ownershipDeedUrl: serializationManager
          .deserialize<String?>(jsonSerialization['ownershipDeedUrl']),
      medicalCertificateUrl: serializationManager
          .deserialize<String?>(jsonSerialization['medicalCertificateUrl']),
      publicDescription: serializationManager
          .deserialize<String>(jsonSerialization['publicDescription']),
      tradingStatus: serializationManager
          .deserialize<String?>(jsonSerialization['tradingStatus']),
      orderTradingStep: serializationManager
          .deserialize<int?>(jsonSerialization['orderTradingStep']),
      orderTrackerHash: serializationManager
          .deserialize<String?>(jsonSerialization['orderTrackerHash']),
      ownerOrg: serializationManager
          .deserialize<String?>(jsonSerialization['ownerOrg']),
    );
  }

  static final t = CommodityTable();

  String assetType;

  String accountId;

  String category;

  String name;

  String? species;

  double? marketPrice;

  double weight;

  String? trackerId;

  String? location;

  String? imageUrl;

  String? ownershipDeedUrl;

  String? medicalCertificateUrl;

  String publicDescription;

  String? tradingStatus;

  int? orderTradingStep;

  String? orderTrackerHash;

  String? ownerOrg;

  @override
  String get tableName => 'commodity';
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'assetType': assetType,
      'accountId': accountId,
      'category': category,
      'name': name,
      'species': species,
      'marketPrice': marketPrice,
      'weight': weight,
      'trackerId': trackerId,
      'location': location,
      'imageUrl': imageUrl,
      'ownershipDeedUrl': ownershipDeedUrl,
      'medicalCertificateUrl': medicalCertificateUrl,
      'publicDescription': publicDescription,
      'tradingStatus': tradingStatus,
      'orderTradingStep': orderTradingStep,
      'orderTrackerHash': orderTrackerHash,
      'ownerOrg': ownerOrg,
    };
  }

  @override
  Map<String, dynamic> toJsonForDatabase() {
    return {
      'id': id,
      'assetType': assetType,
      'accountId': accountId,
      'category': category,
      'name': name,
      'species': species,
      'marketPrice': marketPrice,
      'weight': weight,
      'trackerId': trackerId,
      'location': location,
      'imageUrl': imageUrl,
      'ownershipDeedUrl': ownershipDeedUrl,
      'medicalCertificateUrl': medicalCertificateUrl,
      'publicDescription': publicDescription,
      'tradingStatus': tradingStatus,
      'orderTradingStep': orderTradingStep,
      'orderTrackerHash': orderTrackerHash,
      'ownerOrg': ownerOrg,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      'id': id,
      'assetType': assetType,
      'accountId': accountId,
      'category': category,
      'name': name,
      'species': species,
      'marketPrice': marketPrice,
      'weight': weight,
      'trackerId': trackerId,
      'location': location,
      'imageUrl': imageUrl,
      'ownershipDeedUrl': ownershipDeedUrl,
      'medicalCertificateUrl': medicalCertificateUrl,
      'publicDescription': publicDescription,
      'tradingStatus': tradingStatus,
      'orderTradingStep': orderTradingStep,
      'orderTrackerHash': orderTrackerHash,
      'ownerOrg': ownerOrg,
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
      case 'assetType':
        assetType = value;
        return;
      case 'accountId':
        accountId = value;
        return;
      case 'category':
        category = value;
        return;
      case 'name':
        name = value;
        return;
      case 'species':
        species = value;
        return;
      case 'marketPrice':
        marketPrice = value;
        return;
      case 'weight':
        weight = value;
        return;
      case 'trackerId':
        trackerId = value;
        return;
      case 'location':
        location = value;
        return;
      case 'imageUrl':
        imageUrl = value;
        return;
      case 'ownershipDeedUrl':
        ownershipDeedUrl = value;
        return;
      case 'medicalCertificateUrl':
        medicalCertificateUrl = value;
        return;
      case 'publicDescription':
        publicDescription = value;
        return;
      case 'tradingStatus':
        tradingStatus = value;
        return;
      case 'orderTradingStep':
        orderTradingStep = value;
        return;
      case 'orderTrackerHash':
        orderTrackerHash = value;
        return;
      case 'ownerOrg':
        ownerOrg = value;
        return;
      default:
        throw UnimplementedError();
    }
  }

  static Future<List<Commodity>> find(
    _i1.Session session, {
    CommodityExpressionBuilder? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Commodity>(
      where: where != null ? where(Commodity.t) : null,
      limit: limit,
      offset: offset,
      orderBy: orderBy,
      orderByList: orderByList,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<Commodity?> findSingleRow(
    _i1.Session session, {
    CommodityExpressionBuilder? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findSingleRow<Commodity>(
      where: where != null ? where(Commodity.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<Commodity?> findById(
    _i1.Session session,
    int id,
  ) async {
    return session.db.findById<Commodity>(id);
  }

  static Future<int> delete(
    _i1.Session session, {
    required CommodityExpressionBuilder where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Commodity>(
      where: where(Commodity.t),
      transaction: transaction,
    );
  }

  static Future<bool> deleteRow(
    _i1.Session session,
    Commodity row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow(
      row,
      transaction: transaction,
    );
  }

  static Future<bool> update(
    _i1.Session session,
    Commodity row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.update(
      row,
      transaction: transaction,
    );
  }

  static Future<void> insert(
    _i1.Session session,
    Commodity row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert(
      row,
      transaction: transaction,
    );
  }

  static Future<int> count(
    _i1.Session session, {
    CommodityExpressionBuilder? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Commodity>(
      where: where != null ? where(Commodity.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }
}

typedef CommodityExpressionBuilder = _i1.Expression Function(CommodityTable);

class CommodityTable extends _i1.Table {
  CommodityTable() : super(tableName: 'commodity');

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  final id = _i1.ColumnInt('id');

  final assetType = _i1.ColumnString('assetType');

  final accountId = _i1.ColumnString('accountId');

  final category = _i1.ColumnString('category');

  final name = _i1.ColumnString('name');

  final species = _i1.ColumnString('species');

  final marketPrice = _i1.ColumnDouble('marketPrice');

  final weight = _i1.ColumnDouble('weight');

  final trackerId = _i1.ColumnString('trackerId');

  final location = _i1.ColumnString('location');

  final imageUrl = _i1.ColumnString('imageUrl');

  final ownershipDeedUrl = _i1.ColumnString('ownershipDeedUrl');

  final medicalCertificateUrl = _i1.ColumnString('medicalCertificateUrl');

  final publicDescription = _i1.ColumnString('publicDescription');

  final tradingStatus = _i1.ColumnString('tradingStatus');

  final orderTradingStep = _i1.ColumnInt('orderTradingStep');

  final orderTrackerHash = _i1.ColumnString('orderTrackerHash');

  final ownerOrg = _i1.ColumnString('ownerOrg');

  @override
  List<_i1.Column> get columns => [
        id,
        assetType,
        accountId,
        category,
        name,
        species,
        marketPrice,
        weight,
        trackerId,
        location,
        imageUrl,
        ownershipDeedUrl,
        medicalCertificateUrl,
        publicDescription,
        tradingStatus,
        orderTradingStep,
        orderTrackerHash,
        ownerOrg,
      ];
}

@Deprecated('Use CommodityTable.t instead.')
CommodityTable tCommodity = CommodityTable();
