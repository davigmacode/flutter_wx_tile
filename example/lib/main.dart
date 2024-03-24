import 'package:flutter/material.dart';
import 'package:wx_tile/wx_tile.dart';

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
    return Scaffold(
      body: WxListTileTheme.merge(
        wrapper: WxListTileWrapper.inkWell(
          splashFactory: NoSplash.splashFactory,
          borderRadius: BorderRadius.circular(5),
          // highlightColor: Colors.amber,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SampleCard(
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
              const SampleCard(
                child: DefaultTextStyle(
                  style: TextStyle(
                    backgroundColor: Colors.amber,
                    color: Colors.black87,
                  ),
                  child: WxTextTile(
                    title: Text('Title'),
                    subtitle: Text('Subtitle'),
                    spacing: 5,
                    align: WxTextTileAlign.right,
                  ),
                ),
              ),
              SampleCard(
                child: DefaultTextStyle(
                  style: const TextStyle(
                    backgroundColor: Colors.amber,
                    color: Colors.black87,
                  ),
                  child: WxListTile(
                    title: const Text('title'),
                    subtitle: const Text('subtitle'),
                    leading: const Text('leading'),
                    trailing: const Text('trailing'),
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.all(10),
                    spacing: 10,
                    textSpacing: 5,
                    // inline: true,
                    onTap: () {},
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SampleCard extends StatelessWidget {
  const SampleCard({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: 400,
          minHeight: 100,
        ),
        child: Center(child: child),
      ),
    );
  }
}
