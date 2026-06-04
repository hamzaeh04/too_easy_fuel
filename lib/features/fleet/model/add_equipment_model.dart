class EquipmentResponse {
  final bool? success;
  final int? statusCode;
  final String? message;
  final List<Equipment>? data;

  EquipmentResponse({
    this.success,
    this.statusCode,
    this.message,
    this.data,
  });

  factory EquipmentResponse.fromJson(Map<String, dynamic> json) {
    return EquipmentResponse(
      success: json['success'],
      statusCode: json['statusCode'],
      message: json['message'],
      data: json['data'] != null
          ? List<Equipment>.from(
        json['data'].map((x) => Equipment.fromJson(x)),
      )
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'statusCode': statusCode,
      'message': message,
      'data': data?.map((e) => e.toJson()).toList(),
    };
  }
}

class Equipment {
  final String? id;
  final String? userId;
  final String? equipmentType;
  final String? model;
  final int? year;
  final String? fuelType;
  final int? tankSize;
  final String? port;
  final bool? isSpareFuel;
  final String? equipmentImage;
  final String? lastFueledAt;
  final bool? isDeleted;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Equipment({
    this.id,
    this.userId,
    this.equipmentType,
    this.model,
    this.year,
    this.fuelType,
    this.tankSize,
    this.port,
    this.isSpareFuel,
    this.equipmentImage,
    this.lastFueledAt,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
  });

  factory Equipment.fromJson(Map<String, dynamic> json) {
    return Equipment(
      id: json['id'] ?? json['_id'],
      userId: json['userId'],
      equipmentType: json['equipmentType'],
      model: json['model'],
      year: json['year'],
      fuelType: json['fuelType'],
      tankSize: json['tankSize'],
      port: json['port'],
      isSpareFuel: json['isSpareFuel'],
      equipmentImage: json['equipmentImage'],
      lastFueledAt: json['lastFueledAt'],
      isDeleted: json['isDeleted'],
      createdAt: json['createdAt'] != null
          ? DateTime.tryParse(json['createdAt'])
          : null,
      updatedAt: json['updatedAt'] != null
          ? DateTime.tryParse(json['updatedAt'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'equipmentType': equipmentType,
      'model': model,
      'year': year,
      'fuelType': fuelType,
      'tankSize': tankSize,
      'port': port,
      'isSpareFuel': isSpareFuel,
      'equipmentImage': equipmentImage,
      'lastFueledAt': lastFueledAt,
      'isDeleted': isDeleted,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }
}
