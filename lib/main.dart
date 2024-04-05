import 'dart:async';
import 'package:flutter/material.dart';
import 'package:task/common/texfiled.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: true,
      home: AppNavigator(),
    ),
  );
}

class AppNavigator extends StatelessWidget {
  const AppNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
      },
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        ),
      );
    });

    return Scaffold(
      backgroundColor: Colors.orange[700],
      body: Center(
        child: Container(
          width: 200,
          height: 300,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.cloud,
                color: Colors.orange[700],
                size: 100,
              ),
              const SizedBox(height: 20),
              Text(
                'codeland',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange[700],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Codeland Login',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
                const Text(
                  'codeland',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange,
                  ),
                ),
                const SizedBox(height: 20),
                const Icon(
                  Icons.cloud,
                  color: Colors.orange,
                  size: 100,
                ),
                const SizedBox(height: 50),
                const Text(
                  'Biomedical Kiosk',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 30),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextFieldWithTitle(
                    label: "User Name",
                  ),
                ),
                const SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextFieldWithTitle(
                    label: "Password",
                  ),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const UploadImage(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 50,
                      vertical: 15,
                    ),
                  ),
                  child: const Text('Login'),
                ),
                const SizedBox(height: 30),
                const Text(
                  'For Assistance & Login Details Contact:',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'English, Kannada & Telugu : 7405333800',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'English, Kannada & Hindi  : 9071384585',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'v1.7 © 2023, Codeland Infosolutions Pvt Ltd',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
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

class DottedBorderSide extends BorderSide {

  final Color color;
  final BorderStyle style;

  const DottedBorderSide({
    this.color = Colors.grey,
    super.width,
    this.style = BorderStyle.solid,
  }) : super(color: color);

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    final Paint paint = Paint()
      ..color = color
      ..strokeWidth = width
      ..style = PaintingStyle.stroke;

    const double dashWidth = 5;
    const double gapWidth = 5;
    double currentX = rect.left;

    while (currentX < rect.right) {
      canvas.drawLine(
        Offset(currentX, rect.top),
        Offset(currentX + dashWidth, rect.top),
        paint,
      );
      currentX += dashWidth + gapWidth;
    }
  }
}

class UploadImage extends StatelessWidget {
  const UploadImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Upload an Image'),
            SizedBox(
              width: 320,
              height: 500,
              child: CustomPaint(
                painter: RectangularDottedBorderPainter(
                    color: Colors.grey, width: 2),
                child: const Center(
                  child: Icon(
                    Icons.image,
                    size: 60,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Handle upload button press
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                  ),
                  child: const Text('Upload'),
                ),
                const SizedBox(width: 20),
                OutlinedButton(
                  onPressed: () {
                    // Handle view button press
                  },
                  child: const Text('View'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class RectangularDottedBorderPainter extends CustomPainter {
  final Color color;
  final double width;

  RectangularDottedBorderPainter({required this.color, required this.width});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..strokeWidth = width
      ..style = PaintingStyle.stroke;

    const double dashWidth = 5;
    const double gapWidth = 5;
    double currentX = 0;

    while (currentX < size.width) {
      canvas.drawLine(
        Offset(currentX, 0),
        Offset(currentX + dashWidth, 0),
        paint,
      );
      currentX += dashWidth + gapWidth;
    }

    currentX = size.width;
    while (currentX > 0) {
      canvas.drawLine(
        Offset(currentX, size.height),
        Offset(currentX - dashWidth, size.height),
        paint,
      );
      currentX -= dashWidth + gapWidth;
    }

    double currentY = 0;
    while (currentY < size.height) {
      canvas.drawLine(
        Offset(0, currentY),
        Offset(0, currentY + dashWidth),
        paint,
      );
      currentY += dashWidth + gapWidth;
    }

    currentY = size.height;
    while (currentY > 0) {
      canvas.drawLine(
        Offset(size.width, currentY),
        Offset(size.width, currentY - dashWidth),
        paint,
      );
      currentY -= dashWidth + gapWidth;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
