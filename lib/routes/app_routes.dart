import 'package:async_provider/constants/apis.dart';
import 'package:async_provider/models/product.dart';
import 'package:async_provider/pages/admin/admin_products.dart';
import 'package:async_provider/pages/admin/product_add_form.dart';
import 'package:async_provider/pages/auth/login.dart';
import 'package:async_provider/pages/auth/register.dart';

import 'package:async_provider/pages/product/product_list.dart';
import 'package:async_provider/provider/user_state_provider.dart';
import 'package:async_provider/routes/route_enum.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../pages/admin/product_edit_form.dart';
import '../pages/product/product_detail.dart';
part 'app_routes.g.dart';

@riverpod
GoRouter router(Ref ref) {
  final userState = ref.watch(userStateProvider);

  return GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) {
          return userState.token == 'no-token' ? Login() : const ProductList();
        },
        routes: [
          GoRoute(
            path: 'adminPro',
            name: AppRoute.adminPro.name,
            builder: (context, state) {
              return const AdminProducts();
            },
            routes: [
              GoRoute(
                path: 'productAdd',
                name: AppRoute.productAdd.name,
                builder: (context, state) {
                  return const ProductAddForm();
                },
              ),

              GoRoute(
                path: 'productEdit',
                name: AppRoute.productEdit.name,
                builder: (context, state) {
                  final product = state.extra as Product;
                  return ProductEditForm(product: product);
                },
              ),

              GoRoute(
                path: 'product-detail',
              name: AppRoute.productDetail.name,
                builder: (context, state) {
                  final productId = state.extra as String ;
                  return ProductDetail(id: productId);
                },
              )

            ],
          ),
          GoRoute(
            path: '/register',
            name: AppRoute.register.name,
            builder: (context, state) {
              return const Register();
            },
          ),
        ],
      ),
    ],
  );
}
