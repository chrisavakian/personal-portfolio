import 'package:flutter/material.dart';
import '../widgets/navbar.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class HomePage extends StatefulWidget {
  final VoidCallback toggleTheme;
  final bool isDarkMode;

  const HomePage({super.key, required this.toggleTheme, required this.isDarkMode});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  String pathPDF = "";

  @override
  void initState() {
    super.initState();
    fromAsset('assets/resume.pdf', 'resume.pdf').then((f) {
      setState(() {
        pathPDF = f.path;
      });
    });
  }

  Future<File> fromAsset(String asset, String filename) async {
    try {
      var data = await rootBundle.load(asset);
      var bytes = data.buffer.asUint8List();
      var dir = await getApplicationDocumentsDirectory();
      File file = File("${dir.path}/$filename");
      File assetFile = await file.writeAsBytes(bytes);
      return assetFile;
    } catch (e) {
      throw Exception("Error opening asset file");
    }
  }

  void scrollToSection(String section) {
    double offset = 0.0;
    switch (section) {
      case 'about':
        offset = 500; // Adjust based on section's position
        break;
      case 'projects':
        offset = 1000;
        break;
      case 'contact':
        offset = 1500;
        break;
      case 'resume':
        offset = 2000;
        break;
    }
    _scrollController.animateTo(
      offset,
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          NavBar(
            onNavClick: scrollToSection,
            isDarkMode: widget.isDarkMode,
            toggleTheme: widget.toggleTheme,
          ),
          Expanded(
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1200),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Section(
                        title: 'About',
                        content: Text(
                          'This is the about section where you can introduce yourself.',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                      Section(
                        title: 'Projects',
                        content: Text(
                          'Here are some of my projects.',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                      Section(
                        title: 'Contact',
                        content: Text(
                          'Get in touch with me via email or LinkedIn.',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                      Section(
                        title: 'Resume',
                        content: pathPDF.isNotEmpty
                            ? PDFView(filePath: pathPDF)
                            : const Center(child: CircularProgressIndicator()),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Section extends StatelessWidget {
  final String title;
  final Widget content;

  const Section({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.symmetric(vertical: 20.0),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        border: Border(bottom: BorderSide(color: Colors.grey[700]!, width: 1.0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 20),
          content,
        ],
      ),
    );
  }
}
