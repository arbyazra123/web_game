// import 'package:flutter/material.dart';
// import 'package:web_game/shared/shared.dart';

// class WebViewScreen extends StatefulWidget {
//   final String title;
//   final String url;

//   const WebViewScreen({Key key, this.title, this.url}) : super(key: key);
//   @override
//   _WebViewScreenState createState() => _WebViewScreenState();
// }

// class _WebViewScreenState extends State<WebViewScreen> {
//   InAppWebViewController webView;
//   double progress = 0;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: DefaultAppBarAtm(
//         title: widget.title,
//       ),
//       body: Column(
//         children: [
//           Container(
//               child: progress < 1.0
//                   ? LinearProgressIndicator(value: progress)
//                   : Container()),
//           Expanded(
//             child: Container(
//               decoration:
//                   BoxDecoration(border: Border.all(color: Colors.blueAccent)),
//               child: InAppWebView(
//                 initialUrl: widget.url,
//                 initialHeaders: {},
//                 initialOptions: InAppWebViewGroupOptions(

//                     // android: AndroidInAppWebViewOptions(
//                     //     domStorageEnabled: true, databaseEnabled: true),
//                     crossPlatform: InAppWebViewOptions(
                      
//                         // useShouldOverrideUrlLoading: true,
//                         // javaScriptEnabled: true,
//                         // debuggingEnabled: false,

//                         // debuggingEnabled: true,
//                         )),
//                 onWebViewCreated: (InAppWebViewController controller) {
//                   webView = controller;
//                   print("loaded");
//                   controller.evaluateJavascript(source: "document.querySelector('nav').style.display='none';");
//                 },
//                 onLoadStart: (InAppWebViewController controller, String url) async {
//                   // String overrideJs = await jsInjectionString(context, 'assets/my_css_override.css');
//                   controller.evaluateJavascript(source: "document.querySelector('nav').style.display='none';");
                  
//                 },
//                 onLoadStop:
//                     (InAppWebViewController controller, String url) async {
//                       controller.evaluateJavascript(source: "document.querySelector('nav').style.display='none';");
//                     },
//                 onLoadError: (controller, url, code, message) async {
//                   print("error $url: $code, $message");

//                   var tRexHtml = await controller.getTRexRunnerHtml();
//                   var tRexCss = await controller.getTRexRunnerCss();
//                   controller.loadData(data: """
//                         <html>
//                           <head>
//                             <meta charset="utf-8">
//                             <meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=no">
//                             <style>$tRexCss</style>
//                           </head>
//                           <body>
//                             $tRexHtml
//                             <p>
//                               Error: $code, $message
//                             </p>
//                           </body>
//                         </html>
//                   """);
//                 },
//                 onProgressChanged:
//                     (InAppWebViewController controller, int progress) {
//                   setState(() {
//                     this.progress = progress / 100;
//                   });
//                 },
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

// }
