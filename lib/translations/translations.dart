import 'package:get/get.dart';

class Messages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en': {
      'email': 'Email',
      'text': 'Text',
      'phone': 'Phone',
      'terms': 'Accept Terms',
      'submit': 'Submit',
      'emailError': 'Please enter a valid email',
      'textError': 'This field cannot be empty',
      'phoneError': 'Phone number must be at least 9 digits',
    },
    'ar': {
      'email': 'البريد الإلكتروني',
      'text': 'النص',
      'phone': 'الهاتف',
      'terms': 'قبول الشروط',
      'submit': 'إرسال',
      'emailError': 'الرجاء إدخال بريد إلكتروني صحيح',
      'textError': 'هذا الحقل لا يمكن أن يكون فارغاً',
      'phoneError': 'رقم الهاتف يجب أن يكون 9 أرقام على الأقل',
    },
  };
} 