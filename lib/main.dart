// // import 'dart:convert';

// // import 'package:flutter/material.dart';

// // import 'package:http/http.dart' as httpClient;
// // import 'package:wallpaper__app/cartmodel.dart';

// // void main() {
// //   runApp(const MyApp());
// // }

// // class MyApp extends StatelessWidget {
// //   const MyApp({super.key});

// //   // This widget is the root of your application.
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //         title: 'Flutter Demo',
// //         theme: ThemeData(
// //           colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
// //           useMaterial3: true,
// //         ),
// //         home: HomePage());
// //   }
// // }

// // class HomePage extends StatefulWidget {
// //   @override
// //   State<HomePage> createState() => _HomePageState();
// // }

// // class _HomePageState extends State<HomePage> {
// //   DataModel? dataModel;

// //   @override
// //   void initState() {
// //     // TODO: implement initState
// //     super.initState();
// //     getCart();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //         appBar: AppBar(
// //           title: Text('Quotes'),
// //         ),
// //         body: dataModel != null && dataModel!.carts.isNotEmpty
// //             ? ListView.builder(
// //                 itemCount: dataModel!.carts.length,
// //                 itemBuilder: (context, index) {
// //                   return Padding(
// //                     padding: const EdgeInsets.all(8.0),
// //                     child: Card(
// //                       child: ListTile(
// //                         title: Text(dataModel!.carts[index].total.toString()),
// //                         subtitle: Text(
// //                             dataModel!.carts[index].totalQuantity.toString()),
// //                       ),
// //                     ),
// //                   );
// //                 })
// //             : Container(
// //                 child: Center(
// //                   child: Text('Fetching quotes'),
// //                 ),
// //               ));
// //   }

// //   void getCart() async {
// //     var uri = Uri.parse('https://dummyjson.com/carts');
// //     var response = await httpClient.get(uri);
// //     // print("code : ${response.statusCode}");
// //     // print("body : ${response.body}");

// //     if (response.statusCode == 200) {
// //       var mData = jsonDecode(response.body);
// //       dataModel = DataModel.fromJson(mData);
// //       setState(() {});
// //       // print(dataModel);
// //     }
// //   }
// // }

// // // import 'dart:convert';

// // // import 'package:flutter/material.dart';

// // // import 'package:http/http.dart' as httpClient;
// // // import 'package:wallpaper__app/data_model.dart';

// // // void main() {
// // //   runApp(const MyApp());
// // // }

// // // class MyApp extends StatelessWidget {
// // //   const MyApp({super.key});

// // //   // This widget is the root of your application.
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return MaterialApp(
// // //         title: 'Flutter Demo',
// // //         theme: ThemeData(
// // //           colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
// // //           useMaterial3: true,
// // //         ),
// // //         home: HomePage());
// // //   }
// // // }

// // // class HomePage extends StatefulWidget {
// // //   @override
// // //   State<HomePage> createState() => _HomePageState();
// // // }

// // // class _HomePageState extends State<HomePage> {
// // //   DataModel? dataModel;

// // //   @override
// // //   void initState() {
// // //     // TODO: implement initState
// // //     super.initState();
// // //     getQuotes();
// // //   }

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //         appBar: AppBar(
// // //           title: Text('Quotes'),
// // //         ),
// // //         body: dataModel != null && dataModel!.quotes.isNotEmpty
// // //             ? ListView.builder(
// // //                 itemCount: dataModel!.quotes.length,
// // //                 itemBuilder: (context, index) {
// // //                   return Padding(
// // //                     padding: const EdgeInsets.all(8.0),
// // //                     child: Card(
// // //                       child: ListTile(
// // //                         // title: Text(dataModel!.quotes[index].quote),
// // //                         subtitle: Text(dataModel!.quotes[index].author),
// // //                       ),
// // //                     ),
// // //                   );
// // //                 })
// // //             : Container(
// // //                 child: Center(
// // //                   child: Text('Fetching quotes'),
// // //                 ),
// // //               ));
// // //   }

// // //   void getQuotes() async {
// // //     var uri = Uri.parse('https://dummyjson.com/quotes');
// // //     var response = await httpClient.get(uri);
// // //     print("code : ${response.statusCode}");
// // //     print("body : ${response.body}");

// // //     if (response.statusCode == 200) {
// // //       var mData = jsonDecode(response.body);
// // //       dataModel = DataModel.fromJson(mData);
// // //       setState(() {});
// // //       print(dataModel);
// // //     }
// // //   }
// // // }
import 'package:cart_api/screen/cart_home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
