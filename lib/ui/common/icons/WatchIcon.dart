import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fossil/ui/common/icons/fonts/PebbleWatchIcons.dart';

class _WatchLayer {
  _WatchLayer(this.layer, this.color);
  final IconData layer;
  final Color color;
}

class WatchIcon extends StatelessWidget {
  WatchIcon(this.layers, {this.size = 48.0});
  final List<_WatchLayer> layers;
  final double size;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: layers
          .map((e) => Icon(
                e.layer,
                color: e.color,
                size: size,
              ))
          .toList(),
    );
  }
}

class PebbleWatchIcon {
  // First layer = bottom layer, last layer = top layer (draw order)
  static WatchIcon Classic(Color bodyColor, {double size = 48.0}) => WatchIcon(
        [
          _WatchLayer(PebbleWatchIcons.classic_body_fill, bodyColor),
          _WatchLayer(PebbleWatchIcons.classic_body_stroke, Colors.black),
          _WatchLayer(PebbleWatchIcons.classic_screen_fill, Colors.white),
          _WatchLayer(PebbleWatchIcons.classic_screen_stroke, Colors.black),
        ],
        size: size,
      );
  static WatchIcon Time(Color bodyColor, {double size = 48.0}) => WatchIcon(
        [
          _WatchLayer(PebbleWatchIcons.time_body_fill, bodyColor),
          _WatchLayer(PebbleWatchIcons.time_body_stroke, Colors.black),
          _WatchLayer(PebbleWatchIcons.time_screen_fill, Colors.white),
          _WatchLayer(PebbleWatchIcons.time_screen_stroke, Colors.black),
        ],
        size: size,
      );
  static WatchIcon Round(Color bodyColor,
          {Color bodyStrokeColor = Colors.black, double size = 48.0}) =>
      WatchIcon(
        [
          _WatchLayer(PebbleWatchIcons.time_round_body_fill, bodyColor),
          _WatchLayer(PebbleWatchIcons.time_round_body_stroke, bodyStrokeColor),
          _WatchLayer(PebbleWatchIcons.time_round_screen_fill, Colors.white),
          _WatchLayer(PebbleWatchIcons.time_round_screen_stroke, Colors.black),
        ],
        size: size,
      );
  static WatchIcon Two(Color bodyColor, Color buttonsColor,
          {Color bezelColor = Colors.black, double size = 48.0}) =>
      WatchIcon(
        [
          _WatchLayer(PebbleWatchIcons.pebble_2_buttons_stroke, buttonsColor),
          _WatchLayer(PebbleWatchIcons.pebble_2_body_fill, bodyColor),
          _WatchLayer(PebbleWatchIcons.pebble_2_body_stroke, Colors.black),
          _WatchLayer(PebbleWatchIcons.pebble_2_screen_fill, Colors.white),
          _WatchLayer(PebbleWatchIcons.pebble_2_screen_stroke, bezelColor)
        ],
        size: size,
      );
}

class PebbleWatchColor {
  // Defining colors used for different Pebble models
  static const Color Black = Color(0xFF444444); // Body color for black watches
  static const Color Red = Color(0xFFE03A3A); // Body color for red classics
  static const Color White =
      Color(0xFFFFFFFF); // Body color for white classic/P2
  static const Color Grey = Color(0xFF999999); // Body color for grey classic
  static const Color Orange =
      Color(0xFFFA8921); // Body color for orange classic
  static const Color HotPink =
      Color(0xFFFF60A3); // They sure made a lot of these huh
  static const Color FreshGreen =
      Color(0xFFC7EC42); // Body color for green classics
  static const Color FlyBlue =
      Color(0xFF03E0FF); // Body color for blue classics

  static const Color Silver =
      Color(0xFFC4C4C4); // Body color for silver watches
  static const Color Gold = Color(0xFFECC284); // Body color for gold time steel
  static const Color RoseGold =
      Color(0xFFD7A17F); // Body stroke color for gold time round

  static const Color Turquoise =
      Color(0xFF3B8E94); // Button+screen stroke for turq/white P2HR
  static const Color Flame =
      Color(0xFFE03A3A); // Button color for red/black P2HR
  static const Color Lime =
      Color(0xFFBFE051); // Button color for green/black P2HR
}
