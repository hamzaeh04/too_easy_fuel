class VehiclesResponse {
  final bool? success;
  final int? statusCode;
  final String? message;
  final List<Vehicle>? data;

  VehiclesResponse({
    this.success,
    this.statusCode,
    this.message,
    this.data,
  });

  factory VehiclesResponse.fromJson(Map<String, dynamic> json) {
    return VehiclesResponse(
      success: json['success'],
      statusCode: json['statusCode'],
      message: json['message'],
      data: json['data'] != null
          ? List<Vehicle>.from(
        json['data'].map((x) => Vehicle.fromJson(x)),
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

class Vehicle {
  final String? id;
  final String? userId;
  final String? make;
  final String? model;
  final int? year;
  final String? fuelType;
  final int? tankSize;
  final String? port;
  final String? vehicleImage;
  final String? licensePlateImage;
  final String? lastFueledAt;
  final bool? isDeleted;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Vehicle({
    this.id,
    this.userId,
    this.make,
    this.model,
    this.year,
    this.fuelType,
    this.tankSize,
    this.port,
    this.vehicleImage,
    this.licensePlateImage,
    this.lastFueledAt,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
  });

  factory Vehicle.fromJson(Map<String, dynamic> json) {
    return Vehicle(
      id: json['id'] ?? json['_id'],
      userId: json['userId'],
      make: json['make'],
      model: json['model'],
      year: json['year'],
      fuelType: json['fuelType'],
      tankSize: json['tankSize'],
      port: json['port'],
      vehicleImage: json['vehicleImage'],
      licensePlateImage: json['licensePlateImage'],
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
      'make': make,
      'model': model,
      'year': year,
      'fuelType': fuelType,
      'tankSize': tankSize,
      'port': port,
      'vehicleImage': vehicleImage,
      'licensePlateImage': licensePlateImage,
      'lastFueledAt': lastFueledAt,
      'isDeleted': isDeleted,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }
}
