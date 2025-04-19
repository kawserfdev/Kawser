import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kawser/app_theme.dart';
import 'package:kawser/models/testimonial.dart';
import 'package:kawser/providers/providers.dart';
import 'package:kawser/view/components/primary_button.dart';
import 'package:uuid/uuid.dart';

class TestimonialForm extends ConsumerStatefulWidget {
  final Testimonial? testimonial;
  
  const TestimonialForm({
    Key? key,
    this.testimonial,
  }) : super(key: key);

  @override
  ConsumerState<TestimonialForm> createState() => _TestimonialFormState();
}

class _TestimonialFormState extends ConsumerState<TestimonialForm> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameController;
  late final TextEditingController _positionController;
  late final TextEditingController _testimonialController;
  late final TextEditingController _imageUrlController;
  bool _isLoading = false;
  
  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.testimonial?.name ?? '');
    _positionController = TextEditingController(text: widget.testimonial?.position ?? '');
    _testimonialController = TextEditingController(text: widget.testimonial?.testimonial ?? '');
    _imageUrlController = TextEditingController(text: widget.testimonial?.imageUrl ?? '');
  }
  
  @override
  void dispose() {
    _nameController.dispose();
    _positionController.dispose();
    _testimonialController.dispose();
    _imageUrlController.dispose();
    super.dispose();
  }
  
  Future<void> _saveTestimonial() async {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() {
        _isLoading = true;
      });
      
      try {
        final firebaseService = ref.read(firebaseServiceProvider);
        final testimonial = Testimonial(
          id: widget.testimonial?.id ?? const Uuid().v4(),
          name: _nameController.text.trim(),
          position: _positionController.text.trim(),
          testimonial: _testimonialController.text.trim(),
          imageUrl: _imageUrlController.text.trim().isEmpty 
              ? null 
              : _imageUrlController.text.trim(),
        );
        
        if (widget.testimonial != null) {
          await firebaseService.updateTestimonial(testimonial);
        } else {
          await firebaseService.addTestimonial(testimonial);
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
        title: Text(widget.testimonial != null ? 'Edit Testimonial' : 'Add Testimonial'),
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
                  controller: _nameController,
                  label: 'Name',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                _buildTextFormField(
                  controller: _positionController,
                  label: 'Position',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a position';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                _buildTextFormField(
                  controller: _testimonialController,
                  label: 'Testimonial',
                  maxLines: 5,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a testimonial';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                _buildTextFormField(
                  controller: _imageUrlController,
                  label: 'Image URL (Optional)',
                ),
                const SizedBox(height: 32),
                _isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : PrimaryButton(
                        text: widget.testimonial != null ? 'Update' : 'Save',
                        onPressed: _saveTestimonial,
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
