import 'package:flutter/material.dart';
import 'package:imitative_dance_app/global/widgets/primary_scaffold.dart';

class NavigationRoutes {
  final BuildContext context;

  NavigationRoutes({required this.context});

  Map<String, Widget Function(BuildContext)> routes = {
    "/": (context) => PrimaryScaffold(),
  };
}
