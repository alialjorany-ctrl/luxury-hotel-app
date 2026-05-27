# 🏨 Luxury Hotel Mobile App - تطبيق الفندق الفاخر

تطبيق حجز فنادق عراقي متخصص في مناطق بغداد وكربلاء والنجف بتصميم فاخر وواجهات حديثة.

## ✨ المزايا الرئيسية

### للزوار والسياح 👥
- 🎨 واجهة فاخرة (أسود وذهبي)
- 🔍 البحث المتقدم عن الفنادق
- 🏨 عرض الغرف مع صور HD و 360 preview
- 💳 نظام دفع متكامل (Visa, Mastercard, Cash, Wallets)
- ⭐ نظام التقييمات والمراجعات
- 📱 إدارة الحجوزات
- 💬 دردشة مباشرة مع الفندق
- 🗺️ خريطة تفاعلية للفندق
- 🎯 نظام الولاء والمكافآت
- 🤖 مساعد ذكي للتوصيات
- 🌐 دعم اللغة العربية والإنجليزية
- 🔐 مصادقة آمنة مع Biometric

### لوحة تحكم أصحاب الفنادق 🏢
- 📊 لوحة معلومات شاملة
- 🏠 إدارة الفندق والغرف
- 💰 إدارة الأسعار والعروض
- 📅 إدارة الحجوزات
- 👥 إدارة الموظفين
- 📈 التقارير والإحصائيات
- 💬 الرسائل من العملاء
- 📸 إدارة الصور والملفات

## 🛠️ التكنولوجيا المستخدمة

- **Frontend (Mobile)**: Flutter
- **Frontend (Web Dashboard)**: Flutter Web / React
- **Backend**: Firebase (Firestore, Authentication, Storage, Cloud Functions)
- **Payment**: Stripe, 2Checkout, Local Payment Methods
- **Maps**: Google Maps API
- **AI/ML**: Firebase ML Kit, Custom Recommendations
- **Real-time**: Firebase Realtime Database
- **Push Notifications**: Firebase Cloud Messaging

## 📁 بنية المشروع

```
luxury-hotel-app/
├── mobile/                          # تطبيق الجوال Flutter
│   ├── lib/
│   │   ├── main.dart
│   │   ├── config/
│   │   ├── features/
│   │   ├── core/
│   │   ├── data/
│   │   ├── domain/
│   │   └── presentation/
│   ├── pubspec.yaml
│   └── README.md
├── admin/                           # لوحة التحكم
│   ├── lib/
│   ├── pubspec.yaml
│   └── README.md
├── backend/                         # Firebase Functions
│   ├── functions/
│   ├── firestore.rules
│   └── README.md
├── docs/                            # التوثيق
└── .github/                         # CI/CD

```

## 🎨 ألوان التصميم

- **Primary**: #000000 (أسود)
- **Accent**: #D4AF37 (ذهبي)
- **Background**: #0A0E27 (أسود فاتح)
- **Surface**: #1A1F3A (رمادي غامق)
- **Text**: #FFFFFF (أبيض)

## 🚀 البدء السريع

### المتطلبات
- Flutter SDK 3.x
- Firebase Account
- Xcode (لـ iOS)
- Android Studio (لـ Android)

### التثبيت

```bash
# استنساخ المستودع
git clone https://github.com/alialjorany-ctrl/luxury-hotel-app.git
cd luxury-hotel-app

# تثبيت التبعيات
cd mobile
flutter pub get

# تشغيل التطبيق
flutter run
```

## 📝 الملفات الرئيسية

- `pubspec.yaml` - تبعيات المشروع
- `firebase.json` - إعدادات Firebase
- `.env.example` - متغيرات البيئة

## 🔐 المصادقة والأمان

- Firebase Authentication
- Biometric Login (البصمة والوجه)
- JWT Tokens
- Encrypted Local Storage

## 💳 نظام الدفع

- Visa و Mastercard
- الدفع عند الاستقبال (COD)
- محافظ رقمية عراقية (Zain Cash, Asiacell)
- تحويل بنكي

## 📱 المدن المدعومة

- 🏙️ بغداد
- 🕌 كربلاء
- 🕌 النجف

## 📞 الدعم والتواصل

- 📧 البريد الإلكتروني: support@luxuryhotelapp.iq
- 📱 رقم الدعم: +964 780 XXXX XXXX
- 💬 الدردشة المباشرة عبر التطبيق

## 📄 الترخيص

MIT License - جميع الحقوق محفوظة © 2026

## 🎯 خارطة الطريق

- ✅ المرحلة 1: البحث والحجز الأساسي
- ⏳ المرحلة 2: نظام الدفع المتقدم
- ⏳ المرحلة 3: AI Recommendations
- ⏳ المرحلة 4: Loyalty Program
- ⏳ المرحلة 5: لوحة التحكم المتقدمة

---

**Made with ❤️ for Iraq's Tourism Industry**
