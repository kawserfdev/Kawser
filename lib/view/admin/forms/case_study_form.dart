import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kawser/app_theme.dart';
import 'package:kawser/models/case_study.dart';
import 'package:kawser/providers/providers.dart';
import 'package:kawser/view/components/primary_button.dart';
import 'package:uuid/uuid.dart';

class CaseStudyForm extends ConsumerStatefulWidget {
  final CaseStudy? caseStudy;

  const CaseStudyForm({Key? key, this.caseStudy}) : super(key: key);

  @override
  ConsumerState<CaseStudyForm> createState() => _CaseStudyFormState();
}

class _CaseStudyFormState extends ConsumerState<CaseStudyForm> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _titleController;
  late final TextEditingController _descriptionController;
  late final TextEditingController _badgeTextController;
  late final TextEditingController _linkTextController;
  late final TextEditingController _linkUrlController;
  late Color _badgeColor;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(
      text: widget.caseStudy?.title ?? '',
    );
    _descriptionController = TextEditingController(
      text: widget.caseStudy?.description ?? '',
    );
    _badgeTextController = TextEditingController(
      text: widget.caseStudy?.badgeText ?? '',
    );
    _linkTextController = TextEditingController(
      text: widget.caseStudy?.linkText ?? 'View Case Study',
    );
    _linkUrlController = TextEditingController(
      text: widget.caseStudy?.linkUrl ?? '',
    );
    _badgeColor = widget.caseStudy?.badgeColor ?? AppTheme.primaryColor;
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _badgeTextController.dispose();
    _linkTextController.dispose();
    _linkUrlController.dispose();
    super.dispose();
  }

  Future<void> _saveCaseStudy() async {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() {
        _isLoading = true;
      });

      try {
        final firebaseService = ref.read(firebaseServiceProvider);
        final caseStudy = CaseStudy(
          id: widget.caseStudy?.id ?? const Uuid().v4(),
          title: _titleController.text.trim(),
          description: _descriptionController.text.trim(),
          badgeText: _badgeTextController.text.trim(),
          badgeColor: _badgeColor,
          linkText: _linkTextController.text.trim(),
          linkUrl: _linkUrlController.text.trim(),
        );

        if (widget.caseStudy != null) {
          await firebaseService.updateCaseStudy(caseStudy);
        } else {
          await firebaseService.addCaseStudy(caseStudy);
        }

        if (mounted) {
          Navigator.pop(context);
        }
      } catch (e) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Error: ${e.toString()}')));
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
        title: Text(
          widget.caseStudy != null ? 'Edit Case Study' : 'Add Case Study',
        ),
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
                const SizedBox(height: 32),
                _isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : PrimaryButton(
                      text: widget.caseStudy != null ? 'Update' : 'Save',
                      onPressed: _saveCaseStudy,
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
