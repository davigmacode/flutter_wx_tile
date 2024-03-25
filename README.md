[![Pub Version](https://img.shields.io/pub/v/wx_tile)](https://pub.dev/packages/wx_tile) ![GitHub](https://img.shields.io/github/license/davigmacode/flutter_wx_tile) [![GitHub](https://badgen.net/badge/icon/buymeacoffee?icon=buymeacoffee&color=yellow&label)](https://www.buymeacoffee.com/davigmacode) [![GitHub](https://badgen.net/badge/icon/ko-fi?icon=kofi&color=red&label)](https://ko-fi.com/davigmacode)

A highly customizable widget that extends the capabilities of Flutter's ListTile.

[![Preview](https://github.com/davigmacode/flutter_wx_tile/raw/main/media/preview.jpg)](https://davigmacode.github.io/flutter_wx_tile)

[Demo](https://davigmacode.github.io/flutter_wx_tile)

## Usage

To read more about classes and other references used by `wx_tile`, see the [API Reference](https://pub.dev/documentation/wx_tile/latest/).

```dart
WxTile(
  spacing: 10,
  leading: Text('Leading'),
  trailing: Text('Trailing'),
  child: Text('Horizontal Tile'),
)

WxTextTile(
  title: Text('Title'),
  subtitle: Text('Subtitle'),
  spacing: 5,
  align: WxTextAlign.right,
)

WxListTile(
  title: const Text('title'),
  subtitle: const Text('subtitle'),
  leading: const Icon(Icons.access_time),
  trailing: IconButton(
    icon: const Icon(Icons.close),
    onPressed: () {},
  ),
  textColor: Colors.blue,
  iconColor: Colors.amber,
  margin: const EdgeInsets.all(15),
  onTap: () {},
)
```

## Sponsoring

<a href="https://www.buymeacoffee.com/davigmacode" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/v2/default-yellow.png" alt="Buy Me A Coffee" height="45"></a>
<a href="https://ko-fi.com/davigmacode" target="_blank"><img src="https://storage.ko-fi.com/cdn/brandasset/kofi_s_tag_white.png" alt="Ko-Fi" height="45"></a>

If this package or any other package I created is helping you, please consider to sponsor me so that I can take time to read the issues, fix bugs, merge pull requests and add features to these packages.