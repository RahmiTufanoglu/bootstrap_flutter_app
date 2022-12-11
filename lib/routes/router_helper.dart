import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

extension RouterHelper on BuildContext {
  String get location => GoRouter.of(this).location;

  Map<String, dynamic> get routerState {
    return GoRouter.of(this).routeInformationProvider.value.state! as Map<String, dynamic>;
  }
}
