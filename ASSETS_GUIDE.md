# Assets Guide

## 📸 How to Export Assets from Figma

### 1. Export Images

#### Logo
1. Select the Pgold logo in Figma
2. Right-click → Export
3. Format: PNG
4. Scale: 2x or 3x for better quality
5. Save as: `logo_white.png` (for splash screen)

#### Onboarding Illustrations
1. Select Frame 3 illustration (gift cards)
2. Export as PNG (2x)
3. Save as: `onboarding_1.png`

4. Select Frame 4 illustration (virtual cards)
5. Export as PNG (2x)
6. Save as: `onboarding_2.png`

### 2. Download Fonts

#### Inter Font Family
1. Go to: https://fonts.google.com/specimen/Inter
2. Click "Download family"
3. Extract the ZIP file
4. Copy these files to `assets/fonts/`:
   - `Inter-Regular.ttf`
   - `Inter-Medium.ttf`
   - `Inter-SemiBold.ttf`
   - `Inter-Bold.ttf`

### 3. Export Icons (Optional)

If you have custom icons in Figma:
1. Select the icon
2. Export as SVG
3. Save to `assets/icons/`

For now, we're using Material Icons which are built-in.

## 📁 Final Asset Structure

After adding all assets, your structure should look like:

```
assets/
├── images/
│   ├── logo_white.png          # White logo for splash
│   ├── onboarding_1.png        # Gift card illustration
│   └── onboarding_2.png        # Virtual card illustration
├── icons/
│   └── (custom SVG icons if any)
└── fonts/
    ├── Inter-Regular.ttf
    ├── Inter-Medium.ttf
    ├── Inter-SemiBold.ttf
    └── Inter-Bold.ttf
```

## 🎨 Image Specifications

### Splash Logo
- **Size**: 512x512px minimum
- **Format**: PNG with transparency
- **Color**: White (#FFFFFF)
- **Background**: Transparent

### Onboarding Illustrations
- **Size**: 600x600px minimum
- **Format**: PNG
- **Quality**: High (2x or 3x export)

## ✅ Verification Checklist

After adding assets:

- [ ] Logo displays correctly on splash screen
- [ ] Onboarding illustrations show properly
- [ ] Text renders with Inter font
- [ ] No missing asset errors in console
- [ ] Images look sharp on high-DPI screens

## 🔧 Troubleshooting

### "Unable to load asset"
- Check file names match exactly (case-sensitive)
- Verify files are in correct directories
- Run `flutter clean` then `flutter pub get`

### Fonts not applying
- Ensure font files are .ttf format
- Check pubspec.yaml font configuration
- Restart the app after adding fonts

### Images look blurry
- Export at 2x or 3x scale from Figma
- Use PNG format for better quality
- Check image dimensions are sufficient

## 📝 Quick Commands

```bash
# Clean and rebuild
flutter clean
flutter pub get
flutter run

# Check for asset errors
flutter analyze
```

---

**Need Help?** Check the main README.md for full setup instructions.
