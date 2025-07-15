import 'dart:ui';

import 'package:get/get_navigation/get_navigation.dart';

class AppLocaleKeys {
  static const String listaApp = 'listaApp';
  static const String yourBestChoiceForShopping = 'yourBestChoiceForShopping';
  static const String goNow = 'goNow';
  static const String next = 'next';
  static const String done = 'done';
  static const String save = 'save';
  static const String yes = 'yes';
  static const String no = 'no';
  static const String add = 'add';
  static const String cancel= 'cancel';
  static const String delete = 'delete';
  static const String share = 'share';
  static const String reset = 'reset';
  static const String back = 'back';
  static const String skip = 'skip';
  static const String homePage = 'homePage';
  static const String createYourListEasily = 'createYourListEasily';
  static const String youCanCreateALotOfLists = 'youCanCreateALotOfLists';
  static const String selectTimeAndDate = 'selectTimeAndDate';
  static const String fromNowYouDontForgetAnything =
      'fromNowYouDontForgetAnything';
  static const String moneyReportsWeakly = 'moneyReportsWeakly';
  static const String stayUpToDateAboutYourMoney = 'stayUpToDateAboutYourMoney';
  static const String welcome = 'welcome';
  static const String lists = 'lists';
  static const String allPriority = 'allPriority';
  static const String highPriority = 'highPriority';
  static const String midPriority = 'midPriority';
  static const String lowPriority = 'lowPriority';
  static const String addNewList = 'addNewList';
  static const String remainders = 'remainders';
  static const String moneyReports = 'moneyReports';
  static const String holyDaysAndEvents = 'holyDaysAndEvents';
  static const String fruitsAndVegetable = 'fruitsAndVegetable';
  static const String marketAndOthers = 'marketAndOthers';
  static const String settings = 'settings';
  static const String trashBasket = 'trashBasket';
  static const String categories = 'categories';
  static const String newCategory = 'newCategory';
  static const String totalAmount = 'totalAmount';
  static const String listTitle = 'listTitle';
  static const String date = 'date';
  static const String more = 'more';
  static const String completedLists = 'completedLists';
  static const String editList = 'editList';
  static const String deleteListQuestion = 'deleteListQuestion';
  static const String selectTime = 'selectTime';
  static const String title = 'title';
  static const String success = 'success';
  static const String listUpdatedSuccessfully = 'listUpdatedSuccessfully';
  static const String qrByImages = 'qrByImages';
  static const String qrByCamera = 'qrByCamera';
  static const String name = 'name';
  static const String price = 'price';
  static const String aboutUs = 'aboutUs';
  static const  String contactUs = "contactUs";
  static const String privacyPolicy = "privacyPolicy";
  static const String recpiesAndTemplates = "recpiesAndTemplates";
  static const String saveAsTemplate = "saveAsTemplate";


  // validations

  static const String requiredField = 'requiredField';
  static const String mustBeNumber = 'mustBeNumber';
  static const String mustBeString = 'mustBeString';
  static const String mustBeDate = 'mustBeDate';
  static const String mustBeDateTime = 'mustBeDateTime';
  static const String mustBeBool = 'mustBeBool';
  static const String mustBeInt = 'mustBeInt';
  static const String mustBeDouble = 'mustBeDouble';
  static const String titleRequired = 'titleRequired';
  static const String listShouldHaveAtLeastOneItem = 'listShouldHaveAtLeastOneItem';
  static const String warning = 'warning';
  static const String deleteAllListsTahtBelongToThisCategoryBeforeDeletingIt = 'deleteAllListsTahtBelongToThisCategoryBeforeDeletingIt';



  //default data


  static const String public = 'public';
  static const String noListsYet = 'noListsYet';




  // confirmations
  static const String deleteListConfirmation = 'deleteListConfirmation';
  static const String deleteCategoryConfirmation = 'deleteCategoryConfirmation';


  // report types

