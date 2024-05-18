// ignore_for_file: prefer_const_literals_to_create_immutables
import 'dart:io';
import 'package:detection/modules/result_detection/result.dart';
import 'package:detection/shared/network/api_service.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import '../../modules/showdoctor_screen/docor drawer/docordrewer.dart';
class Detect extends StatefulWidget {
  @override
  State<Detect> createState() => _DetectState();
}
class _DetectState extends State<Detect> {
  int _selectedIndex = 0;
  File? _image;
  String? _classValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detection'),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _selectedIndex == 0 ? _buildImageWidget() : _buildResultPage(),
          // Text(_classValue ?? ''),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          const BottomNavigationBarItem(
            icon: Icon(Icons.upload_rounded),
            label: 'Upload',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.check_circle_outline),
            label: 'Checkup',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
  Widget _buildResultPage() {
    return const Center();
  }
  Widget _buildImageWidget() {
    return Column(mainAxisSize: MainAxisSize.min, children: [
      _image != null
          ? Image.file(
              _image!,
              height: 400,
              width: double.infinity,
            )
          : const Padding(
              padding: EdgeInsets.all(20),
              child: Center(
                child   : Text(
                  'No image selected',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
      const SizedBox(height: 20),
    ]);
  }
  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['png', 'jpg', 'jpeg'],
    );

    if (result != null) {
      setState(() {
        _image = File(result.files.single.path!);
      });
    }
  }

  Future<void> _onItemTapped(int index) async {
    if (index == 0) {
      await _pickFile();
    } else if (index == 1) {
      if (_image != null) {
        String? classValue = await ApiService.sendImage(_image!.path);
        setState(() {
          _classValue = classValue;
        });
        if (_classValue != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Class: $_classValue')),
          );
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => result(responseValue: _classValue!)));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Failed to get class')),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please upload an image first')),
        );
      }
    }
    setState(() {
      _selectedIndex = index;
    });
  }
}
