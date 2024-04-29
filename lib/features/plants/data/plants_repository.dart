import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:plant_deseases_client/features/plants/service/plants_api_service.dart';
import 'package:plant_deseases_client/models/Plant.dart';

final plantsRepositoryProvider = Provider<PlantsRepository>((ref) {
  final plantsAPIService = ref.read(plantsAPIServiceProvider);
  return PlantsRepository(plantsAPIService);
});

class PlantsRepository {
  PlantsRepository(this.plantsAPIService);

  final PlantsAPIService plantsAPIService;

  Future<List<Plant>> getPlants() {
    return plantsAPIService.getPlants();
  }

  // Future<List<Plant>> getPastTrips() {
  //   return tripsAPIService.getPastTrips();
  // }

  Future<void> add(Plant plant) async {
    return plantsAPIService.addPlant(plant);
  }

  Future<void> update(Plant updatedPlant) async {
    return plantsAPIService.updatePlant(updatedPlant);
  }

  Future<void> delete(Plant deletedPlant) async {
    return plantsAPIService.deletePlant(deletedPlant);
  }

  Future<Plant> getPlant(String plantId) async {
    return plantsAPIService.getPlant(plantId);
  }
}
