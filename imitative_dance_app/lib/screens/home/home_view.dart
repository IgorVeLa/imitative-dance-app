import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:imitative_dance_app/global/styling.dart';
import 'package:imitative_dance_app/models/paginated_result.dart';
import 'package:imitative_dance_app/models/Performance.dart';
import 'package:imitative_dance_app/screens/home/state/performances_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: gapStandard),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius:
                      BorderRadius.all(Radius.circular(borderRadiusRegular)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      spreadRadius: 2,
                      blurRadius: 7,
                      offset: Offset(3, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Recent Performance(s)"),
                    SizedBox(
                      height: 180,
                      child: PerformanceInsight(),
                    ),
                  ],
                ),
              ),
              Gap(gapStandardXLarge),
              BlocBuilder<PerformancesBloc, PerformancesState>(
                builder: (context, state) {
                  if (state is PerformancesLoading) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (state is PerformancesLoaded) {
                    return PerformanceListView(
                        performances: state.performances);
                  }
                  return SizedBox.shrink();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PerformanceListView extends StatelessWidget {
  const PerformanceListView({super.key, required this.performances});
  final PaginatedResult<Performance> performances;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: performances.items.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            PerformanceTile(
              performance: performances.items[index],
            ),
            Gap(gapLarge),
          ],
        );
      },
    );
  }
}

class PerformanceTile extends StatelessWidget {
  const PerformanceTile({super.key, required this.performance});
  final Performance performance;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 150,
      padding: EdgeInsets.all(gapSmall2),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.all(Radius.circular(borderRadiusRegular)),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            spreadRadius: 2,
            blurRadius: 7,
            offset: Offset(3, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 120,
            child: ClipRRect(
                borderRadius:
                    BorderRadius.all(Radius.circular(borderRadiusSmall)),
                child: Image.network(
                  performance.thumbnail.toString(),
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) =>
                      Text(error.toString()),
                )),
          ),
          Gap(gapSmall2),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(performance.title ?? "Missing Title"),
              Text(performance.date?.toIso8601String() ?? "Missing date"),
              // TODO: convert Duration properly
              Text(
                  "${performance.videoDuration?.inMinutes.toString() ?? "00"}:${performance.videoDuration?.inSeconds.toString() ?? "00"}"),
              Text("${performance.overallSimilarityScore.toString()}%"),
            ],
          ),
        ],
      ),
    );
  }
}

class PerformanceInsight extends StatelessWidget {
  const PerformanceInsight({super.key});
  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        maxY: 100,
        titlesData: FlTitlesData(
          show: true,
          topTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          rightTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
        ),
      ),
    );
  }
}
