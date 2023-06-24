/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../endpoints/commodity_endpoint.dart' as _i2;
import '../endpoints/example_endpoint.dart' as _i3;
import 'package:umoja_server/src/generated/commodity.dart' as _i4;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'commodity': _i2.CommodityEndpoint()
        ..initialize(
          server,
          'commodity',
          null,
        ),
      'example': _i3.ExampleEndpoint()
        ..initialize(
          server,
          'example',
          null,
        ),
    };
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
              (endpoints['commodity'] as _i2.CommodityEndpoint)
                  .getAllCommodities(session),
        ),
        'createCommodity': _i1.MethodConnector(
          name: 'createCommodity',
          params: {
            'commodity': _i1.ParameterDescription(
              name: 'commodity',
              type: _i1.getType<_i4.Commodity>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['commodity'] as _i2.CommodityEndpoint).createCommodity(
            session,
            params['commodity'],
          ),
        ),
        'updateCommodity': _i1.MethodConnector(
          name: 'updateCommodity',
          params: {
            'commodity': _i1.ParameterDescription(
              name: 'commodity',
              type: _i1.getType<_i4.Commodity>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['commodity'] as _i2.CommodityEndpoint).updateCommodity(
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
              (endpoints['commodity'] as _i2.CommodityEndpoint).deleteCommodity(
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
              (endpoints['example'] as _i3.ExampleEndpoint).hello(
            session,
            params['name'],
          ),
        )
      },
    );
  }
}
