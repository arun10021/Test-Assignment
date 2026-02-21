import '../models/destination_model.dart';

class DummyData {
  static List<DestinationModel> popularPlaces = [
    DestinationModel(
      id: '1',
      name: 'Hisma Desert',
      location: 'Saudi Arabia',
      country: 'Saudi Arabia',
      rating: 4.9,
      reviewCount: 280,
      pricePerPerson: 459,
      imageUrl: 'https://images.unsplash.com/photo-1509316785289-025f5b846b35?w=400',
      description:
      'Experience the breathtaking beauty of the Hisma Desert, with its stunning sand dunes and ancient rock formations. A truly unique destination that offers an unforgettable adventure experience.',
      galleryImages: [
        'https://images.unsplash.com/photo-1509316785289-025f5b846b35?w=200',
        'https://images.unsplash.com/photo-1539650116574-8efeb43e2750?w=200',
        'https://images.unsplash.com/photo-1547483238-f400e65ccd56?w=200',
        'https://images.unsplash.com/photo-1504512485720-7d83a16ee930?w=200',
      ],
      isFavorite: false,
    ),
    DestinationModel(
      id: '2',
      name: 'Hisma Desert',
      location: 'Zeero Point, Sylhet',
      country: 'Bangladesh',
      rating: 4.8,
      reviewCount: 195,
      pricePerPerson: 924,
      imageUrl: 'https://images.unsplash.com/photo-1507525428034-b723cf961d3e?w=400',
      description:
      'A stunning coastal destination with crystal-clear waters and pristine beaches. Perfect for water sports, relaxation, and exploring marine life.',
      galleryImages: [
        'https://images.unsplash.com/photo-1507525428034-b723cf961d3e?w=200',
        'https://images.unsplash.com/photo-1544551763-46a013bb70d5?w=200',
        'https://images.unsplash.com/photo-1533760881669-80db4d7b341d?w=200',
        'https://images.unsplash.com/photo-1510414842594-a61c69b5ae57?w=200',
      ],
      isFavorite: true,
    ),
    DestinationModel(
      id: '3',
      name: 'The HSB Vortex',
      location: 'Zeero Point, Sylhet',
      country: 'Singapore',
      rating: 4.2,
      reviewCount: 142,
      pricePerPerson: 681,
      imageUrl: 'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=400',
      description:
      'Marvel at this engineering masterpiece - one of the tallest indoor waterfalls in the world. A perfect blend of nature and architecture.',
      galleryImages: [
        'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=200',
        'https://images.unsplash.com/photo-1477959858617-67f85cf4f1df?w=200',
        'https://images.unsplash.com/photo-1467803738586-46b7eb7b16a9?w=200',
        'https://images.unsplash.com/photo-1501854140801-50d01698950b?w=200',
      ],
      isFavorite: false,
    ),
    DestinationModel(
      id: '4',
      name: 'Hisma Desert',
      location: 'Zeero Point, Sylhet',
      country: 'UAE',
      rating: 4.5,
      reviewCount: 318,
      pricePerPerson: 977,
      imageUrl: 'https://images.unsplash.com/photo-1518548419970-58e3b4079ab2?w=400',
      description:
      'A luxurious desert experience with five-star resorts, camel rides, and breathtaking sunsets over the endless sand dunes.',
      galleryImages: [
        'https://images.unsplash.com/photo-1518548419970-58e3b4079ab2?w=200',
        'https://images.unsplash.com/photo-1531572753322-ad063cecc140?w=200',
        'https://images.unsplash.com/photo-1543731068-7e0f5beff43a?w=200',
        'https://images.unsplash.com/photo-1517760444937-f6397edcbbcd?w=200',
      ],
      isFavorite: false,
    ),
    DestinationModel(
      id: '5',
      name: 'Khai Island Beach',
      location: 'Chang Wat Phang-nga',
      country: 'Thailand',
      rating: 4.9,
      reviewCount: 280,
      pricePerPerson: 80,
      imageUrl: 'https://images.unsplash.com/photo-1537953773345-d172ccf13cf4?w=400',
      description:
      'Experience the ultimate vacation package with our beach travel package. From airline tickets to recommended hotel rooms and transportation, we have everything you need.',
      galleryImages: [
        'https://images.unsplash.com/photo-1537953773345-d172ccf13cf4?w=200',
        'https://images.unsplash.com/photo-1544551763-46a013bb70d5?w=200',
        'https://images.unsplash.com/photo-1559128010-7c1ad6e1b6a5?w=200',
        'https://images.unsplash.com/photo-1520250497591-112f2f40a3f4?w=200',
        'https://images.unsplash.com/photo-1510414842594-a61c69b5ae57?w=200',
      ],
      isFavorite: false,
    ),
    DestinationModel(
      id: '6',
      name: 'Island of Siargao',
      location: 'Siargao, Philippines',
      country: 'Philippines',
      rating: 4.7,
      reviewCount: 156,
      pricePerPerson: 320,
      imageUrl: 'https://images.unsplash.com/photo-1518509562904-e7ef99cdcc86?w=400',
      description:
      'Known as the surfing capital of the Philippines, Siargao offers stunning lagoons, coconut forests, and world-class waves.',
      galleryImages: [
        'https://images.unsplash.com/photo-1518509562904-e7ef99cdcc86?w=200',
        'https://images.unsplash.com/photo-1559128010-7c1ad6e1b6a5?w=200',
        'https://images.unsplash.com/photo-1451187580459-43490279c0fa?w=200',
        'https://images.unsplash.com/photo-1583212292454-1fe6229603b7?w=200',
      ],
      isFavorite: false,
    ),
  ];

