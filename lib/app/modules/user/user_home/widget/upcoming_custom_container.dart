import 'package:flutter/material.dart';

// class RPSCustomPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     Path path_0 = Path();
//     path_0.moveTo(size.width * 0.002314815, size.height * 0.1095890);
//     path_0.cubicTo(
//         size.width * 0.002314815,
//         size.height * 0.08372648,
//         size.width * 0.002316454,
//         size.height * 0.06444429,
//         size.width * 0.003663920,
//         size.height * 0.04961644);
//     path_0.cubicTo(
//         size.width * 0.005008395,
//         size.height * 0.03482196,
//         size.width * 0.007680031,
//         size.height * 0.02463315,
//         size.width * 0.01293673,
//         size.height * 0.01685616);
//     path_0.cubicTo(
//         size.width * 0.01819340,
//         size.height * 0.009079132,
//         size.width * 0.02508028,
//         size.height * 0.005126575,
//         size.width * 0.03508025,
//         size.height * 0.003137489);
//     path_0.cubicTo(
//         size.width * 0.04510278,
//         size.height * 0.001143977,
//         size.width * 0.05813611,
//         size.height * 0.001141553,
//         size.width * 0.07561728,
//         size.height * 0.001141553);
//     path_0.lineTo(size.width * 0.6831389, size.height * 0.001141553);
//     path_0.cubicTo(
//         size.width * 0.5949600,
//         size.height * 0.802326,
//         size.width * 0.36800,
//         size.height * 0.09310457,
//         size.width * 0.10295200,
//         size.height * 0.09310457);
//     path_0.cubicTo(
//         size.width * 0.0932000,
//         size.height * 0.0040988,
//         size.width * 0.0001333,
//         size.height * 0.0709593,
//         size.width * 0.5007733,
//         size.height * 0.0622384);
//     // path_0.cubicTo(
//     //     size.width * 0.5023735,
//     //     size.height * 0.0,
//     //     size.width * 0.6086636,
//     //     size.height * 0.0,
//     //     size.width * 0.5093920,
//     //     size.height * 0.0);
//     path_0.lineTo(size.width * 0.6086636, size.height * 0.1);
//     path_0.cubicTo(
//         size.width * 0.6823735,
//         size.height * 0.0781279,
//         size.width * 0.6486636,
//         size.height * 0.1081279,
//         size.width * 0.6893920,
//         size.height * 0.1381279);
//     /////   Move Back In From Right Corner
//     // path_0.cubicTo(
//     //     size.width * 0.6893920,
//     //     size.height * 0.750081301,
//     //     size.width * 0.6540988,
//     //     size.height * 0.000,
//     //     size.width * 0.65090957,
//     //     size.height * 0.14000);
//     path_0.cubicTo(
//         size.width * 0.8027500,
//         size.height * 0.1381279,
//         size.width * 0.8071204,
//         size.height * 0.1381279,
//         size.width * 0.8156019,
//         size.height * 0.1381279);
//     path_0.lineTo(size.width * 0.8157315, size.height * 0.1381279);
//     path_0.lineTo(size.width * 0.9243827, size.height * 0.1381279);
//     path_0.cubicTo(
//         size.width * 0.9418642,
//         size.height * 0.1381279,
//         size.width * 0.9548981,
//         size.height * 0.1381301,
//         size.width * 0.9649198,
//         size.height * 0.1401237);
//     path_0.cubicTo(
//         size.width * 0.9749198,
//         size.height * 0.1421128,
//         size.width * 0.9818056,
//         size.height * 0.1460653,
//         size.width * 0.9870648,
//         size.height * 0.1538425);
//     path_0.cubicTo(
//         size.width * 0.9923210,
//         size.height * 0.1616196,
//         size.width * 0.9949907,
//         size.height * 0.1718082,
//         size.width * 0.9963364,
//         size.height * 0.1866032);
//     path_0.cubicTo(
//         size.width * 0.9976821,
//         size.height * 0.2014306,
//         size.width * 0.9976852,
//         size.height * 0.2207128,
//         size.width * 0.9976852,
//         size.height * 0.2465753);
//     path_0.lineTo(size.width * 0.9976852, size.height * 0.8904110);
//     path_0.cubicTo(
//         size.width * 0.9976852,
//         size.height * 0.9162740,
//         size.width * 0.9976821,
//         size.height * 0.9355571,
//         size.width * 0.9963364,
//         size.height * 0.9503836);
//     path_0.cubicTo(
//         size.width * 0.9949907,
//         size.height * 0.9651781,
//         size.width * 0.9923210,
//         size.height * 0.9753653,
//         size.width * 0.9870648,
//         size.height * 0.9831461);
//     path_0.cubicTo(
//         size.width * 0.9818056,
//         size.height * 0.9909224,
//         size.width * 0.9749198,
//         size.height * 0.9948721,
//         size.width * 0.9649198,
//         size.height * 0.9968630);
//     path_0.cubicTo(
//         size.width * 0.9548981,
//         size.height * 0.9988539,
//         size.width * 0.9418642,
//         size.height * 0.9988584,
//         size.width * 0.9243827,
//         size.height * 0.9988584);
//     path_0.lineTo(size.width * 0.07561728, size.height * 0.9988584);
//     path_0.cubicTo(
//         size.width * 0.05813611,
//         size.height * 0.9988584,
//         size.width * 0.04510278,
//         size.height * 0.9988539,
//         size.width * 0.03508025,
//         size.height * 0.9968630);
//     path_0.cubicTo(
//         size.width * 0.02508025,
//         size.height * 0.9948721,
//         size.width * 0.01819340,
//         size.height * 0.9909224,
//         size.width * 0.01293673,
//         size.height * 0.9831461);
//     path_0.cubicTo(
//         size.width * 0.007680031,
//         size.height * 0.9753653,
//         size.width * 0.005008395,
//         size.height * 0.9651781,
//         size.width * 0.003663920,
//         size.height * 0.9503836);
//     path_0.cubicTo(
//         size.width * 0.002316454,
//         size.height * 0.9355571,
//         size.width * 0.002314815,
//         size.height * 0.9162740,
//         size.width * 0.002314815,
//         size.height * 0.8904110);
//     path_0.lineTo(size.width * 0.002314815, size.height * 0.1095890);
//     path_0.close();

