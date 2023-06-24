/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

class Commodity extends _i1.SerializableEntity {
  Commodity({
    this.id,
    required this.assetType,
    required this.accountId,
    required this.category,
    required this.name,
    required this.species,
    required this.marketPrice,
    required this.weight,
    required this.trackerId,
    required this.location,
    required this.imageUrl,
    required this.ownershipDeedUrl,
    required this.medicalCertificateUrl,
    required this.publicDescription,
    required this.tradingStatus,
    required this.orderTradingStep,
    required this.orderTrackerHash,
    required this.ownerOrg,
  });

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
          .deserialize<String>(jsonSerialization['species']),
      marketPrice: serializationManager
          .deserialize<double>(jsonSerialization['marketPrice']),
      weight:
          serializationManager.deserialize<double>(jsonSerialization['weight']),
      trackerId: serializationManager
          .deserialize<String>(jsonSerialization['trackerId']),
      location: serializationManager
          .deserialize<String>(jsonSerialization['location']),
      imageUrl: serializationManager
          .deserialize<String>(jsonSerialization['imageUrl']),
      ownershipDeedUrl: serializationManager
          .deserialize<String>(jsonSerialization['ownershipDeedUrl']),
      medicalCertificateUrl: serializationManager
          .deserialize<String>(jsonSerialization['medicalCertificateUrl']),
      publicDescription: serializationManager
          .deserialize<String>(jsonSerialization['publicDescription']),
      tradingStatus: serializationManager
          .deserialize<String>(jsonSerialization['tradingStatus']),
      orderTradingStep: serializationManager
          .deserialize<int>(jsonSerialization['orderTradingStep']),
      orderTrackerHash: serializationManager
          .deserialize<String>(jsonSerialization['orderTrackerHash']),
      ownerOrg: serializationManager
          .deserialize<String>(jsonSerialization['ownerOrg']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String assetType;

  String accountId;

  String category;

  String name;

  String species;

  double marketPrice;

  double weight;

  String trackerId;

  String location;

  String imageUrl;

  String ownershipDeedUrl;

  String medicalCertificateUrl;

  String publicDescription;

  String tradingStatus;

  int orderTradingStep;

  String orderTrackerHash;

  String ownerOrg;

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
}
