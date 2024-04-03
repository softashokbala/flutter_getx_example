import 'package:flutter/material.dart';
import 'package:flutter_getx_example/count_controller.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Homepage(),
    );
  }
}

class Homepage extends StatelessWidget {
  //const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    var mController = Get.put(CountController());

    return Scaffold(
        body: Center(
          child: Column(children: [
            Obx(() => Text(mController.count.toString())),
            ElevatedButton(
                onPressed: () => Get.to(Other()),
                child: const Text("Go to Other"))
          ]),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
                child: Icon(Icons.add), onPressed: mController.increment),
            const Gap(20),
            FloatingActionButton(
                child: Icon(Icons.minimize_rounded),
                onPressed: mController.decrement),
          ],
        ));
  }
}

class Other extends StatelessWidget {
  // You can ask Get to find a Controller that is being used by another page and redirect you to it.
  final CountController c = Get.find();

  @override
  Widget build(context) {
    // Access the updated count variable
    return Scaffold(body: Center(child: Text("${c.count}")));
  }
}
