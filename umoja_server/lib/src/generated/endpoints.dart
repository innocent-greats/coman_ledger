/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../endpoints/business_account_endpoint.dart' as _i2;
import '../endpoints/commodity_endpoint.dart' as _i3;
import '../endpoints/example_endpoint.dart' as _i4;
import '../endpoints/person_endpoint.dart' as _i5;
import 'package:umoja_server/src/generated/service_provider.dart' as _i6;
import 'package:umoja_server/src/generated/commodity.dart' as _i7;
import 'package:umoja_server/src/generated/person.dart' as _i8;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'serviceProvider': _i2.ServiceProviderEndpoint()
        ..initialize(
          server,
          'serviceProvider',
          null,
        ),
      'commodity': _i3.CommodityEndpoint()
        ..initialize(
          server,
          'commodity',
          null,
        ),
      'example': _i4.ExampleEndpoint()
        ..initialize(
          server,
          'example',
          null,
        ),
      'person': _i5.PersonEndpoint()
        ..initialize(
          server,
          'person',
          null,
        ),
    };
    connectors['serviceProvider'] = _i1.EndpointConnector(
      name: 'serviceProvider',
      endpoint: endpoints['serviceProvider']!,
      methodConnectors: {
        'getAllServiceProviders': _i1.MethodConnector(
          name: 'getAllServiceProviders',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['serviceProvider'] as _i2.ServiceProviderEndpoint)
                  .getAllServiceProviders(session),
        ),
        'createAccount': _i1.MethodConnector(
          name: 'createAccount',
          params: {
            'account': _i1.ParameterDescription(
              name: 'account',
              type: _i1.getType<_i6.ServiceProvider>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['serviceProvider'] as _i2.ServiceProviderEndpoint)
                  .createAccount(
            session,
            params['account'],
          ),
        ),
        'getServiceProvider': _i1.MethodConnector(
          name: 'getServiceProvider',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['serviceProvider'] as _i2.ServiceProviderEndpoint)
                  .getServiceProvider(
            session,
            params['id'],
          ),
        ),
        'updateServiceProvider': _i1.MethodConnector(
          name: 'updateServiceProvider',
          params: {
            'account': _i1.ParameterDescription(
              name: 'account',
              type: _i1.getType<_i6.ServiceProvider>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['serviceProvider'] as _i2.ServiceProviderEndpoint)
                  .updateServiceProvider(
            session,
            params['account'],
          ),
        ),
        'deleteServiceProvider': _i1.MethodConnector(
          name: 'deleteServiceProvider',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['serviceProvider'] as _i2.ServiceProviderEndpoint)
                  .deleteServiceProvider(
            session,
            params['id'],
          ),
        ),
      },
    );
    connectors['commodity'] = _i1.EndpointConnector(
      name: 'commodity',
      endpoint: endpoints['commodity']!,
      methodConnectors: {
        'getAllCommodities': _i1.MethodConnector(
          name: 'getAllCommodities',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['commodity'] as _i3.CommodityEndpoint)
                  .getAllCommodities(session),
        ),
        'createCommodity': _i1.MethodConnector(
          name: 'createCommodity',
          params: {
            'commodity': _i1.ParameterDescription(
              name: 'commodity',
              type: _i1.getType<_i7.Commodity>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['commodity'] as _i3.CommodityEndpoint).createCommodity(
            session,
            params['commodity'],
          ),
        ),
        'getCommodity': _i1.MethodConnector(
          name: 'getCommodity',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['commodity'] as _i3.CommodityEndpoint).getCommodity(
            session,
            params['id'],
          ),
        ),
        'updateCommodity': _i1.MethodConnector(
          name: 'updateCommodity',
          params: {
            'commodity': _i1.ParameterDescription(
              name: 'commodity',
              type: _i1.getType<_i7.Commodity>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['commodity'] as _i3.CommodityEndpoint).updateCommodity(
            session,
            params['commodity'],
          ),
        ),
        'deleteCommodity': _i1.MethodConnector(
          name: 'deleteCommodity',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['commodity'] as _i3.CommodityEndpoint).deleteCommodity(
            session,
            params['id'],
          ),
        ),
      },
    );
    connectors['example'] = _i1.EndpointConnector(
      name: 'example',
      endpoint: endpoints['example']!,
      methodConnectors: {
        'hello': _i1.MethodConnector(
          name: 'hello',
          params: {
            'name': _i1.ParameterDescription(
              name: 'name',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['example'] as _i4.ExampleEndpoint).hello(
            session,
            params['name'],
          ),
        )
      },
    );
    connectors['person'] = _i1.EndpointConnector(
      name: 'person',
      endpoint: endpoints['person']!,
      methodConnectors: {
        'getAllPersons': _i1.MethodConnector(
          name: 'getAllPersons',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['person'] as _i5.PersonEndpoint)
                  .getAllPersons(session),
        ),
        'handleSignUp': _i1.MethodConnector(
          name: 'handleSignUp',
          params: {
            'person': _i1.ParameterDescription(
              name: 'person',
              type: _i1.getType<_i8.Person>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['person'] as _i5.PersonEndpoint).handleSignUp(
            session,
            params['person'],
          ),
        ),
        'handleSignIn': _i1.MethodConnector(
          name: 'handleSignIn',
          params: {
            'email': _i1.ParameterDescription(
              name: 'email',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'password': _i1.ParameterDescription(
              name: 'password',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['person'] as _i5.PersonEndpoint).handleSignIn(
            session,
            params['email'],
            params['password'],
          ),
        ),
        'getPerson': _i1.MethodConnector(
          name: 'getPerson',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['person'] as _i5.PersonEndpoint).getPerson(
            session,
            params['id'],
          ),
        ),
        'updatePerson': _i1.MethodConnector(
          name: 'updatePerson',
          params: {
            'person': _i1.ParameterDescription(
              name: 'person',
              type: _i1.getType<_i8.Person>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['person'] as _i5.PersonEndpoint).updatePerson(
            session,
            params['person'],
          ),
        ),
        'deletePerson': _i1.MethodConnector(
          name: 'deletePerson',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['person'] as _i5.PersonEndpoint).deletePerson(
            session,
            params['id'],
          ),
        ),
      },
    );
  }
}
