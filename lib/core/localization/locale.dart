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
  static const String theresNoRemindersYet = 'theresNoRemindersYet';
  static const String theresNoTrashYet = 'theresNoTrashYet';



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


  //templates

  static const String adha = 'adha';
  static const String cake = 'cake';
  static const String chicken = 'chicken';
  static const String market = 'market';
  static const String school = 'school';
  static const String trip = 'trip';

  // templates items
   // Adha
  static const adha_sheep = 'adha_sheep';
  static const adha_knife = 'adha_knife';
  static const adha_charcoal = 'adha_charcoal';
  static const adha_salt = 'adha_salt';
  static const adha_spices = 'adha_spices';
  static const adha_bags = 'adha_bags';
  static const adha_gloves = 'adha_gloves';
  static const adha_tray = 'adha_tray';
  static const adha_cleaning_supplies = 'adha_cleaning_supplies';
  static const adha_freezer_bags = 'adha_freezer_bags';

  // Cake
  static const cake_flour = 'cake_flour';
  static const cake_sugar = 'cake_sugar';
  static const cake_eggs = 'cake_eggs';
  static const cake_cocoa = 'cake_cocoa';
  static const cake_butter = 'cake_butter';
  static const cake_baking_powder = 'cake_baking_powder';
  static const cake_vanilla = 'cake_vanilla';

  // Trip
  static const trip_tent = 'trip_tent';
  static const trip_sleeping_bag = 'trip_sleeping_bag';
  static const trip_firewood = 'trip_firewood';
  static const trip_lantern = 'trip_lantern';
  static const trip_water = 'trip_water';
  static const trip_snacks = 'trip_snacks';
  static const trip_first_aid = 'trip_first_aid';

  // Chicken
  static const chicken_whole = 'chicken_whole';
  static const chicken_garlic = 'chicken_garlic';
  static const chicken_lemon = 'chicken_lemon';
  static const chicken_pepper = 'chicken_pepper';
  static const chicken_yogurt = 'chicken_yogurt';
  static const chicken_rice = 'chicken_rice';

  // Market
  static const market_bread = 'market_bread';
  static const market_milk = 'market_milk';
  static const market_eggs = 'market_eggs';
  static const market_cheese = 'market_cheese';
  static const market_vegetables = 'market_vegetables';
  static const market_fruits = 'market_fruits';
  static const market_oil = 'market_oil';

  // School
  static const school_backpack = 'school_backpack';
  static const school_notebooks = 'school_notebooks';
  static const school_pens = 'school_pens';
  static const school_uniform = 'school_uniform';
  static const school_shoes = 'school_shoes';
  static const school_lunchbox = 'school_lunchbox';
  static const school_water_bottle = 'school_water_bottle';
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

      AppLocaleKeys.adha:"عيد الاضحى",
      AppLocaleKeys.cake:"كيكة بالشكولاة",
      AppLocaleKeys.chicken:"وصفة الدجاج الشهية",
      AppLocaleKeys.market:"تسوق للمنزل",
      AppLocaleKeys.school:"تجهيزات المدرسة",
      AppLocaleKeys.trip:"التخييم مع الاصدقاء",

      AppLocaleKeys.theresNoRemindersYet: "لا يوجد تذكيرات بعد..",
      AppLocaleKeys.theresNoTrashYet: "لا يوجد محذوفات بعد",


      // templates items

      
      
  // Adha
  AppLocaleKeys.adha_sheep: "🐑 خروف العيد",
  AppLocaleKeys.adha_knife: "🔪 سكين الذبح",
  AppLocaleKeys.adha_charcoal: "🔥 فحم",
  AppLocaleKeys.adha_salt: "🧂 ملح",
  AppLocaleKeys.adha_spices: "🌶️ بهارات",
  AppLocaleKeys.adha_bags: "🛍️ أكياس توزيع",
  AppLocaleKeys.adha_gloves: "🧤 قفازات",
  AppLocaleKeys.adha_tray: "🍽️ صينية",
  AppLocaleKeys.adha_cleaning_supplies: "🧼 مواد تنظيف",
  AppLocaleKeys.adha_freezer_bags: "🥶 أكياس تجميد",

  // Cake
  AppLocaleKeys.cake_flour: "🌾 طحين",
  AppLocaleKeys.cake_sugar: "🍬 سكر",
  AppLocaleKeys.cake_eggs: "🥚 بيض",
  AppLocaleKeys.cake_cocoa: "🍫 كاكاو",
  AppLocaleKeys.cake_butter: "🧈 زبدة",
  AppLocaleKeys.cake_baking_powder: "🧪 بيكنج باودر",
  AppLocaleKeys.cake_vanilla: "🌼 فانيليا",

  // Trip
  AppLocaleKeys.trip_tent: "⛺ خيمة",
  AppLocaleKeys.trip_sleeping_bag: "🛌 كيس نوم",
  AppLocaleKeys.trip_firewood: "🪵 حطب",
  AppLocaleKeys.trip_lantern: "🏮 فانوس",
  AppLocaleKeys.trip_water: "💧 ماء",
  AppLocaleKeys.trip_snacks: "🍪 وجبات خفيفة",
  AppLocaleKeys.trip_first_aid: "🩹 إسعافات أولية",

  // Chicken
  AppLocaleKeys.chicken_whole: "🍗 دجاجة كاملة",
  AppLocaleKeys.chicken_garlic: "🧄 ثوم",
  AppLocaleKeys.chicken_lemon: "🍋 ليمون",
  AppLocaleKeys.chicken_pepper: "🫑 فلفل",
  AppLocaleKeys.chicken_yogurt: "🥛 لبن",
  AppLocaleKeys.chicken_rice: "🍚 رز",

  // Market
  AppLocaleKeys.market_bread: "🍞 خبز",
  AppLocaleKeys.market_milk: "🥛 حليب",
  AppLocaleKeys.market_eggs: "🥚 بيض",
  AppLocaleKeys.market_cheese: "🧀 جبن",
  AppLocaleKeys.market_vegetables: "🥦 خضروات",
  AppLocaleKeys.market_fruits: "🍎 فواكه",
  AppLocaleKeys.market_oil: "🛢️ زيت",

  // School
  AppLocaleKeys.school_backpack: "🎒 حقيبة مدرسية",
  AppLocaleKeys.school_notebooks: "📓 دفاتر",
  AppLocaleKeys.school_pens: "🖊️ أقلام",
  AppLocaleKeys.school_uniform: "👕 زي مدرسي",
  AppLocaleKeys.school_shoes: "👟 حذاء",
  AppLocaleKeys.school_lunchbox: "🥪 صندوق طعام",
  AppLocaleKeys.school_water_bottle: "🚰 قارورة ماء",



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

      AppLocaleKeys.adha:"Adha feast",
      AppLocaleKeys.cake:"Chocolate cake",
      AppLocaleKeys.chicken:"Dinner with chicken",
      AppLocaleKeys.market:"Home needs",
      AppLocaleKeys.school:"Prepare for school",
      AppLocaleKeys.trip:"Trip with friends",

      AppLocaleKeys.theresNoRemindersYet:"There's no reminders yet...",
      AppLocaleKeys.theresNoTrashYet:"There's no trash yet...",

      // Adha
  AppLocaleKeys.adha_sheep: "🐑 Eid sheep",
  AppLocaleKeys.adha_knife: "🔪 Slaughter knife",
  AppLocaleKeys.adha_charcoal: "🔥 Charcoal",
  AppLocaleKeys.adha_salt: "🧂 Salt",
  AppLocaleKeys.adha_spices: "🌶️ Spices",
  AppLocaleKeys.adha_bags: "🛍️ Distribution bags",
  AppLocaleKeys.adha_gloves: "🧤 Gloves",
  AppLocaleKeys.adha_tray: "🍽️ Tray",
  AppLocaleKeys.adha_cleaning_supplies: "🧼 Cleaning supplies",
  AppLocaleKeys.adha_freezer_bags: "🥶 Freezer bags",

  // Cake
  AppLocaleKeys.cake_flour: "🌾 Flour",
  AppLocaleKeys.cake_sugar: "🍬 Sugar",
  AppLocaleKeys.cake_eggs: "🥚 Eggs",
  AppLocaleKeys.cake_cocoa: "🍫 Cocoa",
  AppLocaleKeys.cake_butter: "🧈 Butter",
  AppLocaleKeys.cake_baking_powder: "🧪 Baking powder",
  AppLocaleKeys.cake_vanilla: "🌼 Vanilla",

  // Trip
  AppLocaleKeys.trip_tent: "⛺ Tent",
  AppLocaleKeys.trip_sleeping_bag: "🛌 Sleeping bag",
  AppLocaleKeys.trip_firewood: "🪵 Firewood",
  AppLocaleKeys.trip_lantern: "🏮 Lantern",
  AppLocaleKeys.trip_water: "💧 Water",
  AppLocaleKeys.trip_snacks: "🍪 Snacks",
  AppLocaleKeys.trip_first_aid: "🩹 First aid kit",

  // Chicken
  AppLocaleKeys.chicken_whole: "🍗 Whole chicken",
  AppLocaleKeys.chicken_garlic: "🧄 Garlic",
  AppLocaleKeys.chicken_lemon: "🍋 Lemon",
  AppLocaleKeys.chicken_pepper: "🫑 Pepper",
  AppLocaleKeys.chicken_yogurt: "🥛 Yogurt",
  AppLocaleKeys.chicken_rice: "🍚 Rice",

  // Market
  AppLocaleKeys.market_bread: "🍞 Bread",
  AppLocaleKeys.market_milk: "🥛 Milk",
  AppLocaleKeys.market_eggs: "🥚 Eggs",
  AppLocaleKeys.market_cheese: "🧀 Cheese",
  AppLocaleKeys.market_vegetables: "🥦 Vegetables",
  AppLocaleKeys.market_fruits: "🍎 Fruits",
  AppLocaleKeys.market_oil: "🛢️ Oil",

  // School
  AppLocaleKeys.school_backpack: "🎒 School backpack",
  AppLocaleKeys.school_notebooks: "📓 Notebooks",
  AppLocaleKeys.school_pens: "🖊️ Pens",
  AppLocaleKeys.school_uniform: "👕 School uniform",
  AppLocaleKeys.school_shoes: "👟 Shoes",
  AppLocaleKeys.school_lunchbox: "🥪 Lunchbox",
  AppLocaleKeys.school_water_bottle: "🚰 Water bottle",


    },
  };
}
