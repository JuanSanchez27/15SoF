defaults write NSGlobalDomain AppleFontSmoothing -integer 0
flutter test --update-goldens --tags=golden
defaults delete NSGlobalDomain AppleFontSmoothing