import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _displayText = ""; // Variable to store the entered text

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new),
          color: Colors.white60,
        ),
        title: Row(
          children: [
            Text(
              'Search...!',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const Spacer(),
            const Text(
              "😄",
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(width: 10),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Container(
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 0.6),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  _displayText.isEmpty
                      ? "Your text will appear here"
                      : _displayText,
                  style: const TextStyle(fontSize: 18, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          searchInput(),
        ],
      ),
    );
  }

  Widget searchInput() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.white, width: 0.6),
      ),
      child: Row(
        children: [
          const SizedBox(width: 10),
          Expanded(
            child: TextFormField(
              controller: _searchController,
              maxLines: 5,
              minLines: 1,
              decoration: const InputDecoration(
                hintText: 'Search...',
                hintStyle: TextStyle(color: Colors.white70),
                border: InputBorder.none,
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                _displayText = _searchController.text;
                _searchController.clear();
              });
            },
            icon: const Icon(
              Icons.arrow_circle_right_outlined,
              color: Colors.white70,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }
}
