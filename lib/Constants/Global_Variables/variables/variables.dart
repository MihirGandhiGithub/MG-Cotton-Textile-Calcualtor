class UserFirebaseData {
  // static String firebaseName = '';
  // static String firebasEmail = '';
  // static String firebaseNumber = '';
}

//
class ValidationScripts {
  static final RegExp emailValidation = RegExp(
      r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,})$');
  static final RegExp passwordValidation = RegExp(
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*])[a-zA-Z\d!@#$%^&*]{8,}$');

  static final RegExp contactNumber = RegExp(r'^\d{10}$');
}

class ItemList {
  static List<Map<String, dynamic>> itemList = [
    {
      'Name': 'Ginning Calculator',
      'imageUrl': 'assets/ginning_logo.png',
      'navigatePage': 'ginning_screen',
      'iconSize': '70'
    },
    {
      'Name': 'Dabit Note Calculator',
      'imageUrl': 'assets/dabitnote.png',
      'navigatePage': 'dabitnote_screen',
      'iconSize': '70'
    },
    {
      'Name': 'Exports Calculation',
      'imageUrl': 'assets/export_logo.png',
      'navigatePage': 'export_screen',
      'iconSize': '70'
    },
    {
      'Name': 'Oil Mill Calculator',
      'imageUrl': 'assets/oilmill_logo.png',
      'navigatePage': 'oilmill_screen',
      'iconSize': '50'
    },
    {
      'Name': 'Spinning Calculator',
      'imageUrl': 'assets/spinning_logo.png',
      'navigatePage': 'spinning_screen',
      'iconSize': '70'
    },
    {
      'Name': 'Conversation',
      'imageUrl': 'assets/conversation_logo.png',
      'navigatePage': 'conversation_screen',
      'iconSize': '70'
    },
    {
      'Name': 'Staple Conversation',
      'imageUrl': 'assets/staple_logo.png',
      'navigatePage': 'stapleconvert_screen',
      'iconSize': '70'
    },
    {
      'Name': 'Coversation Factor',
      'imageUrl': 'assets/cottonfactor.png',
      'navigatePage': 'cottonfactor_screen',
      'iconSize': '70'
    },
    {
      'Name': 'Cotton Quality',
      'imageUrl': 'assets/cotton_quality.png',
      'navigatePage': 'cottonqulity_screen',
      'iconSize': '70'
    }
  ];
}