//     Paint paint_0_stroke = Paint()
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = size.width * 0.001543210;
//     paint_0_stroke.color = Color(0xffC4C4C4).withOpacity(1.0);
//     canvas.drawPath(path_0, paint_0_stroke);

//     Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
//     paint_0_fill.color = Colors.white.withOpacity(1.0);
//     canvas.drawPath(path_0, paint_0_fill);
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return true;
//   }
// }

class RPSCustomPainters extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.002314815, size.height * 0.1095890);
    path_0.cubicTo(
        size.width * 0.002314815,
        size.height * 0.08372648,
        size.width * 0.002316454,
        size.height * 0.06444429,
        size.width * 0.003663920,
        size.height * 0.04961644);
    path_0.cubicTo(
        size.width * 0.005008395,
        size.height * 0.03482196,
        size.width * 0.007680031,
        size.height * 0.02463315,
        size.width * 0.01293673,
        size.height * 0.01685616);
    path_0.cubicTo(
        size.width * 0.01819340,
        size.height * 0.009079132,
        size.width * 0.02508028,
        size.height * 0.005126575,
        size.width * 0.03508025,
        size.height * 0.003137489);
    path_0.cubicTo(
        size.width * 0.04510278,
        size.height * 0.001143977,
        size.width * 0.05813611,
        size.height * 0.001141553,
        size.width * 0.07561728,
        size.height * 0.001141553);
    path_0.lineTo(size.width * 0.7231389, size.height * 0.001141553);
    path_0.cubicTo(
        size.width * 0.7317809,
        size.height * 0.001141553,
        size.width * 0.7359907,
        size.height * 0.001147082,
        size.width * 0.7394753,
        size.height * 0.002172479);
    path_0.cubicTo(
        size.width * 0.7538611,
        size.height * 0.006406073,
        size.width * 0.7651049,
        size.height * 0.02304370,
        size.width * 0.7679691,
        size.height * 0.04432735);
    path_0.cubicTo(
        size.width * 0.7686605,
        size.height * 0.04948219,
        size.width * 0.7686636,
        size.height * 0.05570822,
        size.width * 0.7686636,
        size.height * 0.06849315);
    path_0.lineTo(size.width * 0.7686636, size.height * 0.06868493);
    path_0.cubicTo(
        size.width * 0.7686636,
        size.height * 0.08123425,
        size.width * 0.7686636,
        size.height * 0.08770046,
        size.width * 0.7693920,
        size.height * 0.09310457);
    path_0.cubicTo(
        size.width * 0.7723735,
        size.height * 0.1152936,
        size.width * 0.7840988,
        size.height * 0.1326393,
        size.width * 0.7990957,
        size.height * 0.1370530);
    path_0.cubicTo(
        size.width * 0.8027500,
        size.height * 0.1381279,
        size.width * 0.8071204,
        size.height * 0.1381279,
        size.width * 0.8156019,
        size.height * 0.1381279);
    path_0.lineTo(size.width * 0.8157315, size.height * 0.1381279);
    path_0.lineTo(size.width * 0.9243827, size.height * 0.1381279);
    path_0.cubicTo(
        size.width * 0.9418642,
        size.height * 0.1381279,
        size.width * 0.9548981,
        size.height * 0.1381301,
        size.width * 0.9649198,
        size.height * 0.1401237);
    path_0.cubicTo(
        size.width * 0.9749198,
        size.height * 0.1421128,
        size.width * 0.9818056,
        size.height * 0.1460653,
        size.width * 0.9870648,
        size.height * 0.1538425);
    path_0.cubicTo(
        size.width * 0.9923210,
        size.height * 0.1616196,
        size.width * 0.9949907,
        size.height * 0.1718082,
        size.width * 0.9963364,
        size.height * 0.1866032);
    path_0.cubicTo(
        size.width * 0.9976821,
        size.height * 0.2014306,
        size.width * 0.9976852,
        size.height * 0.2207128,
        size.width * 0.9976852,
        size.height * 0.2465753);
    path_0.lineTo(size.width * 0.9976852, size.height * 0.8904110);
    path_0.cubicTo(
        size.width * 0.9976852,
        size.height * 0.9162740,
        size.width * 0.9976821,
        size.height * 0.9355571,
        size.width * 0.9963364,
        size.height * 0.9503836);
    path_0.cubicTo(
        size.width * 0.9949907,
        size.height * 0.9651781,
        size.width * 0.9923210,
        size.height * 0.9753653,
        size.width * 0.9870648,
        size.height * 0.9831461);
    path_0.cubicTo(
        size.width * 0.9818056,
        size.height * 0.9909224,
        size.width * 0.9749198,
        size.height * 0.9948721,
        size.width * 0.9649198,
        size.height * 0.9968630);
    path_0.cubicTo(
        size.width * 0.9548981,
        size.height * 0.9988539,
        size.width * 0.9418642,
        size.height * 0.9988584,
        size.width * 0.9243827,
        size.height * 0.9988584);
    path_0.lineTo(size.width * 0.07561728, size.height * 0.9988584);
    path_0.cubicTo(
        size.width * 0.05813611,
        size.height * 0.9988584,
        size.width * 0.04510278,
        size.height * 0.9988539,
        size.width * 0.03508025,
        size.height * 0.9968630);
    path_0.cubicTo(
        size.width * 0.02508025,
        size.height * 0.9948721,
        size.width * 0.01819340,
        size.height * 0.9909224,
        size.width * 0.01293673,
        size.height * 0.9831461);
    path_0.cubicTo(
        size.width * 0.007680031,
        size.height * 0.9753653,
        size.width * 0.005008395,
        size.height * 0.9651781,
        size.width * 0.003663920,
        size.height * 0.9503836);
    path_0.cubicTo(
        size.width * 0.002316454,
        size.height * 0.9355571,
        size.width * 0.002314815,
        size.height * 0.9162740,
        size.width * 0.002314815,
        size.height * 0.8904110);
    path_0.lineTo(size.width * 0.002314815, size.height * 0.1095890);
    path_0.close();

    Paint paintBorder = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.001543210;
    paintBorder.color = const Color(0xffC4C4C4);
    canvas.drawPath(path_0, paintBorder);

    Paint paintfill = Paint()..style = PaintingStyle.fill;
    paintfill.color = Colors.white.withOpacity(1);
    canvas.drawPath(path_0, paintfill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
