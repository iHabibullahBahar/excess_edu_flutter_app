import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubePlayerWidget extends StatefulWidget {
  final String videoUrl;

  YoutubePlayerWidget({required this.videoUrl});

  @override
  _YoutubePlayerWidgetState createState() => _YoutubePlayerWidgetState();
}

class _YoutubePlayerWidgetState extends State<YoutubePlayerWidget> {
  late YoutubePlayerController _controller;
  late String videoId;

  @override
  void initState() {
    super.initState();
    videoId = YoutubePlayer.convertUrlToId(widget.videoUrl)!;
    _controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayer(
      controller: _controller,
      showVideoProgressIndicator: true,
      onReady: () {},
    );
  }
}















// import 'package:excess_edu/consts/colors.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';

// class CourseDetailsPage extends StatefulWidget {
//   int courseId;
//   var courseName;
//   CourseDetailsPage(this.courseId, this.courseName);

//   @override
//   State<CourseDetailsPage> createState() => _CourseDetailsPageState();
// }

// class _CourseDetailsPageState extends State<CourseDetailsPage> {
//   //Preview Video from Youtube
//   late YoutubePlayerController _controller;
//   final String url = "https://www.youtube.com/watch?v=kB4xkzdFpTs";
//   late YoutubePlayer youtubePlayer;
//   late String videoId;

//   @override
//   void initState() {
//     super.initState();

//     //Initiate for Youtube video player
//     videoId = YoutubePlayer.convertUrlToId(url)!;
//     _controller = YoutubePlayerController(
//       initialVideoId: videoId,
//       flags: YoutubePlayerFlags(
//         autoPlay: false,
//         mute: false,
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     _controller.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         title: Text(
//           widget.courseName,
//           style: TextStyle(
//               color: AppColors.textColor, fontWeight: FontWeight.w500),
//         ),
//         iconTheme: IconThemeData(color: AppColors.textColor),
//         backgroundColor: Colors.white,
//         systemOverlayStyle: SystemUiOverlayStyle(
//           // Status bar color
//           statusBarColor: Colors.white,

//           // Status bar brightness (optional)
//           statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
//           statusBarBrightness: Brightness.light, // For iOS (dark icons)
//         ),
//       ),
//       body: YoutubePlayer(
//         controller: _controller,
//         showVideoProgressIndicator: true,
//         progressIndicatorColor: AppColors.primaryColor,
//       ),
//     );
//   }
// }
