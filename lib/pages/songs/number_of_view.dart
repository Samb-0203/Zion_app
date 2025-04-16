import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'songs_view.dart';

class SongsScreen extends StatefulWidget {
  const SongsScreen({super.key});

  @override
  State<SongsScreen> createState() => _SongsScreenState();
}

class _SongsScreenState extends State<SongsScreen> {
  final List<String> _languages = ['Telugu', 'English'];
  int _selectedIndex = 0;
  final ScrollController _scrollController = ScrollController();
  bool _isToggleVisible = true; // Track toggle button visibility

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.userScrollDirection ==
        ScrollDirection.reverse) {
      if (_isToggleVisible) {
        setState(() {
          _isToggleVisible = false; // Hide when scrolling down
        });
      }
    } else if (_scrollController.position.userScrollDirection ==
        ScrollDirection.forward) {
      if (!_isToggleVisible) {
        setState(() {
          _isToggleVisible = true; // Show when scrolling up
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          // Toggle button with visibility control
          Visibility(
            visible: _isToggleVisible,
            maintainState: true, // Keeps the state of toggle buttons
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 16.0, left: 16, right: 16, bottom: 8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF1C1C1C),
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: List.generate(_languages.length, (index) {
                    final bool isSelected = _selectedIndex == index;
                    return Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedIndex = index;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color:
                                  isSelected ? Colors.grey : Colors.transparent,
                              borderRadius: BorderRadius.horizontal(
                                left: index == 0
                                    ? const Radius.circular(10)
                                    : Radius.zero,
                                right: index == _languages.length - 1
                                    ? const Radius.circular(10)
                                    : Radius.zero,
                              ),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            child: Center(
                              child: Text(
                                _languages[index],
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: isSelected
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                  color: isSelected
                                      ? Colors.white
                                      : Colors.white70,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
          ),
          // Song list with scroll control and navigation
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: NotificationListener<ScrollNotification>(
                onNotification: (notification) {
                  return true; // Allow propagation
                },
                child: ListView.builder(
                  controller: _scrollController, // Attach scroll controller
                  itemCount: 30,
                  itemBuilder: (context, index) {
                    String title = _selectedIndex == 0
                        ? 'Telugu Song ${index + 1}'
                        : 'English Song ${index + 1}';
                    String subtitle = _selectedIndex == 0
                        ? 'Telugu Artist ${index + 1}'
                        : 'English Artist ${index + 1}';
                    return ListTile(
                      title: Text(
                        title,
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(color: Colors.white),
                      ),
                      subtitle: Text(
                        subtitle,
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(color: Colors.white70),
                      ),
                      trailing: const Icon(
                        Icons.arrow_right_rounded,
                        size: 35,
                        color: Colors.white,
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SongDetailScreen(
                              title: title,
                              subtitle: subtitle,
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
