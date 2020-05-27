class DogBreed {
  final int id;
  final String breed;
  final String size;
  final String imageURL;
  final String description;

  DogBreed(
      {this.id,
        this.breed,
        this.size,
        this.imageURL,
        this.description});

  factory DogBreed.fromJson(Map<String, dynamic> json) {
    return DogBreed(
      id: json['id'] as int,
      breed: json['breed'] as String,
      size: json['size'] as String,
      imageURL: json['image_url'] as String,
      description: json['description'] as String,
    );
  }
}