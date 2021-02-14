import 'package:desafio_dia1/application/routers/i_router_configure.dart';
import 'package:desafio_dia1/modules/menu/menu_routers.dart';
import 'package:shelf_router/src/router.dart';

class RouterConfigure {
  RouterConfigure(this._router);

  final Router _router;
  final List<IRouterConfigure> routers = [
    MenuRouters()
  ];

  void configure() => routers.forEach((r) => r.configure(_router));
}
