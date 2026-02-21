class DestinationModel {
  final String id;
  final String name;
  final String location;
  final String country;
  final double rating;
  final int reviewCount;
  final double pricePerPerson;
  final String imageUrl;
  final String description;
  final List<String> galleryImages;
  bool isFavorite;

  DestinationModel({
    required this.id,
    required this.name,
    required this.location,
    required this.country,
    required this.rating,
    required this.reviewCount,
    required this.pricePerPerson,
    required this.imageUrl,
    required this.description,
    required this.galleryImages,
    this.isFavorite = false,
  });
}

class TripPackageModel {
  final String id;
  final String name;
  final String startDate;
  final String endDate;
  final double rating;
  final int personJoined;
  final double price;
  final String imageUrl;
  final List<String> avatarUrls;

  TripPackageModel({
    required this.id,
    required this.name,
    required this.startDate,
    required this.endDate,
    required this.rating,
    required this.personJoined,
    required this.price,
    required this.imageUrl,
    required this.avatarUrls,
  });
}

class ScheduleModel {
  final String id;
  final String destinationName;
  final String locationDetail;
  final DateTime scheduledDate;
  final String imageUrl;

  ScheduleModel({
    required this.id,
    required this.destinationName,
    required this.locationDetail,
    required this.scheduledDate,
    required this.imageUrl,
  });
}