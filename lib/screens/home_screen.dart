import 'package:flutter/material.dart';
import '../widgets/custom_form.dart';
import 'package:get/get.dart';
import '../controllers/settings_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final settingsController = Get.find<SettingsController>();

    return Scaffold(
      body: Column(
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
               
                  IconButton(
                    icon: const Icon(Icons.translate),
                    onPressed: settingsController.toggleLanguage,
                  ),
                
                  Obx(() => IconButton(
                        icon: Icon(
                          settingsController.isDarkMode
                              ? Icons.light_mode
                              : Icons.dark_mode,
                        ),
                        onPressed: settingsController.toggleTheme,
                      )),
                ],
              ),
            ),
          ),
       
          Expanded(
            child: Center(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.95,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    CustomPaint(
                      size: Size(
                        MediaQuery.of(context).size.width * 0.95,
                        MediaQuery.of(context).size.height * 0.9,
                      ),
                      painter: CurvePainter(),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 40.0,
                        vertical: 30.0,
                      ),
                      child: CustomForm(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = const Color(0xFF000080)
      ..style = PaintingStyle.fill;

    var path = Path();

    path.moveTo(0, size.height * 0.15);
    path.quadraticBezierTo(
      size.width * 0.5,
      size.height * 0.1,
      size.width,
      size.height * 0.15,
    );
    path.lineTo(size.width, size.height * 0.85);
    path.quadraticBezierTo(
      size.width * 0.5,
      size.height * 0.9,
      0,
      size.height * 0.85,
    );
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
