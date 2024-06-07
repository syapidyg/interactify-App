import 'dart:io';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:interactify_app/Pages/home_page.dart';
import 'package:interactify_app/models/users.dart';
import 'package:interactify_app/models/publication.dart';
import 'package:interactify_app/services/publication_service.dart';
import 'package:interactify_app/widgets/nav_bar.dart';
import 'package:image_picker/image_picker.dart';

class PublicationPage extends StatefulWidget {
  static const routeName = "/publications";

  const PublicationPage({Key? key}) : super(key: key);

  @override
  _PublicationPageState createState() => _PublicationPageState();
}

class _PublicationPageState extends State<PublicationPage> {
  final PublicationService _publicationService = PublicationService();
  final TextEditingController _descriptionController = TextEditingController();
  File? _imageFile;
  bool _isPosting = false;
  Users? _currentUser;

  @override
  void initState() {
    super.initState();
    _getCurrentUser();
  }

  Future<void> _getCurrentUser() async {
    Users? currentUser = await _publicationService.getCurrentUser();
    setState(() {
      _currentUser = currentUser;
    });
  }

  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _imageFile = File(image!.path);
    });
  }

  Future<void> _postPublication() async {
    if (_descriptionController.text.isEmpty && _imageFile == null) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Description or image is required'),
      ));
      return;
    }

    setState(() {
      _isPosting = true;
    });

    try {
      User? currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser == null) {
        throw Exception('User not authenticated');
      }

      String? imageUrl;
      if (_imageFile != null) {
        imageUrl = await _publicationService.uploadImage(_imageFile!);
      }
      
      // Publication newPublication = Publication(
      //   id: '', // This will be set by Firestore
      //   utilisateur: _currentUser!,
      //   datePublication: DateTime.now().toString(),
      //   description: _descriptionController.text,
      //   image: imageUrl,
      //   likes: [],
      //   commentaires: [],
      // );

      // await _publicationService.addPost(newPublication);

      _descriptionController.clear();
      setState(() {
        _imageFile = null;
      });

      Navigator.pushReplacementNamed(context, HomePage.routeName);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Error posting publication: $e'),
      ));
    } finally {
      setState(() {
        _isPosting = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              onPressed: _isPosting ? null : _postPublication,
              child: _isPosting
                  ? const CircularProgressIndicator(color: Colors.white)
                  : const Text(
                      "Post",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 25.0,
                      backgroundImage: NetworkImage(
                        _currentUser?.photo ?? 'https://static.vecteezy.com/ti/vecteur-libre/t1/2318271-icone-de-profil-utilisateur-vectoriel.jpg',
                      ),
                    ),
                    const SizedBox(width: 16.0),
                    Text(
                      _currentUser?.username ?? 'User',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextField(
                    controller: _descriptionController,
                    maxLines: null,
                    decoration: const InputDecoration(
                      hintText: "# Ecris comme tu le penses!",
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              if (_imageFile != null)
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Image.file(
                    _imageFile!,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
            ],
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                width: 50.0,
                height: 50.0,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue,
                ),
                child: IconButton(
                  icon: const Icon(Icons.image, color: Colors.white),
                  onPressed: _pickImage,
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: NavBar(),
    );
  }
}
