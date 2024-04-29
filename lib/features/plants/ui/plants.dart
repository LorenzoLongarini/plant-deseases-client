import 'package:flutter/material.dart';

class PlantsView extends StatefulWidget {
  const PlantsView({super.key});

  @override
  State<PlantsView> createState() => _PlantsViewState();
}

class _PlantsViewState extends State<PlantsView> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('PlantsView'),
    );
  }
}
