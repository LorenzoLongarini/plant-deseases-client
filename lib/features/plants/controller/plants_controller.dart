import 'dart:async';

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:plant_deseases_client/features/plants/data/plants_repository.dart';
import 'package:plant_deseases_client/models/ModelProvider.dart';
import 'package:plant_deseases_client/models/Plant.dart';

part 'plants_controller.g.dart';

@riverpod
class PlantsListController extends _$PlantsListController {
  Future<List<Plant>> _fetchPlants() async {
    final plantsRepository = ref.read(plantsRepositoryProvider);
    final plants = await plantsRepository.getPlants();
    return plants;
  }

  @override
  FutureOr<List<Plant>> build() async {
    return _fetchPlants();
  }

  Future<void> addPlant({
    required String name,
    required String umidity,
    required String temperature,
    required String co2,
  }) async {
    final plant = Plant(
      name: name,
      umidity: umidity,
      temperature: temperature,
      co2: co2,
    );

    state = const AsyncValue.loading();

    state = await AsyncValue.guard(() async {
      final plantsRepository = ref.read(plantsRepositoryProvider);
      await plantsRepository.add(plant);
      return _fetchPlants();
    });
  }

  Future<void> removePlant(Plant plant) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final plantsRepository = ref.read(plantsRepositoryProvider);
      await plantsRepository.delete(plant);

      return _fetchPlants();
    });
  }
}
