// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AddedPlantImpl _$$AddedPlantImplFromJson(Map<String, dynamic> json) =>
    _$AddedPlantImpl(
      id: json['id'] as String,
      names: json['names'] == null
          ? null
          : PlantNames.fromJson(json['names'] as Map<String, dynamic>),
      site: json['site'] == null
          ? null
          : PlantSite.fromJson(json['site'] as Map<String, dynamic>),
      image: json['image'] == null
          ? null
          : PlantImage.fromJson(json['image'] as Map<String, dynamic>),
      plantCare: json['plantCare'] == null
          ? null
          : PlantCare.fromJson(json['plantCare'] as Map<String, dynamic>),
      size: (json['size'] as num?)?.toInt(),
      health: json['health'] as String?,
      environment: json['environment'] == null
          ? null
          : EnvironmentInfo.fromJson(
              json['environment'] as Map<String, dynamic>),
      actions: json['actions'] == null
          ? null
          : PlantActions.fromJson(json['actions'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AddedPlantImplToJson(_$AddedPlantImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'names': instance.names,
      'site': instance.site,
      'image': instance.image,
      'plantCare': instance.plantCare,
      'size': instance.size,
      'health': instance.health,
      'environment': instance.environment,
      'actions': instance.actions,
    };

_$PlantNamesImpl _$$PlantNamesImplFromJson(Map<String, dynamic> json) =>
    _$PlantNamesImpl(
      localizedName: json['localizedName'] as String?,
      variety: json['variety'] as String?,
      custom: json['custom'] as String?,
      scientific: json['scientific'] as String?,
    );

Map<String, dynamic> _$$PlantNamesImplToJson(_$PlantNamesImpl instance) =>
    <String, dynamic>{
      'localizedName': instance.localizedName,
      'variety': instance.variety,
      'custom': instance.custom,
      'scientific': instance.scientific,
    };

_$PlantSiteImpl _$$PlantSiteImplFromJson(Map<String, dynamic> json) =>
    _$PlantSiteImpl(
      id: json['id'] as String?,
      name: json['name'] as String?,
      hasGrowLight: json['hasGrowLight'] as bool?,
      activeGrowLightHours: (json['activeGrowLightHours'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$PlantSiteImplToJson(_$PlantSiteImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'hasGrowLight': instance.hasGrowLight,
      'activeGrowLightHours': instance.activeGrowLightHours,
    };

_$PlantImageImpl _$$PlantImageImplFromJson(Map<String, dynamic> json) =>
    _$PlantImageImpl(
      url: json['url'] as String?,
      lastUpdated: const NullableDateTimeTryParseConverter()
          .fromJson(json['lastUpdated']),
    );

Map<String, dynamic> _$$PlantImageImplToJson(_$PlantImageImpl instance) =>
    <String, dynamic>{
      'url': instance.url,
      'lastUpdated': const NullableDateTimeTryParseConverter()
          .toJson(instance.lastUpdated),
    };

_$PlantCareImpl _$$PlantCareImplFromJson(Map<String, dynamic> json) =>
    _$PlantCareImpl(
      customWatering: json['customWatering'] == null
          ? null
          : CustomCareInterval.fromJson(
              json['customWatering'] as Map<String, dynamic>),
      customFertilizing: json['customFertilizing'] == null
          ? null
          : CustomCareInterval.fromJson(
              json['customFertilizing'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PlantCareImplToJson(_$PlantCareImpl instance) =>
    <String, dynamic>{
      'customWatering': instance.customWatering,
      'customFertilizing': instance.customFertilizing,
    };

_$CustomCareIntervalImpl _$$CustomCareIntervalImplFromJson(
        Map<String, dynamic> json) =>
    _$CustomCareIntervalImpl(
      enabled: json['enabled'] as bool?,
      intervalWarmPeriod: (json['intervalWarmPeriod'] as num?)?.toInt(),
      intervalColdPeriod: (json['intervalColdPeriod'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$CustomCareIntervalImplToJson(
        _$CustomCareIntervalImpl instance) =>
    <String, dynamic>{
      'enabled': instance.enabled,
      'intervalWarmPeriod': instance.intervalWarmPeriod,
      'intervalColdPeriod': instance.intervalColdPeriod,
    };

_$EnvironmentInfoImpl _$$EnvironmentInfoImplFromJson(
        Map<String, dynamic> json) =>
    _$EnvironmentInfoImpl(
      isNearAc: json['isNearAc'] as bool?,
      isNearHeater: json['isNearHeater'] as bool?,
      light: json['light'] == null
          ? null
          : LightInfo.fromJson(json['light'] as Map<String, dynamic>),
      pot: json['pot'] == null
          ? null
          : PotInfo.fromJson(json['pot'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$EnvironmentInfoImplToJson(
        _$EnvironmentInfoImpl instance) =>
    <String, dynamic>{
      'isNearAc': instance.isNearAc,
      'isNearHeater': instance.isNearHeater,
      'light': instance.light,
      'pot': instance.pot,
    };

_$LightInfoImpl _$$LightInfoImplFromJson(Map<String, dynamic> json) =>
    _$LightInfoImpl(
      distanceFromWindow: (json['distanceFromWindow'] as num?)?.toInt(),
      hasGrowLight: json['hasGrowLight'] as bool?,
      activeGrowLightHours: (json['activeGrowLightHours'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$LightInfoImplToJson(_$LightInfoImpl instance) =>
    <String, dynamic>{
      'distanceFromWindow': instance.distanceFromWindow,
      'hasGrowLight': instance.hasGrowLight,
      'activeGrowLightHours': instance.activeGrowLightHours,
    };

_$PotInfoImpl _$$PotInfoImplFromJson(Map<String, dynamic> json) =>
    _$PotInfoImpl(
      type: json['type'] as String?,
      size: (json['size'] as num?)?.toInt(),
      soil: json['soil'] as String?,
      hasDrainage: json['hasDrainage'] as bool?,
    );

Map<String, dynamic> _$$PotInfoImplToJson(_$PotInfoImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'size': instance.size,
      'soil': instance.soil,
      'hasDrainage': instance.hasDrainage,
    };

_$PlantActionsImpl _$$PlantActionsImplFromJson(Map<String, dynamic> json) =>
    _$PlantActionsImpl(
      watering: json['watering'] == null
          ? null
          : ActionSchedule.fromJson(json['watering'] as Map<String, dynamic>),
      fertilizing: json['fertilizing'] == null
          ? null
          : ActionSchedule.fromJson(
              json['fertilizing'] as Map<String, dynamic>),
      repotting: json['repotting'] == null
          ? null
          : ActionSchedule.fromJson(json['repotting'] as Map<String, dynamic>),
      cleaning: json['cleaning'] == null
          ? null
          : ActionSchedule.fromJson(json['cleaning'] as Map<String, dynamic>),
      progressUpdate: json['progressUpdate'] == null
          ? null
          : ActionSchedule.fromJson(
              json['progressUpdate'] as Map<String, dynamic>),
      misting: json['misting'] == null
          ? null
          : ActionSchedule.fromJson(json['misting'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PlantActionsImplToJson(_$PlantActionsImpl instance) =>
    <String, dynamic>{
      'watering': instance.watering,
      'fertilizing': instance.fertilizing,
      'repotting': instance.repotting,
      'cleaning': instance.cleaning,
      'progressUpdate': instance.progressUpdate,
      'misting': instance.misting,
    };

_$ActionScheduleImpl _$$ActionScheduleImplFromJson(Map<String, dynamic> json) =>
    _$ActionScheduleImpl(
      next: json['next'] == null
          ? null
          : ActionInstance.fromJson(json['next'] as Map<String, dynamic>),
      completed: json['completed'] == null
          ? null
          : ActionInstance.fromJson(json['completed'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ActionScheduleImplToJson(
        _$ActionScheduleImpl instance) =>
    <String, dynamic>{
      'next': instance.next,
      'completed': instance.completed,
    };

_$ActionInstanceImpl _$$ActionInstanceImplFromJson(Map<String, dynamic> json) =>
    _$ActionInstanceImpl(
      date: const NullableDateTimeTryParseConverter().fromJson(json['date']),
      type: json['type'] as String?,
    );

Map<String, dynamic> _$$ActionInstanceImplToJson(
        _$ActionInstanceImpl instance) =>
    <String, dynamic>{
      'date': const NullableDateTimeTryParseConverter().toJson(instance.date),
      'type': instance.type,
    };
