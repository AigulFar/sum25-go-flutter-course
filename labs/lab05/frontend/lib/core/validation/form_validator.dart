// Simple form validation with basic security checks

class FormValidator {
  static String? validateEmail(String? email) {
    if (email == null || email.trim().isEmpty) {
      return 'Email is required';
    }
    final trimmed = email.trim();
    if (trimmed.length > 100) {
      return 'Email is too long';
    }
    if (!trimmed.contains('@') || !trimmed.contains('.')) {
      return 'Email is invalid';
    }
    // Basic: must have at least one char before and after @, and a dot after @
    final atIdx = trimmed.indexOf('@');
    final dotIdx = trimmed.lastIndexOf('.');
    if (atIdx <= 0 || dotIdx < atIdx + 2 || dotIdx == trimmed.length - 1) {
      return 'Email is invalid';
    }
    return null;
  }

  static String? validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return 'Password is required';
    }
    if (password.length < 6) {
      return 'Password must be at least 6 characters';
    }
    final hasLetter = password.contains(RegExp(r'[A-Za-z]'));
    final hasNumber = password.contains(RegExp(r'[0-9]'));
    if (!hasLetter || !hasNumber) {
      return 'Password must contain a letter and number';
    }
    return null;
  }

  static String sanitizeText(String? text) {
    if (text == null || text.isEmpty) return '';
    return text.replaceAll('<', '').replaceAll('>', '').trim();
  }

  static bool isValidLength(String? text, {int minLength = 1, int maxLength = 100}) {
    if (text == null) return false;
    return text.length >= minLength && text.length <= maxLength;
  }
}
