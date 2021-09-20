defaults write NSGlobalDomain AppleFontSmoothing -integer 0
flutter test --update-goldens --name=Golden
defaults delete NSGlobalDomain AppleFontSmoothing