class Champion {
  final String id;
  final String name;
  final String imageUrl;

  const Champion({
    required this.id,
    required this.name,
    required this.imageUrl,
  });

  // Data Dragon CDN에서 이미지 URL 생성
  String get championImageUrl => 
    'https://ddragon.leagueoflegends.com/cdn/13.24.1/img/champion/$id.png';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Champion &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;
} 