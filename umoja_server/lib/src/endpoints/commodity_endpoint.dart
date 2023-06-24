import 'package:serverpod/serverpod.dart';
import 'package:umoja_server/src/generated/commodity.dart';

class CommodityEndpoint extends Endpoint {
  Future<List<Commodity>> getAllCommodities(
    Session session,
  ) async {
    var allCommodities = await Commodity.find(session);
    return allCommodities;
  }

  Future<bool> createCommodity(Session session, Commodity commodity) async {
    try {
      session.log('createCommodity called');
      await Commodity.insert(session, commodity);
    } catch (e) {
      session.log(e.toString());
    } finally {}
    return true;
  }

  Future<Commodity?> getCommodity(Session session, int id) async {
    var result = await Commodity.findById(session, id);
    return result;
  }

  Future<bool> updateCommodity(Session session, Commodity commodity) async {
    var result = await Commodity.update(session, commodity);
    return result;
  }

  Future<bool> deleteCommodity(Session session, int id) async {
    var result = await Commodity.delete(session, where: (t) => t.id.equals(id));
    return result == 1;
  }
}
