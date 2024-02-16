# run function in all dirs
# expects a function name
allDirs() {
  dirs=()
  while IFS='' read -r line; do dirs+=("$line"); done < <(find . -maxdepth 2 -type d)
  for dir in "${dirs[@]}"; do
    $1 "$dir"
  done
}

runGet() {
  cd "$1" || return
  if [ -f "pubspec.yaml" ]; then
    flutter clean && flutter pub get
  fi
  cd - >/dev/null || return
}

flutter clean

allDirs "runGet"

# generate localization keys
cd "core" || exit
flutter pub run easy_localization:generate --source-dir ./resources/langs/ --output-dir lib/src/localization/generated --format keys -o locale_keys.g.dart

# generate data layer files
cd "../data" || exit
flutter pub run build_runner build --delete-conflicting-outputs
dart run polkadart_cli:generate -v

# generate auto route files
cd "../navigation" || exit
flutter pub run build_runner build --delete-conflicting-outputs
