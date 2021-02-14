import 'dart:io';
import 'package:shelf/shelf.dart';

const _defaultCorsHeaders = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Methods': 'GET, POST, PATCH, PUT, DELETE, OPTIONS',
  'Access-Control-Allow-Header': '${HttpHeaders
      .contentTypeHeader}, ${HttpHeaders.authorizationHeader}',
};


Middleware cors({Map<String, String> headers = _defaultCorsHeaders}) {
  return (Handler innerHandler) {
    return (Request request) async {
      if (request.method == 'OPTIONS') {
        return Response(HttpStatus.ok, headers: headers);
      }

      final mapHeaders = <String, dynamic>{
        ...request?.headers,
        ...headers
      };

      final response = await innerHandler(request.change(headers: mapHeaders));
      return response.change(headers: headers);
    };
  };
}

Middleware defaultResponseContentType(String contentType){
  return (Handler innerHandler){
    return (Request request) async {
      final response = await innerHandler(request);
      final mapHeaders = <String, dynamic>{
        'content-type': contentType,
        ...response?.headers ?? {}
      };

      return response?.change(headers: mapHeaders) ?? Response.notFound('');
    };
  };
}