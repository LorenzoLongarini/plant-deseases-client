import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:plant_deseases_client/common/navigation/router/routes.dart';
import 'package:plant_deseases_client/common/utils/colors.dart';

class PlantsView extends StatefulWidget {
  const PlantsView({super.key});

  @override
  State<PlantsView> createState() => _PlantsViewState();
}

class _PlantsViewState extends State<PlantsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PlantsView'),
        actions: [
          IconButton(
            icon: Icon(
              Icons.chat,
              color: Palette.primary,
            ),
            isSelected: true,
            onPressed: () {
              setState(() {
                context.goNamed(AppRoute.chatbot.name);
              });
            },
          ),
        ],
      ),
      body: Center(
        child: Text('PlantsView'),
      ),
    );
  }
}
