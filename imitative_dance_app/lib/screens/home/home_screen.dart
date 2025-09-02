import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imitative_dance_app/Repository/performance_repo_mock.dart';
import 'package:imitative_dance_app/screens/home/home_view.dart';
import 'package:imitative_dance_app/screens/home/state/performances_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PerformancesBloc(repo: PerformanceRepoMock())
        ..add(PerformancesOpened()),
      child: HomeView(),
    );
  }
}
