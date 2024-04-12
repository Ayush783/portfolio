class Project {
  final String title;
  final String desc;
  final String linkToSrc;
  final String imgUrl;
  final String linkToDemo;
  final bool hasDemo;
  final bool hasSrc;

  Project(
    this.title,
    this.desc,
    this.linkToSrc,
    this.imgUrl,
    this.linkToDemo,
    this.hasDemo,
    this.hasSrc,
  );

  factory Project.fromMap(Map<String, dynamic> map) {
    return Project(
      map['title'] as String,
      map['desc'] as String,
      map['linkToSrc'] as String,
      map['imgUrl'] as String,
      map['linkToDemo'] as String,
      map['hasDemo'] as bool,
      map['hasSrc'] as bool,
    );
  }

  static List<Project> get getProjects =>
      projectsData.map((e) => Project.fromMap(e)).toList();
}

const List<Map<String, dynamic>> projectsData = [
  {
    'title': 'AstroTak',
    'desc':
        'Best astrologers of India at your fingertips. Our panel of astrologers provides solutions to your life problems and also guides you to take the right path towards growth and prosperity.',
    'linkToSrc': '',
    'imgUrl': 'assets/images/astrotak.webp',
    'linkToDemo':
        'https://play.google.com/store/apps/details?id=com.aajtak.astrotak',
    'hasDemo': true,
    'hasSrc': false,
  },
  {
    'title': 'TAK',
    'desc':
        'a news app that goes beyond regular news apps because it\'s super-fast and short(to-the-point). Apart from the abundance of content genres, this app also provides language flexibility with the motive to serve a wider demographic population of the country.',
    'linkToSrc': '',
    'imgUrl': 'assets/images/tak.webp',
    'linkToDemo':
        'https://play.google.com/store/apps/details?id=com.indiatoday.mobiletak',
    'hasDemo': true,
    'hasSrc': false,
  },
  {
    'title': 'The Lallantop',
    'desc':
        'Welcome to The Lallantop App - your go-to destination for the latest Hindi news (हिंदी न्यूज़ ऐप) and perspectives tailored for everyone.',
    'linkToSrc': '',
    'imgUrl': 'assets/images/lallantop.webp',
    'linkToDemo':
        'https://play.google.com/store/apps/details?id=com.thelallantop',
    'hasDemo': true,
    'hasSrc': false,
  },
  {
    'title': 'DSC KIET MOBILE APP',
    'desc':
        'It is a mobile application made with Flutter for my college community - DSC KIET. It currently has 1k+ downloads on Play Store. ',
    'linkToSrc': 'https://github.com/dsckiet/DSC-KIET-APP',
    'imgUrl': 'assets/images/dsc.webp',
    'linkToDemo': 'https://play.google.com/store/apps/details?id=tech.dsckiet',
    'hasDemo': true,
    'hasSrc': true,
  },
  {
    'title': 'FLUTTER TRANSLATOR',
    'desc':
        'This is a mobile application that can extract text from images and then translate it to your desired language. It uses Google\'s ML Kit and is able to recognize 103 languages.',
    'linkToSrc': 'https://github.com/Ayush783/flutter_translator',
    'imgUrl': 'assets/images/flutter_translator.webp',
    'linkToDemo': 'https://youtube.com/shorts/eZDvpRaO7ec',
    'hasDemo': true,
    'hasSrc': true,
  },
  {
    'title': 'YODHA FIGHTING BREAST CANCER',
    'desc':
        'This is a solution where we help those patients who are fight against breast cancer by providing them a reliable and effective solution. It was built as a submission to ELC Hackathon',
    'linkToSrc': 'https://github.com/Ayush783/YODHA-fighting_breast_cancer',
    'imgUrl': 'assets/images/yodha.webp',
    'linkToDemo': 'https://www.youtube.com/watch?v=C1X8qjCVlMQ',
    'hasDemo': true,
    'hasSrc': true,
  },
  {
    'title': 'COUNTRY APP',
    'desc':
        'A mobile application built with Flutter that displays general information about all the countries around the Globe. You can search countries based on Area, Region, Language, Currency, etc. You can also save the countries on your device.',
    'linkToSrc': 'https://github.com/Ayush783/Country-App',
    'imgUrl': 'assets/images/country.webp',
    'linkToDemo': 'https://github.com/Ayush783/Country-App/releases/tag/1.1.0',
    'hasDemo': true,
    'hasSrc': true,
  },
  // {
  //   'title': 'HELP ME APP',
  //   'desc':
  //       'It is a mobile application built with Flutter that helps people in cases of emergency like natural disasters.',
  //   'linkToSrc': 'https://github.com/Ayush783/help-me-app',
  //   'imgUrl': '',
  //   'linkToDemo': '',
  //   'hasDemo': false,
  // },
  // {
  //   'title': 'Movie App',
  //   'desc':
  //       'A mobile application that displays the popular movies and TV shows. It uses the TMDB API and you can also play the trailer of the movie.',
  //   'linkToSrc': 'https://github.com/Ayush783/movie_app',
  //   'imgUrl': '',
  //   'linkToDemo': '',
  //   'hasDemo': false,
  // },
  // {
  //   'title': 'Github Profile Analyser',
  //   'desc':
  //       'This was one of my earliest application built with Flutter. It is powered by the Github API.',
  //   'linkToSrc': 'https://github.com/Ayush783/movie_app',
  //   'imgUrl': '',
  //   'linkToDemo': '',
  //   'hasDemo': false,
  // },
];