  static const String today = 'today';
  static const String currentWeek = 'currentWeek';
  static const String currentMonth = 'currentMonth';
  static const String lastMonth = 'lastMonth';
  static const String currentYear = 'currentYear';
  static const String all = 'all';
}

class AppLocale extends Translations {


  @override
  Map<String, Map<String, String>> get keys => {
    'ar': {
      AppLocaleKeys.listaApp: '“Listaa”',
      AppLocaleKeys.yourBestChoiceForShopping:
          'اختيارك الأمثل لأنشاء قوائمك بسهولة لن تنسى أي شيء بعد الان',
      AppLocaleKeys.goNow: 'انطلق الان',
      AppLocaleKeys.next: 'التالي',
      AppLocaleKeys.skip: 'تخطي',
      AppLocaleKeys.homePage: 'الصفحة الرئيسية',
      AppLocaleKeys.back: 'رجوع',
      AppLocaleKeys.createYourListEasily: 'أنشئ قوائمك بسهولة',
      AppLocaleKeys.youCanCreateALotOfLists:
          'يمكنك إنشاء العديد من القوائم وتنظيمها حسب نوع التسوق',
      AppLocaleKeys.selectTimeAndDate: 'حدد تذكيرات لمناسباتك',
      AppLocaleKeys.fromNowYouDontForgetAnything:
          'لن تنسى أي شيء بعد الأن مع تنبيهات التقويم الذكي',
      AppLocaleKeys.moneyReportsWeakly: 'تقارير مالية ذكية أسبوعيًا',
      AppLocaleKeys.stayUpToDateAboutYourMoney:
          'ابقَ على اطلاع بمصاريفك الشهرية والسنوية عبر تقارير دورية',
      AppLocaleKeys.welcome: 'اهلا بك !! 👋',
      AppLocaleKeys.lists: 'قوائم',
      AppLocaleKeys.allPriority: 'الكل',
      AppLocaleKeys.highPriority: 'عاجل',
      AppLocaleKeys.midPriority: 'متوسط',
      AppLocaleKeys.lowPriority: 'عادي',
      AppLocaleKeys.addNewList: 'انشاء قائمة جديدة',
      AppLocaleKeys.remainders: 'تنبيهات',
      AppLocaleKeys.moneyReports: 'تقارير مالية',
      AppLocaleKeys.holyDaysAndEvents: 'اعياد ومناسبات',
      AppLocaleKeys.fruitsAndVegetable: 'الفواكه والخضروات',
      AppLocaleKeys.marketAndOthers: 'بقالة و مشتريات',
      AppLocaleKeys.settings: 'الاعدادات',
      AppLocaleKeys.trashBasket: 'سلة المهملات',
      AppLocaleKeys.categories: 'تصنيفات',
      AppLocaleKeys.newCategory: 'تصنيف جديد',
      AppLocaleKeys.totalAmount: 'الاجمالي',
      AppLocaleKeys.requiredField: 'هذا الحقل مطلوب',
      AppLocaleKeys.mustBeNumber: 'يجب ان يكون رقم',
      AppLocaleKeys.mustBeString: 'يجب ان يكون نص',
      AppLocaleKeys.mustBeDate: 'يجب ان يكون تاريخ',
      AppLocaleKeys.mustBeDateTime: 'يجب ان يكون تاريخ ووقت',
      AppLocaleKeys.mustBeInt: 'يجب ان يكون رقم صحيح',
      AppLocaleKeys.mustBeDouble: 'يجب ان يكون رقم عشري',
      AppLocaleKeys.listTitle: 'عنوان القائمة',
      AppLocaleKeys.titleRequired: 'يرجى ادخال العنوان',


      AppLocaleKeys.done: 'تم',
      AppLocaleKeys.save: 'حفظ',
      AppLocaleKeys.reset: 'اعادة تعيين',
      AppLocaleKeys.add: 'اضافة',

      AppLocaleKeys.date: 'التاريخ',
      AppLocaleKeys.more: 'المزيد',
      AppLocaleKeys.completedLists: 'مكتملة',
      AppLocaleKeys.editList: 'تعديل القائمة',

      AppLocaleKeys.share: 'مشاركة',
      AppLocaleKeys.delete: 'حذف',
      AppLocaleKeys.deleteListQuestion: 'هل انت متاكد من حذف القائمة؟',
      AppLocaleKeys.yes: 'نعم',
      AppLocaleKeys.no: 'لا',
      AppLocaleKeys.cancel: 'الغاء',

      
      AppLocaleKeys.public: 'عام',
      AppLocaleKeys.selectTime: 'اختر الوقت',



      AppLocaleKeys.deleteListConfirmation: 'هل تريد حذف هذه القائمة نهائيا؟',
      AppLocaleKeys.listShouldHaveAtLeastOneItem: 'يجب أن تحتوي القائمة على عنصر واحد على الأقل',
      AppLocaleKeys.warning: 'تحذير ⚠️',
      AppLocaleKeys.noListsYet: 'لا توجد قوائم حتى الآن',

      AppLocaleKeys.title: 'العنوان',

      AppLocaleKeys.deleteCategoryConfirmation: 'هل تريد حذف هذا التصنيف نهائيا؟',

      AppLocaleKeys.success: 'تمت العملية بنجاح ✅',
      AppLocaleKeys.listUpdatedSuccessfully: 'تم تحديث القائمة',

      AppLocaleKeys.today: 'اليوم',
      AppLocaleKeys.currentWeek: 'الاسبوع الحالي',
      AppLocaleKeys.currentMonth: 'الشهر الحالي',
      AppLocaleKeys.lastMonth: 'الشهر الماضي',
      AppLocaleKeys.currentYear: 'السنة الحالية',
      AppLocaleKeys.all: 'الكل',

      AppLocaleKeys.qrByImages:"مسح الكود عن طريق الصورة",
      AppLocaleKeys.qrByCamera:"مسح الكود عن طريق الكاميرا",


      AppLocaleKeys.name:"الاسم",
      AppLocaleKeys.price:"السعر",

      AppLocaleKeys.aboutUs:"من نحن",
      AppLocaleKeys.contactUs:"تواصل معنا",
      AppLocaleKeys.privacyPolicy:"سياسة الخصوصية",

      AppLocaleKeys.recpiesAndTemplates:"الوصفات والقوالب",
      AppLocaleKeys.saveAsTemplate:"حفظ كقالب",

      AppLocaleKeys.deleteAllListsTahtBelongToThisCategoryBeforeDeletingIt:"يجب حذف جميع القوائم التي تنتمي لهذا التصنيف قبل حذفه",




    },
    'en': {
      AppLocaleKeys.listaApp: '“Listaa”',
      AppLocaleKeys.yourBestChoiceForShopping: 'Your best choice for shopping',
      AppLocaleKeys.goNow: 'Go Now',
      AppLocaleKeys.next: 'Next',
      AppLocaleKeys.skip: 'Skip',
      AppLocaleKeys.homePage: 'Home Page',
      AppLocaleKeys.back: 'Back',
      AppLocaleKeys.createYourListEasily: 'Create Your List Easily',
      AppLocaleKeys.youCanCreateALotOfLists:
          'You can create a lot of lists and organize them according to the type of shopping',
      AppLocaleKeys.selectTimeAndDate: 'Set reminders for your events',
      AppLocaleKeys.fromNowYouDontForgetAnything:
          'You will not forget anything from now on with smart reminders',
      AppLocaleKeys.moneyReportsWeakly: 'Smart Weekly Money Reports',
      AppLocaleKeys.stayUpToDateAboutYourMoney:
          'Stay up to date about your monthly and yearly expenses with recurring reports',
      AppLocaleKeys.welcome: 'Welcome !! 👋',
      AppLocaleKeys.lists: 'Lists',
      AppLocaleKeys.allPriority: 'All',
      AppLocaleKeys.highPriority: 'High',
      AppLocaleKeys.midPriority: 'Medium',
      AppLocaleKeys.lowPriority: 'Low',
      AppLocaleKeys.addNewList: 'Add New List',
      AppLocaleKeys.remainders: 'Remainders',
      AppLocaleKeys.moneyReports: 'Money Reports',
      AppLocaleKeys.holyDaysAndEvents: 'Holy Days & Events',
      AppLocaleKeys.fruitsAndVegetable: 'Fruts & Vigitable',
      AppLocaleKeys.marketAndOthers: 'Markets & Others',
      AppLocaleKeys.settings: 'Settings',
      AppLocaleKeys.trashBasket: 'Trash Basket',
      AppLocaleKeys.categories: 'Categories',
      AppLocaleKeys.newCategory: 'New Category',
      AppLocaleKeys.totalAmount: 'Total',
      AppLocaleKeys.requiredField: 'Required field',
      AppLocaleKeys.mustBeNumber: 'Must be number',
      AppLocaleKeys.mustBeString: 'Must be a text',
      AppLocaleKeys.mustBeDate: 'Must be a date',
      AppLocaleKeys.mustBeDateTime: 'Must be date time',
      AppLocaleKeys.mustBeInt: 'Must be int',
      AppLocaleKeys.mustBeDouble: 'Must be double',
      AppLocaleKeys.listTitle: 'List Title',

      AppLocaleKeys.done: 'Done',
      AppLocaleKeys.save: 'Save',
      AppLocaleKeys.reset: 'Reset',
      AppLocaleKeys.date: 'Date',
      AppLocaleKeys.more: 'More',

      AppLocaleKeys.completedLists: 'Completed',
      AppLocaleKeys.editList: 'Edit List',
      AppLocaleKeys.share: 'Share',
      AppLocaleKeys.delete: 'Delete',
      AppLocaleKeys.deleteListQuestion:
          'Are you sure you want to delete this list ?',
      AppLocaleKeys.yes: 'Yes',
      AppLocaleKeys.no: 'No',
      AppLocaleKeys.add: 'Add',

     
      AppLocaleKeys.public: 'Public',
      AppLocaleKeys.selectTime: 'Select time',

      AppLocaleKeys.deleteListConfirmation: 'Do you want to delete this list permanently?',
      AppLocaleKeys.listShouldHaveAtLeastOneItem: 'List should have at least one item',
      AppLocaleKeys.warning: 'Warning ⚠️',
      AppLocaleKeys.noListsYet: 'No lists yet',
      AppLocaleKeys.titleRequired: 'Please enter a title',
      AppLocaleKeys.title: 'Title',
      AppLocaleKeys.cancel: 'Cancel',
      AppLocaleKeys.deleteCategoryConfirmation: 'Are you sure you want to delete this category permanently?',

      AppLocaleKeys.success: 'Operation completed successfully ✅',
      AppLocaleKeys.listUpdatedSuccessfully: 'List updated successfully',

      
     
      AppLocaleKeys.today: 'Today',
      AppLocaleKeys.currentWeek: 'Current Week',
      AppLocaleKeys.currentMonth: 'Current Month',
      AppLocaleKeys.lastMonth: 'Last Month',
      AppLocaleKeys.currentYear: 'Current Year',
      AppLocaleKeys.all: 'All',

      AppLocaleKeys.qrByImages:"Scan the code via image",
      AppLocaleKeys.qrByCamera:"Scan the code via camera",

      AppLocaleKeys.name:"Name",
      AppLocaleKeys.price:"Price",
      AppLocaleKeys.aboutUs:"About Us",
      AppLocaleKeys.contactUs:"Contact Us",
      AppLocaleKeys.privacyPolicy:"Privacy Policy",
      AppLocaleKeys.recpiesAndTemplates:"Recpies & Templates",
      AppLocaleKeys.saveAsTemplate:"Save as template",

      AppLocaleKeys.deleteAllListsTahtBelongToThisCategoryBeforeDeletingIt:"You must delete all lists that belong to this category before deleting it",


    },
  };
}
