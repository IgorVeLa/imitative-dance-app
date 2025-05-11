import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:imitative_dance_app/global/styling.dart';

class Home extends StatelessWidget {
  const Home({super.key});

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
              ),
              Gap(gapStandardXLarge),
              ...tiles(),
            ],
          ),
        ),
      ),
    );
  }
}

ListView performanceTiles() {
  return ListView.builder(
    itemBuilder: (context, index) {
      return Text("NIce");
    },
  );
}

List<Widget> tiles() {
  return List.generate(5, (int index) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 150,
          padding: EdgeInsets.all(gapSmall2),
          decoration: BoxDecoration(
            color: Colors.red,
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
          child: Row(
            children: [
              Container(
                width: 120,
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius:
                      BorderRadius.all(Radius.circular(borderRadiusSmall)),
                ),
              ),
              Gap(gapSmall2),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Title"),
                  Text("Date"),
                  Text("Duration"),
                ],
              )
            ],
          ),
        ),
        Gap(gapLarge)
      ],
    );
  });
}
