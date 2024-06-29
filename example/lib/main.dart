import 'package:flutter/material.dart';
import 'package:wx_tile/wx_tile.dart';
import 'package:wx_text/wx_text.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WxTile Example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return WxListTileTheme.merge(
      wrapper: WxListTileWrapper.inkWell(
        // splashFactory: NoSplash.splashFactory,
        borderRadius: BorderRadius.circular(5),
      ),
      // wrapper: (context, widget) {
      //   return OutlinedButton(
      //     onPressed: widget.onTap,
      //     child: widget.child,
      //   );
      // },
      // style: WxListTileStyle(
      //   inline: true,
      //   textAlign: WxTextAlign.center,
      // ),
      child: Wrapper(
        children: <Widget>[
          const SizedBox(height: 40),
          const WxText.displayMedium(
            'WxTile',
            gradient: LinearGradient(
              colors: [
                Colors.green,
                Colors.blue,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            fontWeight: FontWeight.bold,
            letterSpacing: -2,
          ),
          const SizedBox(height: 10),
          const Example(
            title: 'Basic Tile',
            child: DefaultTextStyle(
              style: TextStyle(
                backgroundColor: Colors.amber,
                color: Colors.black87,
              ),
              child: Wrap(
                spacing: 20,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  DefaultTextStyle(
                    style: TextStyle(
                      backgroundColor: Colors.blue,
                      color: Colors.white,
                    ),
                    child: WxTile(
                      spacing: 10,
                      leading: Text('Leading'),
                      trailing: Text('Trailing'),
                      child: Text('Horizontal Tile'),
                    ),
                  ),
                  WxTile(
                    spacing: 3,
                    direction: Axis.vertical,
                    leading: Text('Leading'),
                    trailing: Text('Trailing'),
                    child: Text('Vertical Tile'),
                  ),
                ],
              ),
            ),
          ),
          const Example(
            title: 'Text Tile',
            child: DefaultTextStyle(
              style: TextStyle(
                backgroundColor: Colors.amber,
                color: Colors.black87,
              ),
              child: WxTextTile(
                title: Text('Title'),
                subtitle: Text('Subtitle'),
                spacing: 5,
                align: TextAlign.right,
              ),
            ),
          ),
          Example(
            title: 'List Tile',
            child: WxListTile(
              title: const Text('title'),
              subtitle: const Text('subtitle'),
              leading: const Icon(Icons.access_time),
              trailing: IconButton(
                icon: const Icon(Icons.close),
                onPressed: () {},
              ),
              textColor: Colors.blue,
              iconColor: Colors.amber,
              onTap: () {},
            ),
          ),
          Example(
            title: 'Inline List Tile',
            child: WxListTile(
              title: const Text('title'),
              subtitle: const Text('subtitle'),
              leading: const Icon(Icons.access_time),
              trailing: IconButton(
                icon: const Icon(Icons.close),
                onPressed: () {},
              ),
              inline: true,
              textAlign: TextAlign.center,
              textColor: Colors.blue,
              iconColor: Colors.amber,
              style: const WxListTileStyle.dense(),
              onTap: () {},
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}

class Wrapper extends StatelessWidget {
  const Wrapper({
    super.key,
    required this.children,
  });

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 400),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: children,
            ),
          ),
        ),
      ),
    );
  }
}

class Example extends StatelessWidget {
  const Example({
    super.key,
    required this.title,
    required this.child,
  });

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
          child: WxText.labelLarge(title),
        ),
        Card.outlined(
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Center(child: child),
            ),
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
