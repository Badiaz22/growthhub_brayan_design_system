# Brayan Design System

> **Version 1.0.0** · Flutter · Dart SDK ≥ 3.11.0

A Flutter package that implements a complete design system following the **Atomic Design** methodology. It provides a fully tokenized, theme-aware component library with a premium e-commerce aesthetic, ready to be consumed by any Flutter application.

---

## Table of Contents

1. [Architecture](#architecture)
2. [Installation](#installation)
3. [Setup](#setup)
4. [Design Tokens](#design-tokens)
5. [Components](#components)
   - [Atoms](#atoms)
   - [Molecules](#molecules)
   - [Organisms](#organisms)
   - [Templates](#templates)
6. [Example Showcase](#example-showcase)
7. [License](#license)

---

## Architecture

The package follows [Atomic Design](https://bradfrost.com/blog/post/atomic-web-design/) principles, where every UI layer builds on the one below it:

```
lib/
├── brayan_design_system.dart     # Public barrel export
└── src/
    ├── core/tokens/              # Design tokens (single source of truth)
    │   ├── brayan_colors.dart
    │   ├── brayan_typography.dart
    │   ├── brayan_spacing.dart
    │   ├── brayan_radius.dart
    │   └── brayan_shadows.dart
    ├── theme/
    │   └── brayan_theme.dart     # Light & dark ThemeData
    ├── atoms/                    # Indivisible building blocks
    │   ├── brayan_text.dart
    │   ├── brayan_button.dart
    │   ├── brayan_icon_button.dart
    │   ├── brayan_text_field.dart
    │   ├── brayan_badge.dart
    │   └── brayan_image.dart
    ├── molecules/                # Atoms combined into simple components
    │   ├── brayan_search_bar.dart
    │   ├── brayan_category_chip.dart
    │   ├── brayan_nav_item.dart
    │   └── brayan_section_header.dart
    ├── organisms/                # Complex, standalone UI sections
    │   ├── brayan_app_header.dart
    │   ├── brayan_product_card.dart
    │   ├── brayan_product_grid.dart
    │   ├── brayan_category_filter.dart
    │   └── brayan_bottom_nav.dart
    └── templates/                # Full-page layout structures
        └── brayan_store_template.dart
```

---

## Installation

Add the package to your `pubspec.yaml`:

```yaml
dependencies:
  brayan_design_system:
    path: ../brayan_design_system   # local path
    # or via git:
    # git:
    #   url: https://github.com/your-org/brayan_design_system.git
```

Then run:

```bash
flutter pub get
```

---

## Setup

Wrap your `MaterialApp` with the Brayan theme to activate all tokens:

```dart
import 'package:brayan_design_system/brayan_design_system.dart';

MaterialApp(
  theme: BrayanTheme.light,
  darkTheme: BrayanTheme.dark,
  themeMode: ThemeMode.system,
  home: MyHomePage(),
);
```

Import a single entry point to access every component and token:

```dart
import 'package:brayan_design_system/brayan_design_system.dart';
```

---

## Design Tokens

All visual constants live in `src/core/tokens/` and are never hard-coded in components.

| Class | Responsibility |
|---|---|
| `BrayanColors` | Brand primary, backgrounds, surface, text (primary / secondary / tertiary), border, and card colors — light & dark variants |
| `BrayanTypography` | Public Sans text styles: `headingLarge`, `headingMedium`, `bodyLarge`, `bodyMedium`, `labelMedium`, `price` |
| `BrayanSpacing` | Scale from 4 px to 48 px plus named constants (`cardPadding`, `smallIconButtonSize`, …) |
| `BrayanRadius` | `card`, `chip`, `button`, `input` border-radius values |
| `BrayanShadows` | `cardSm` (resting), `cardMd` (hover/focus), `primaryGlow` |

---

## Components

### Atoms

#### `BrayanText`
Styled text widget backed by `BrayanTypography`.

```dart
BrayanText('Welcome', variant: BrayanTextVariant.headingLarge);
BrayanText('\$109.95', variant: BrayanTextVariant.price);
```

#### `BrayanButton`
Full-width or intrinsic-size button in three styles.

```dart
BrayanButton(label: 'Buy Now', onPressed: () {});
BrayanButton(label: 'Save', variant: BrayanButtonVariant.secondary, onPressed: () {});
BrayanButton(label: 'Cancel', variant: BrayanButtonVariant.ghost, onPressed: () {});
```

#### `BrayanIconButton`
Icon-only button with an optional filled background.

```dart
BrayanIconButton(
  icon: Icons.add_shopping_cart,
  onPressed: () {},
  filled: true,
  size: 36,
  iconSize: 20,
);
```

#### `BrayanTextField`
Themed text input with label, prefix/suffix icons, and error state.

```dart
BrayanTextField(
  label: 'Email',
  hint: 'you@example.com',
  prefixIcon: Icons.email_outlined,
  onChanged: (v) {},
);
```

#### `BrayanBadge`
Count badge, typically used over a cart or notification icon.

```dart
BrayanBadge(count: 3, child: Icon(Icons.shopping_cart));
```

#### `BrayanImage`
Network image with configurable aspect ratio, `BoxFit`, loading spinner, and error placeholder.

```dart
BrayanImage(
  imageUrl: 'https://example.com/product.jpg',
  aspectRatio: 4 / 3,
  fit: BoxFit.cover,
);
```

> Pass `aspectRatio: null` when the image lives inside a parent that already constrains the size (e.g., inside `AspectRatio` or a fixed-height container).

---

### Molecules

#### `BrayanSearchBar`
Search input with a leading magnifier icon.

```dart
BrayanSearchBar(
  hint: 'Search products…',
  onChanged: (query) {},
  onSubmitted: (query) {},
);
```

#### `BrayanCategoryChip`
Selectable pill chip for category filtering.

```dart
BrayanCategoryChip(
  label: 'Electronics',
  isSelected: true,
  onTap: () {},
);
```

#### `BrayanNavItem`
Single item for a bottom navigation bar.

```dart
BrayanNavItem(
  icon: Icons.home_outlined,
  label: 'Home',
  isActive: true,
  onTap: () {},
);
```

#### `BrayanSectionHeader`
Section title paired with an optional trailing action.

```dart
BrayanSectionHeader(
  title: 'Featured Products',
  actionLabel: 'See all',
  onAction: () {},
);
```

---

### Organisms

#### `BrayanAppHeader`
Top app bar with store title, `BrayanSearchBar`, and cart `BrayanBadge`.

```dart
BrayanAppHeader(
  title: 'Brayan Store',
  cartCount: 2,
  onCartTap: () {},
  onSearchChanged: (q) {},
);
```

#### `BrayanProductCard` + `BrayanProductData`
Product card with image, category, title, formatted price, hover elevation animation, and add-to-cart action.

```dart
BrayanProductCard(
  product: BrayanProductData(
    id: '1',
    title: 'Fjallraven Backpack',
    price: 109.95,
    imageUrl: 'https://fakestoreapi.com/img/81fAn…',
    category: "men's clothing",
  ),
  onAddToCart: () {},
  onTap: () {},
);
```

#### `BrayanProductGrid`
Responsive grid of `BrayanProductCard` widgets.

```dart
BrayanProductGrid(
  products: myProducts,
  crossAxisCount: 2,
  onAddToCart: (product) {},
  onProductTap: (product) {},
);
```

#### `BrayanCategoryFilter`
Horizontally scrollable row of `BrayanCategoryChip` widgets.

```dart
BrayanCategoryFilter(
  categories: ['All', 'Electronics', 'Clothing'],
  selectedCategory: 'All',
  onCategorySelected: (cat) {},
);
```

#### `BrayanBottomNav`
Bottom navigation bar built from `BrayanNavItem` widgets.

```dart
BrayanBottomNav(
  currentIndex: 0,
  onTap: (index) {},
  items: [
    BrayanNavItemData(icon: Icons.home_outlined, label: 'Home'),
    BrayanNavItemData(icon: Icons.search, label: 'Search'),
    BrayanNavItemData(icon: Icons.shopping_bag_outlined, label: 'Cart'),
    BrayanNavItemData(icon: Icons.person_outline, label: 'Profile'),
  ],
);
```

---

### Templates

#### `BrayanStoreTemplate`
Full-page scaffold that wires the app header, category filter, scrollable body, and bottom navigation into the standard store layout.

```dart
BrayanStoreTemplate(
  title: 'My Store',
  categories: myCategories,
  selectedCategory: activeCategory,
  onCategorySelected: (cat) {},
  body: BrayanProductGrid(products: filteredProducts),
  bottomNav: BrayanBottomNav(...),
);
```

---

## Example Showcase

The `example/` app is a self-contained showcase that exercises every component:

```bash
cd example
flutter pub get
flutter run
```

| Page | Content |
|---|---|
| Atoms | Text styles, button variants, icon buttons, text field, badge, image |
| Molecules | Search bar, category chips, nav items, section headers |
| Organisms | App header, product cards, product grid, bottom nav |
| Templates | Store layout visualization |
| Pages | Full Brayan Store e-commerce flow |

---