  static List<TripPackageModel> popularPackages = [
    TripPackageModel(
      id: '1',
      name: 'Niladri Reservoir',
      startDate: '16 July',
      endDate: '28 July',
      rating: 4.8,
      personJoined: 24,
      price: 789,
      imageUrl: 'https://images.unsplash.com/photo-1519046904884-53103b34b206?w=400',
      avatarUrls: [
        'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=50',
        'https://images.unsplash.com/photo-1494790108755-2616b612b786?w=50',
      ],
    ),
    TripPackageModel(
      id: '2',
      name: 'Niladri Reservoir',
      startDate: '16 July',
      endDate: '28 July',
      rating: 4.8,
      personJoined: 24,
      price: 789,
      imageUrl: 'https://images.unsplash.com/photo-1502481851512-e9e2529bfbf9?w=400',
      avatarUrls: [
        'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=50',
        'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=50',
      ],
    ),
    TripPackageModel(
      id: '3',
      name: 'Niladri Reservoir',
      startDate: '16 July',
      endDate: '28 July',
      rating: 4.8,
      personJoined: 24,
      price: 789,
      imageUrl: 'https://images.unsplash.com/photo-1542314831-068cd1dbfeeb?w=400',
      avatarUrls: [
        'https://images.unsplash.com/photo-1494790108755-2616b612b786?w=50',
        'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=50',
      ],
    ),
    TripPackageModel(
      id: '4',
      name: 'Niladri Reservoir',
      startDate: '16 July',
      endDate: '28 July',
      rating: 4.8,
      personJoined: 24,
      price: 789,
      imageUrl: 'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=400',
      avatarUrls: [
        'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=50',
        'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=50',
      ],
    ),
  ];

  static List<ScheduleModel> mySchedule = [
    ScheduleModel(
      id: '1',
      destinationName: 'Hisma Desert',
      locationDetail: 'NEOM, Saudi Arabia',
      scheduledDate: DateTime(2023, 10, 22), // Thursday — the selected day in design
      imageUrl: 'https://images.unsplash.com/photo-1509316785289-025f5b846b35?w=200',
    ),
    ScheduleModel(
      id: '2',
      destinationName: 'The HSBC Rain Vortex',
      locationDetail: 'Zeero Point, Sylhet',
      scheduledDate: DateTime(2023, 10, 22), // also Thursday
      imageUrl: 'https://images.unsplash.com/photo-1520250497591-112f2f40a3f4?w=200',
    ),
    ScheduleModel(
      id: '3',
      destinationName: 'island of Siargao',
      locationDetail: 'Siargao,Philippines',
      scheduledDate: DateTime(2023, 10, 24), // Saturday
      imageUrl: 'https://images.unsplash.com/photo-1518509562904-e7ef99cdcc86?w=200',
    ),
    ScheduleModel(
      id: '4',
      destinationName: 'Khai Island Beach',
      locationDetail: 'Chang Wat Phang-nga, Thailand',
      scheduledDate: DateTime(2023, 10, 20), // Tuesday
      imageUrl: 'https://images.unsplash.com/photo-1537953773345-d172ccf13cf4?w=200',
    ),
    ScheduleModel(
      id: '5',
      destinationName: 'Niladri Reservoir',
      locationDetail: 'Sylhet, Bangladesh',
      scheduledDate: DateTime(2023, 10, 19), // Monday
      imageUrl: 'https://images.unsplash.com/photo-1519046904884-53103b34b206?w=200',
    ),
  ];

  static List<String> categories = [
    'All',
    'Beach',
    'Mountain',
    'Desert',
    'City',
    'Forest',
    'Waterfall',
  ];
}