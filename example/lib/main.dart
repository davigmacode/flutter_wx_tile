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
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SampleCard(
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
                const SampleCard(
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
                      align: WxTextAlign.right,
                    ),
                  ),
                ),
                SampleCard(
                  title: 'Basic List Tile',
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
                    margin: const EdgeInsets.all(15),
                    onTap: () {},
                  ),
                ),
                SampleCard(
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
                    textAlign: WxTextAlign.center,
                    textColor: Colors.blue,
                    iconColor: Colors.amber,
                    style: const WxListTileStyle.dense(),
                    onTap: () {},
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SampleCard extends StatelessWidget {
  const SampleCard({
    super.key,
    required this.title,
    required this.child,
  });

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Card(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 400,
                minHeight: 150,
              ),
              child: Center(child: child),
            ),
          ),
          Positioned(
            top: -8,
            left: 25,
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: Text(
                  ' $title ',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
