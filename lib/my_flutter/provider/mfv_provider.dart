import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/my_flutter/widgets/mfv_pics.dart';

final mfvProvider = ChangeNotifierProvider((ref) => MFVNotifier());

class MFVNotifier extends ChangeNotifier {
  int _tIndex = 0;
  int get tIndex => _tIndex;

  void incrementTIndex() {
    _tIndex++;
    _tIndex %= 3;
    notifyListeners();
  }

  final List<PicCard> _picCards = pics
      .map(
        (e) => PicCard(
          e,
          id: pics.indexOf(e),
        ),
      )
      .toList()
      .reversed
      .toList();

  List<PicCard> get picCards => _picCards;

  int _picIndex = 0;
  int get picIndex => _picIndex;

  int _bottomId = 5;
  int get bottomId => _bottomId;

  bool _pop = false;
  bool get pop => _pop;

  bool _push = false;
  bool get push => _push;

  void popAndPush() {
    _pop = true;
    _picIndex++;
    notifyListeners();
    Future.delayed(
      const Duration(milliseconds: 380),
      () {
        _picIndex %= 6;
        final poppedPic = _picCards.removeAt(5);
        notifyListeners();
        Future.delayed(const Duration(milliseconds: 10), () {
          _pop = false;
          notifyListeners();
        });
        _push = true;
        _bottomId = poppedPic.id;
        notifyListeners();
        Future.delayed(const Duration(milliseconds: 10), () {
          _picCards.insert(0, poppedPic);
          notifyListeners();
        });
      },
    );
    Future.delayed(
      const Duration(milliseconds: 380),
      () {
        _push = false;
      },
    );
  }
}

const List<String> pics = [
  'assets/images/1.png',
  'assets/images/2.png',
  'assets/images/3.png',
  'assets/images/4.png',
  'assets/images/5.png',
  'assets/images/6.png',
];


/*
ids - 0 1 2 3 4 5
picIndex - 0 1 2 3 4 5 0 1 2 3 4 5 ...... 
after 1st ticker
id - pIndex = -1 0 1 2 3 4
*/