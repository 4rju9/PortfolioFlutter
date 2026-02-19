class Project {
  final String title;
  final String description;
  final String thumbnail;
  final List<PlatformLink> availablePlatforms;
  Project(
    this.title,
    this.description,
    this.thumbnail,
    this.availablePlatforms,
  );
}

class PlatformLink {
  final String logo;
  final String source;
  PlatformLink(this.logo, this.source);
}

final List<Project> projects = [
  Project(
    "SMU",
    "SMU is an app built for Surajmal University. It contains class schedules, subjects, syllabus, short notes, and ChatGPT-based Q&A support. The main motive was to eliminate scattered PDFs and images.",
    "assets/projects/smu.png",
    [PlatformLink("assets/icons/github.png", "https://github.com/4rju9/SMU")],
  ),
  Project(
    "Music Verse",
    "Music Verse is a Mp3 media player, similar to Spotify, that allows you to listen to music files stored in the phone's internal or external memory.",
    "assets/projects/musicverse.png",
    [
      PlatformLink(
        "assets/icons/github.png",
        "https://github.com/4rju9/MusicVerse",
      ),
    ],
  ),
  Project(
    "Pokedex",
    "A scalable mobile app built with MVVM architecture, Jetpack Compose for UI, Retrofit for real-time data fetching, and optimized pagination to enhance performance and user engagement.",
    "assets/projects/pokedex.jpg",
    [
      PlatformLink(
        "assets/icons/github.png",
        "https://github.com/4rju9/Pokedex",
      ),
    ],
  ),
  Project(
    "Video Verse",
    "A mobile phone application that allows you to watch video files stored in the phone's internal or external memory.",
    "assets/projects/videoverse.jpg",
    [
      PlatformLink(
        "assets/icons/github.png",
        "https://github.com/4rju9/VideoVerse",
      ),
    ],
  ),
  Project(
    "Running Tracker",
    "A mobile app built with MVVM architecture, Navigation Components, Room database for data storage, and MPAndroidChart to visually display runs.",
    "assets/projects/runningtracker.jpg",
    [
      PlatformLink(
        "assets/icons/github.png",
        "https://github.com/4rju9/RunningTracker",
      ),
    ],
  ),
  Project(
    "MVVM News App",
    "News mobile app built with MVVM architecture, Retrofit for API integration, Navigation Components, Room database for storage, and WebView for immersive reading.",
    "assets/projects/news.png",
    [
      PlatformLink(
        "assets/icons/github.png",
        "https://github.com/4rju9/NewsApp",
      ),
    ],
  ),
  Project(
    "Chess Game",
    "An Android chess game written in Java implementing all standard chess rules and core gameplay features.",
    "assets/projects/chess.jpg",
    [PlatformLink("assets/icons/github.png", "https://github.com/4rju9/Chess")],
  ),
  Project(
    "Snake Game",
    "An Android snake game written in Java with complete core gameplay mechanics and classic arcade experience.",
    "assets/projects/snake.png",
    [PlatformLink("assets/icons/github.png", "https://github.com/4rju9/Snake")],
  ),
  Project(
    "Prime Video Clone",
    "Prime Video Clone - XML and Java based replica of Prime Video's landing page. Based on ExoPlayer, Volley Library, and Glide Library.",
    "assets/projects/primevideo.png",
    [
      PlatformLink(
        "assets/icons/github.png",
        "https://github.com/4rju9/PrimeVideoClone",
      ),
    ],
  ),
];
