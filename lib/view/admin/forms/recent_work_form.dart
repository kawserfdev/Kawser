import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kawser/app_theme.dart';
import 'package:kawser/models/recent_work.dart';
import 'package:kawser/providers/providers.dart';
import 'package:kawser/view/components/primary_button.dart';
import 'package:uuid/uuid.dart';

class RecentWorkForm extends ConsumerStatefulWidget {
  final RecentWork? recentWork;
  
  const RecentWorkForm({
    Key? key,
    this.recentWork,
  }) : super(key: key);

  @override
  ConsumerState<RecentWorkForm> createState() => _RecentWorkFormState();
}

class _RecentWorkFormState extends ConsumerState<RecentWorkForm> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _titleController;
  late final TextEditingController _descriptionController;
  late final TextEditingController _badgeTextController;
  late final TextEditingController _linkTextController;
  late final TextEditingController _linkUrlController;
  late final TextEditingController _imageUrlController;
  late Color _badgeColor;
  bool _isLoading = false;
  
  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.recentWork?.title ?? '');
    _descriptionController = TextEditingController(text: widget.recentWork?.description ?? '');
    _badgeTextController = TextEditingController(text: widget.recentWork?.badgeText ?? '');
    _linkTextController = TextEditingController(text: widget.recentWork?.linkText ?? 'View More');
    _linkUrlController = TextEditingController(text: widget.recentWork?.linkUrl ?? '');
    _imageUrlController = TextEditingController(text: widget.recentWork?.imageUrl ?? '');
    _badgeColor = widget.recentWork?.badgeColor ?? AppTheme.primaryColor;
  }
  
  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _badgeTextController.dispose();
    _linkTextController.dispose();
    _linkUrlController.dispose();
    _imageUrlController.dispose();
    super.dispose();
  }
  
  Future<void> _saveRecentWork() async {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() {
        _isLoading = true;
      });
      
      try {
        final firebaseService = ref.read(firebaseServiceProvider);
        final recentWork = RecentWork(
          id: widget.recentWork?.id ?? const Uuid().v4(),
          title: _titleController.text.trim(),
          description: _descriptionController.text.trim(),
          badgeText: _badgeTextController.text.trim(),
          badgeColor: _badgeColor,
          linkText: _linkTextController.text.trim(),
          linkUrl: _linkUrlController.text.trim(),
          imageUrl: _imageUrlController.text.trim(),
        );
        
        if (widget.recentWork != null) {
          await firebaseService.updateRecentWork(recentWork);
        } else {
          await firebaseService.addRecentWork(recentWork);
        }
        
        if (mounted) {
          Navigator.pop(context);
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: ${e.toString()}')),
        );
      } finally {
        if (mounted) {
          setState(() {
            _isLoading = false;
          });
        }
      }
    }
  }
  
  void _openColorPicker() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Pick a badge color'),
          content: SingleChildScrollView(
            child: ColorPicker(
              pickerColor: _badgeColor,
              onColorChanged: (color) {
                setState(() {
                  _badgeColor = color;
                });
              },
              pickerAreaHeightPercent: 0.8,
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.recentWork != null ? 'Edit Recent Work' : 'Add Recent Work'),
        backgroundColor: AppTheme.secondaryBackgroundColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTextFormField(
                  controller: _titleController,
                  label: 'Title',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a title';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                _buildTextFormField(
                  controller: _descriptionController,
                  label: 'Description',
                  maxLines: 3,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a description';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: _buildTextFormField(
                        controller: _badgeTextController,
                        label: 'Badge Text',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter badge text';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 8.0, bottom: 8.0),
                          child: Text('Badge Color'),
                        ),
                        InkWell(
                          onTap: _openColorPicker,
                          child: Container(
                            width: 100,
                            height: 50,
                            decoration: BoxDecoration(
                              color: _badgeColor,
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(color: Colors.grey),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                _buildTextFormField(
                  controller: _linkTextController,
                  label: 'Link Text',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter link text';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                _buildTextFormField(
                  controller: _linkUrlController,
                  label: 'Link URL',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a link URL';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                _buildTextFormField(
                  controller: _imageUrlController,
                  label: 'Image URL',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter an image URL';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 32),
                _isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : PrimaryButton(
                        text: widget.recentWork != null ? 'Update' : 'Save',
                        onPressed: _saveRecentWork,
                        fullWidth: true,
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  
  Widget _buildTextFormField({
    required TextEditingController controller,
    required String label,
    int maxLines = 1,
    String? Function(String?)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
          child: Text(label),
        ),
        TextFormField(
          controller: controller,
          maxLines: maxLines,
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color(0xFF2A2A2A),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
          ),
          validator: validator,
        ),
      ],
    );
  }
}