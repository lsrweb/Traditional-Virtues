import 'package:ctmd_app/main.dart';
import 'package:ctmd_app/pages/detail.dart';
import 'package:ctmd_app/pages/error.dart';
import 'package:ctmd_app/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouer = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const HomeScreen();
        },
        routes: <RouteBase>[
          GoRoute(
            path: 'details',
            builder: (BuildContext context, GoRouterState state) {
              return const DetailsScreen();
            },
            pageBuilder: (context, state) {
              return CustomTransitionPage(
                key: state.pageKey,
                child: const DetailsScreen(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  // Change the opacity of the screen using a Curve based on the the animation's
                  // value
                  return FadeTransition(
                    opacity: CurveTween(curve: Curves.easeInOutCirc)
                        .animate(animation),
                    child: child,
                  );
                },
              );
            },
          )
        ],
      ),
    ],
    errorPageBuilder: (context, state) {
      return MaterialPage(
        key: state.pageKey,
        child: ErrorPage(errorMessage: state.error.toString()),
      );
    });
