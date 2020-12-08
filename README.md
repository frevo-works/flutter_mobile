# flutter_mobile

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

# 初回起動時はこちらを実行してください
①プロジェクト直下で flutter pub get　を実行

②flutter pub pub run flutter_native_splash:create　を実行

③ビルドして実行

#　iOSの実機ビルドをする時はこちらの手順に従ってください
①cd ios でiosフォルダに入る
②pod install　を実行
③Xcodeを開く
④XCodeのPodsプロジェクトを開く
⑤Quoted Include In Framework Header をNoに変更
⑥Pods/Pods/flutter_blue.podspecを開き下記２箇所を変更
```
Pod::Spec.new do |s|
  s.name             = 'flutter_blue'
  s.version          = '0.7.3' #←をこれに変更
  s.summary          = 'Bluetooth Low Energy plugin for Flutter.'
  s.description      = <<-DESC
```

```
s.subspec "Protos" do |ss|
    ss.source_files = "gen/*.pbobjc.{h,m}", "gen/**/*.pbobjc.{h,m}"
    #ss.header_mappings_dir = "gen"
    ss.requires_arc = false
    ss.dependency "Protobuf" #←に変更
  end
```

⑦ビルドして実行

