import 'package:serverpod/serverpod.dart';
import 'package:umoja_server/src/generated/protocol.dart';

class ServiceProviderEndpoint extends Endpoint {
  Future<List<ServiceProvider>> getAllServiceProviders(
    Session session,
  ) async {
    var allServiceProviders = await ServiceProvider.find(session);
    return allServiceProviders;
  }

  Future<Object?> createAccount(
      Session session, ServiceProvider account) async {
    try {
      // Check if the account is already taken
      final existingBusiness = await ServiceProvider.findSingleRow(
        session,
        where: (provider) =>
            provider.adminId.equals(account.adminId) &
            provider.tradingName.equals(account.tradingName),
      );
      if (existingBusiness != null) {
        session.log('serviceAccount is already taken.');
      }
      session.log('createServiceProvider called');
      await ServiceProvider.insert(session, account);
      final serviceAccount =
          await ServiceProvider.findById(session, existingBusiness!.id as int);
      return serviceAccount;
    } catch (e) {
      session.log(e.toString());
    } finally {}
    return null;
  }

  Future<ServiceProvider?> getServiceProvider(Session session, int id) async {
    var result = await ServiceProvider.findById(session, id);
    return result;
  }

  Future<bool> updateServiceProvider(
      Session session, ServiceProvider account) async {
    try {
      session.log('updateServiceProvider called');
      await ServiceProvider.update(session, account);
    } catch (e) {
      session.log(e.toString());
    } finally {}
    return true;
  }

  Future<bool> deleteServiceProvider(Session session, int id) async {
    var result =
        await ServiceProvider.delete(session, where: (t) => t.id.equals(id));
    return result == 1;
  }
}
