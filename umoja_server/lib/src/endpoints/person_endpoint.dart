import 'package:serverpod/serverpod.dart';
import 'package:umoja_server/src/generated/person.dart';
import 'package:jaguar_jwt/jaguar_jwt.dart';
import 'package:umoja_server/src/generated/protocol.dart';

class PersonEndpoint extends Endpoint {
  Future<List<Person>> getAllPersons(
    Session session,
  ) async {
    var allPersons = await Person.find(session);
    return allPersons;
  }

  Future<String?> handleSignUp(Session session, Person person) async {
    try {
      session.log('handleSignUp is called. $person');

      // Check if the username is already taken
      final existingUser = await Person.findSingleRow(
        session,
        where: (user) => user.email.equals(person.email),
      );
      session.log('goot existingUser $existingUser');

      if (existingUser == null) {
        session.log('Username is already taken.');
      }
      session.log('createPerson called');
      await Person.insert(session, person);
      final user = await Person.findById(session, existingUser!.id as int);

      session.log('created Person $user');

      // Generate a token for the user
      JwtClaim claim = JwtClaim(
          subject: person.email.toString(),
          issuer: 'ComanLedger',
          audience: ['comanledger.io'],
          payload: user!.allToJson());

      // Create a new user

      var token = issueJwtHS256(claim, "jwtKey");
      session.log('created claim $token');

      return token;
    } catch (e) {
      session.log('catch errors');

      session.log(e.toString());
    } finally {}
    return null;
  }

  Future<String?> handleSignIn(
      Session session, String email, String password) async {
    try {
      session.log('handleSignIn is called.');
      session.log('goot user $email, $password');

      // Check if the username is already taken
      final user = await Person.findSingleRow(
        session,
        where: (user) =>
            user.email.equals(email) & user.password.equals(password),
      );
      session.log('goot user $user');
      if (user != null) {
        // Generate a token for the user
        JwtClaim claim = JwtClaim(
            subject: user.email.toString(),
            issuer: 'ComanLedger',
            audience: ['comanledger.io'],
            payload: user.allToJson());

        // Create a new user

        var token = issueJwtHS256(claim, "jwtKey");
        session.log('created claim $token');
        return token;
      }
    } catch (e) {
      session.log(e.toString());
    } finally {}
    return null;
  }

  Future<Person?> getPerson(Session session, int id) async {
    var result = await Person.findById(session, id);
    return result;
  }

  Future<bool> updatePerson(Session session, Person person) async {
    try {
      session.log('updatePerson called');
      await Person.update(session, person);
    } catch (e) {
      session.log(e.toString());
    } finally {}
    return true;
  }

  Future<bool> deletePerson(Session session, int id) async {
    var result = await Person.delete(session, where: (t) => t.id.equals(id));
    return result == 1;
  }
}
