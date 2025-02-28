import 'package:flutter/material.dart';
import 'package:flutter_tenement/models/upgrade_model.dart';
import 'package:flutter_tenement/widgets/button_widget.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:hive/hive.dart';
import 'package:url_launcher/url_launcher.dart';

class SmallWindow {
  static final SmallWindow _instance = SmallWindow._();

  factory SmallWindow() => _instance;

  SmallWindow._();

  var box = Hive.box('Box');
  var parentKey = GlobalKey();
  var childKey = GlobalKey();

  ///浮窗
  OverlayEntry? overlayEntry;

  show(BuildContext context, UpgradeModel upgrade) {
    if (overlayEntry == null) {
      overlayEntry = OverlayEntry(
        builder: (BuildContext context) {
          return Stack(
            key: parentKey,
            fit: StackFit.expand,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                color: Colors.black12,
              ),
              Positioned(
                key: childKey,
                left: 20,
                top: 200,
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width - 40,
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "发现新版本",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              decoration: TextDecoration.none,
                            ),
                          ),
                          Padding(padding: EdgeInsets.only(top: 30)),
                          HtmlWidget(
                            upgrade.content ?? '',
                            textStyle: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                              decoration: TextDecoration.none,
                            ),
                          ),
                          Padding(padding: EdgeInsets.only(bottom: 30)),
                          Row(
                            children: [
                              HCButton(
                                width:
                                    MediaQuery.of(context).size.width / 2 - 50,
                                backgroundColor: Colors.grey,
                                onPressed: () {
                                  hide();
                                },
                                text: '暂不升级',
                              ),
                              Padding(padding: EdgeInsets.only(left: 20)),
                              HCButton(
                                width:
                                    MediaQuery.of(context).size.width / 2 - 50,
                                onPressed: () {
                                  _launchUrl(upgrade.url ?? '');
                                  hide();
                                },
                                text: '立即体验',
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      );
      Overlay.of(context).insert(overlayEntry!);
    }
  }

  ///关闭小窗
  void hide() {
    overlayEntry?.remove();
    overlayEntry = null;
  }

  // 跳转打开自带浏览器下载
  Future<void> _launchUrl(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }
}
