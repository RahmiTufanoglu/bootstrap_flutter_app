import 'package:flutter/widgets.dart';
import 'package:form_app/routes/another_route.dart';
import 'package:form_app/routes/forgot_password_route.dart';
import 'package:form_app/routes/page_transition.dart';
import 'package:form_app/error_page.dart';
import 'package:form_app/home_page.dart';
import 'package:form_app/routes/home_route.dart';
import 'package:form_app/routes/login_route.dart';
import 'package:form_app/routes/register_route.dart';
import 'package:go_router/go_router.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

final appRouter = GoRouter(
  initialLocation: '/',
  //initialLocation: '/login',
  navigatorKey: rootNavigatorKey,
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: '/',
      redirect: (_, __) => '/${HomePage.routeName}',
    ),
    homeRoute(),
    loginRoute(),
    registerRoute(),
    forgotPasswordRoute(),
    anotherRoute(),
  ],
  errorPageBuilder: (_, state) => PageTransition(
    key: state.pageKey,
    child: ErrorPage(message: state.error.toString()),
  ),
);
