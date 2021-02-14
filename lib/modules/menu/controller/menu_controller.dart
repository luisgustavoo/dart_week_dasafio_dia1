import 'dart:convert';

import 'package:desafio_dia1/entities/menu.dart';
import 'package:injectable/injectable.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

part 'menu_controller.g.dart';

@Injectable()
class MenuController {

  @Route.get('/')
  Future<Response> findAll(Request request) async {
    final menus = List.generate(
        10,
        (index) => Menu(
            id: index,
            nome: 'Pizza $index',
            preco: double.tryParse(index.toString())));

    return await Response.ok(jsonEncode(menus?.map((m) => m.toMap())?.toList()));
  }


  Router get router => _$MenuControllerRouter(this);
}
