import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter/services.dart';

class MenuPopUpDetailWidget extends StatefulWidget {
  MenuPopUpDetailWidget({Key? key, required this.urlImage, required this.name})
      : super(
          key: key,
        );
  final String urlImage;
  final String name;
  @override
  State<MenuPopUpDetailWidget> createState() => _MenuPopUpDetailWidgetState();
}

class _MenuPopUpDetailWidgetState extends State<MenuPopUpDetailWidget> {
  Future<void> downloadImage() async {
    var status = await Permission.storage.request();
    
    if (status.isGranted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.only(bottom: 540, right: 0, left: 0),
          content: Text("Image is downloading"),
          duration: Duration(seconds: 2),
        ),
      );
      Uint8List bytes = (await NetworkAssetBundle(Uri.parse(widget.urlImage))
              .load(widget.urlImage))
          .buffer
          .asUint8List();
      await ImageGallerySaver.saveImage(Uint8List.fromList(bytes),
          quality: 60, name: widget.name);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.only(bottom: 540, right: 0, left: 0),
          content: Text("Image is downloaded"),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  Future<void> setWallpaper() async {
    String url = widget.urlImage;

    int location = WallpaperManager
        .BOTH_SCREEN; // or location = WallpaperManager.LOCK_SCREEN;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.only(bottom: 540, right: 20, left: 20),
        content: Text("Waitting set wallpaper"),
        duration: Duration(seconds: 2),
      ),
    );
    var file = await DefaultCacheManager().getSingleFile(url);

    await WallpaperManager.setWallpaperFromFile(file.path, location);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.only(bottom: 540, right: 20, left: 20),
        content: Text("Success"),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _showPopupMenu() async {
    final value = await showMenu(
      context: context,
      position: RelativeRect.fromLTRB(20, 20, 0, 0),
      color: Colors.grey[900],
      items: [
        PopupMenuItem<String>(
            child: const Text(
              'Download',
              style: TextStyle(color: Colors.white),
            ),
            value: 'Download'),
        PopupMenuItem<String>(
            child: const Text(
              'Set Wallpapers',
              style: TextStyle(color: Colors.white),
            ),
            value: 'Wallpapers'),
        PopupMenuItem<String>(
            child: const Text(
              'Report',
              style: TextStyle(color: Colors.white),
            ),
            value: 'Report'),
      ],
      elevation: 8.0,
    );
    if (value.toString() == "Download") {
      downloadImage();
    } else if (value.toString() == "Wallpapers") {
      setWallpaper();
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _showPopupMenu,
      child: Container(
        height: 35,
        width: 35,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.black26,
        ),
        child: const Icon(
          Icons.more_horiz,
          color: Colors.white,
        ),
      ),
    );
  }
}
