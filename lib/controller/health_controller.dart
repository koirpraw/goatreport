
import 'package:health/health.dart';
import 'package:get/get.dart';
import 'package:goatreport/model/health_tag.dart';

import '../database/database_helper.dart';
import '../database/health_database.dart';
import '../model/health_category.dart';
import '../model/health_model.dart';
import '../utils/prefs.dart';


class HealthController extends GetxController{
  var tagList = [].obs;
  var healthCategory = [].obs;
  var newHealthTag = "".obs;
  var currentHealthTagId = 0.obs;
  var categoryName = "".obs;
  var allCategories = [].obs;
  var categoryType = "Select Type".obs;
  var clickedFactorCategories = [].obs;
  var valueChangedSymptomsCategories = [].obs;

  getAllHealthTag() async {
    var tags = <HealthTag>[];
    tags.add(HealthTag(tagName: "+ Add New(tag)", tagId: -1));
    HealthDatabase healthDatabase = HealthDatabase.db;
    await healthDatabase.getCustomHealthTag().then((value) {
      value.forEach((element) {
        tags.insert(0, element);
      });
    });
    if (tags.length > 1) {
      currentHealthTagId.value = tags[0].tagId!;
      getHealthCategoryWithTag(currentHealthTagId.value);
    }
    tagList.assignAll(tags);
  }

getAllHealthCategory() async{
  var categories = <HealthCategory>[];
  allCategories.clear();
  HealthDatabase healthDatabase = HealthDatabase.db;
  await healthDatabase.getAllCategory().then((value) {
    value.forEach((element) {
      categories.insert(0, element);
    });
  });
  allCategories.addAll(categories);
}

getHealthCategoryWithTag(int? tagId) async {
  if (tagId != null && tagId != -1) {
    var categories = <HealthCategory>[];
    categories.add(HealthCategory(
        catId: -1, catName: "+ Add New", catType: "new", catStatus: 1));
    HealthDatabase healthDatabase = HealthDatabase.db;
    await healthDatabase.getHealthCategory(tagId.toString()).then((value) {
      value.forEach((element) {
        categories.insert(0, element);
      });
    });
    healthCategory.assignAll(categories);
  }
}

Future<bool>? insertHeathTag(HealthTag healthTag){
  HealthDatabase healthDatabase = HealthDatabase.db;
  healthDatabase.insertHeartTag(healthTag).then((value) {
    getAllHealthTag();
    return value;
  });
}



  insertHealthCategory(HealthCategory healthCategory, {bool isRefresh = true}) {
    HealthDatabase healthDatabase = HealthDatabase.db;
    healthDatabase
        .insertHealthCategory(healthCategory)
        .then((value) {
      if(isRefresh) {
        getHealthCategoryWithTag(currentHealthTagId.value);
        getAllHealthCategory();
      }
    });
  }

  addClickedFactorCategory(HealthCategory healthCategory){
    clickedFactorCategories.add(healthCategory);
  }

  removeClickedFactorCategory(HealthCategory healthCategory){
    var item = clickedFactorCategories.firstWhere((element) => element.catId == healthCategory.catId);
    clickedFactorCategories.remove(item);
  }

  addSymptomsCategory(HealthCategory healthCategory, String value) async{

    var userDetails = await getUserDetails();
    var healthModel = HealthModel(
        id: healthCategory.catId,
        userId: userDetails!.id,
        healthName: healthCategory.catName,
        healthType: healthCategory.catType.toString(),
        healthUnit: HealthDataUnit.COUNT.name,
        healthValue: value,
        isSynced: false,
        date: DateTime.now().toString());

    valueChangedSymptomsCategories.add(healthModel);
  }

  removeSymptomsCategory(HealthCategory healthCategory){
    HealthModel? item = valueChangedSymptomsCategories.firstWhere((
        element) => element.id == healthCategory.catId);
    valueChangedSymptomsCategories.remove(item);
  }

  void insertAllFactorData() {
    clickedFactorCategories.forEach((element) async {
      HealthModel healthData = await createHealthData(element);
      DatabaseHelper databaseHelper = DatabaseHelper.db;
      await databaseHelper.insertHealthData(healthData);
    });
  }

  void insertAllSymptomsData() {
    valueChangedSymptomsCategories.forEach((element) async {
      DatabaseHelper databaseHelper = DatabaseHelper.db;
      await databaseHelper.insertHealthData(element);
    });
  }

  createHealthData(HealthCategory element) async {
    var userDetails = await getUserDetails();

    return HealthModel(
        userId: userDetails!.id,
        healthName: element.catName,
        healthType: element.catType.toString(),
        healthUnit: element.catName,
        healthValue: "",
        isSynced: false,
        date: DateTime.now().toString());
  }

  Future<void> updateSymptomsCategory(HealthCategory category, String value) async {
    var userDetails = await getUserDetails();
    var healthModel = HealthModel(
        id: category.catId,
        userId: userDetails!.id,
        healthName: category.catName,
        healthType: category.catType.toString(),
        healthUnit: HealthDataUnit.COUNT.name,
        healthValue: value,
        isSynced: false,
        date: DateTime.now().toString());
    valueChangedSymptomsCategories[valueChangedSymptomsCategories.indexWhere((element) => element.id == category.catId)] = healthModel;

  }

}
