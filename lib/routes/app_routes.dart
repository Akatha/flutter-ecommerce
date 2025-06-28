import 'package:async_provider/pages/auth/login.dart';
import 'package:async_provider/pages/auth/register.dart';
import 'package:async_provider/routes/route_enum.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'app_routes.g.dart';

@riverpod
GoRouter router (Ref ref) {
  return GoRouter(
    initialLocation: '/',
   routes:[
     GoRoute(
     path: '/',
       builder: (context, state){
       return Login();
       },
     ),
     GoRoute(
       path: '/register',
       name: AppRoute.register.name,
       builder: (context, state){
         return Register();
       },
     )
   ]
  );
}