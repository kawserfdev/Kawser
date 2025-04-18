import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import '../../app_theme.dart';
import '../../models/skill.dart';
import '../../providers/providers.dart';
import '../../widgets/primary_button.dart';

class SkillForm extends ConsumerStatefulWidget {
  final SkillCategory? skillCategory;
  
  const SkillForm({
    Key? key,
    this.skillCategory,
  }) : super(key: key);

  @override
  ConsumerState<SkillForm> createState() => _SkillFormState();
}

class _SkillFormState extends ConsumerState<SkillForm> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _titleController;
  late final TextEditingController _orderController;
  final List<TextEditingController> _skillControllers = [];
  bool _isLoading = false;
  
  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.skillCategory?.title ?? '');
    _orderController = TextEditingController(
      text: (widget.skillCategory != null) ? '0' : '0',
    );
    
    if (widget.skillCategory != null) {
      for (final skill in widget.skillCategory!.skills) {
        _skillControllers.add(TextEditingController(text: skill));
      }
    }
    
    // Add at least one skill field if none exists
    if (_skillControllers.isEmpty) {
      _skillControllers.add(TextEditingController());
    }
  }
  
  @override
  void dispose() {
    _titleController.dispose();
    _orderController.dispose();
    for (final controller in _skillControllers) {
      controller.dispose();
    }
    super.dispose();
  }
  
  void _addSkillField() {
    setState(() {
      _skillControllers.add(TextEditingController());
    });
  }
  
  void _removeSkillField(int index) {
    if (_skillControllers.length > 1) {
      setState(() {
        _skillControllers[index].dispose();
        _skillControllers.removeAt(index);
      });
    }
  }
  
  Future<void> _saveSkill() async {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() {
        _isLoading = true;
      });
      
      try {
        final firebaseService = ref.read(firebaseServiceProvider);
        
        // Extract non-empty skills
        final skills = _skillControllers
            .map((controller) => controller.text.trim())
            .where((skill) => skill.isNotEmpty)
            .toList();
        
        final skillCategory = SkillCategory(
          id: widget.skillCategory?.id ?? const Uuid().v4(),
          title: _titleController.text.trim(),
          skills: skills,
        );
        
        if (widget.skillCategory != null) {
          await firebaseService.updateSkill(skillCategory);
        } else {
          await firebaseService.addSkill(skillCategory);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.skillCategory != null ? 'Edit Skill Category' : 'Add Skill Category'),
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
                  label: 'Category Title',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a category title';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),
                const Text(
                  'Skills',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                ...List.generate(_skillControllers.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _skillControllers[index],
                            decoration: InputDecoration(
                              hintText: 'Enter skill',
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
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.remove_circle_outline),
                          color: Colors.red,
                          onPressed: () => _removeSkillField(index),
                        ),
                      ],
                    ),
                  );
                }),
                TextButton.icon(
                  onPressed: _addSkillField,
                  icon: const Icon(Icons.add_circle_outline),
                  label: const Text('Add Skill'),
                ),
                const SizedBox(height: 32),
                _isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : PrimaryButton(
                        text: widget.skillCategory != null ? 'Update' : 'Save',
                        onPressed: _saveSkill,
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
