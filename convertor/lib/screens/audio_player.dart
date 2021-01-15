import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class AudioPlayerScreen extends StatefulWidget {
  AudioPlayerScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _AudioPlayerScreenState createState() => _AudioPlayerScreenState();
}

class _AudioPlayerScreenState extends State<AudioPlayerScreen> {
  AudioPlayer _audioPlayer;
  AudioCache _audioCache;
  String _mediaUrlLocal = 'kaaris.mp3';

  Duration _duration = Duration();
  Duration _currentPosition = Duration();
  bool _isPlaying = false;
  bool _hasStartedOnce = false;

  @override
  void initState() {
    _duration = Duration();
    _currentPosition = Duration();
    _audioCache = AudioCache();
    super.initState();
  }

  void _playMusic() async {
    if (_isPlaying) {
      _audioPlayer.pause();
      setState(() {
        _isPlaying = false;
      });
    } else if (_hasStartedOnce && _isPlaying == false) {
      _audioPlayer.resume();
      setState(() {
        _isPlaying = true;
      });
    } else {
      var result = await _audioCache.play(_mediaUrlLocal);
      setState(() {
        _audioPlayer = result;
        _isPlaying = true;
        _hasStartedOnce = true;
      });
      _handleMusic();
    }
  }

  void _handleMusic() {
    _audioPlayer.onDurationChanged.listen((Duration duration) {
      setState(() {
        _duration = duration;
      });
    });
    _audioPlayer.onAudioPositionChanged.listen((Duration duration) {
      setState(() {
        _currentPosition = duration;
      });
    });
  }

  void _stopMusic() {
    if (_audioPlayer != null) {
      _audioPlayer.stop();
      setState(() {
        _isPlaying = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Text('Kaaris - Goulag'),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Image(
                      height: 200,
                      image: AssetImage('assets/baby_shark.jpg'),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                              '${_currentPosition.toString().split('.').first} / ${_duration.toString().split('.').first}')
                        ],
                      ),
                      slider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FloatingActionButton(
                            heroTag: 'play',
                            onPressed: () {
                              _playMusic();
                            },
                            child: Icon(_isPlaying == false
                                ? Icons.play_arrow
                                : Icons.pause),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                          ),
                          SizedBox(width: 30),
                          FloatingActionButton(
                            heroTag: 'stop',
                            onPressed: () {
                              _stopMusic();
                            },
                            child: Icon(Icons.stop),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ));
  }

  Widget slider() {
    return SliderTheme(
        data: SliderThemeData(
          trackHeight: 5,
        ),
        child: Slider(
            min: 0.0,
            max: _duration.inSeconds.toDouble(),
            value: _currentPosition.inSeconds.toDouble(),
            onChanged: (double value) {
              setState(() {
                _audioPlayer.seek(Duration(seconds: value.toInt()));
              });
            }));
  }
}
