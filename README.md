# ble_session_app

A ble session application uses flutter blue plus library.

## Getting Started

/* Note:- 
 * Step 1: Please add flutter blue plus library in pubspec.ymal ( flutter_blue_plus: ^1.8.8 )
 * Step 2: Please set minSdkVersion to 21 in your app build.gradle file's default config sestion
 * Step 3: Please add bluetooth related permission in your androidManifest.xml file below application tag.
 *    
 *  <!-- New Bluetooth permissions in Android 12
    https://developer.android.com/about/versions/12/features/bluetooth-permissions -->
    <uses-permission android:name="android.permission.BLUETOOTH_SCAN" android:usesPermissionFlags="neverForLocation" />
    <uses-permission android:name="android.permission.BLUETOOTH_CONNECT" />
    <!-- legacy for Android 11 or lower -->
    <uses-permission android:name="android.permission.BLUETOOTH" android:maxSdkVersion="30" />
    <uses-permission android:name="android.permission.BLUETOOTH_ADMIN" android:maxSdkVersion="30" />
 * */ 
