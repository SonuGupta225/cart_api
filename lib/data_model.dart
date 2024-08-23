// import 'package:flutter/material.dart';

// //* Pure json ka Model
// class DataModel {
//   int limit;
//   int skip;
//   int total;
//   List<QuoteModel> quotes;

//   DataModel(
//       {required this.limit,
//       required this.quotes,
//       required this.skip,
//       required this.total});

//   factory DataModel.fromJson(Map<String, dynamic> json) {
//     List<QuoteModel> listQuotes = [];
//     for (Map<String, dynamic> eachMap in json['quotes']) {
//       var eachQuotes = QuoteModel.fromJson(eachMap);
//       listQuotes.add(eachQuotes);
//     }
//     return DataModel(
//         limit: json['limit'],
//         quotes: listQuotes,
//         skip: json['skip'],
//         total: json['total']);
//   }
// }

// //* pure list ka model
// class QuoteModel {
//   int id;
//   String author;
//   String quote;

//   QuoteModel({required this.id, required this.author, required this.quote});

//   factory QuoteModel.fromJson(Map<String, dynamic> json) {
//     return QuoteModel(
//         id: json['id'], author: json['author'], quote: json['quote']);
//   }
// }




// //** dart */

// import 'dart:convert';

// import 'package:flutter/material.dart';

// import 'package:http/http.dart' as httpClient;
// import 'package:wallpaper__app/data_model.dart';
// import 'package:wallpaper__app/product/cart.dart';
// import 'package:wallpaper__app/product/cart_data_model.dart';
// import 'package:wallpaper__app/product/cartmodel.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         title: 'Flutter Demo',
//         theme: ThemeData(
//           colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//           useMaterial3: true,
//         ),
//         home: HomePage());
//   }
// }

// class HomePage extends StatefulWidget {
//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   DataModel? dataModel;


//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     getQuotes();
//   }
 

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text('Quotes'),
//         ),
//         body:
//          dataModel != null && dataModel!.quotes.isNotEmpty
//             ? ListView.builder(
//                 itemCount: dataModel!.quotes.length,
//                 itemBuilder: (context, index) {
//                   return Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Card(
//                       child: ListTile(
//                         title: Text(dataModel!.quotes[index].quote),
//                         subtitle: Text(dataModel!.quotes[index].author),
//                       ),
//                     ),
//                   );
//                 })
//             : Container(
//                 child: Center(
//                   child: Text('Fetching quotes'),
//                 ),
//               )
       
//               );
//   }

//   void getQuotes() async {
//     var uri = Uri.parse('https://dummyjson.com/quotes');
//     var response = await httpClient.get(uri);
//     print("code : ${response.statusCode}");
//     print("body : ${response.body}");

//     if (response.statusCode == 200) {
//       var mData = jsonDecode(response.body);
//       dataModel = DataModel.fromJson(mData);
//       setState(() {});
//       print(dataModel);
//     }
//   }

// }
