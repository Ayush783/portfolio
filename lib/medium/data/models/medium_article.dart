class MediumArticle {
  final String? title;
  final DateTime? pubDate;
  final String? link;
  final String? guid;
  final String? author;
  final String? description;

  MediumArticle({
    this.title,
    this.pubDate,
    this.link,
    this.guid,
    this.author,
    this.description,
  });

  String? get thumbnailUrl {
    final start = description!.indexOf('http');
    final end = description!.indexOf('png') + 3;
    return start != -1 ? description!.substring(start, end) : null;
  }

  MediumArticle.fromMap(Map<String, dynamic> map)
      : title = (map['title'] as String).replaceAll('&amp;', '&'),
        pubDate = DateTime.tryParse(map['pubDate']),
        link = map['link'],
        guid = map['guid'],
        author = map['author'],
        description = map['description'];
}
