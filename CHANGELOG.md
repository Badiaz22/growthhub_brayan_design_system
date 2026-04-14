## 1.0.0 — 2026-04-13

Initial stable release of the **Brayan Design System**.

### Design Tokens (`core/tokens`)
* `BrayanColors` — Full brand palette: primary, backgrounds, surface, text, border, and card colors for both light and dark themes.
* `BrayanTypography` — Public Sans–based type scale with heading, body, label, and price styles.
* `BrayanSpacing` — Consistent spacing scale (4–48 px) plus component-specific size constants (card padding, icon button sizes).
* `BrayanRadius` — Border-radius tokens for cards, chips, buttons, and text fields.
* `BrayanShadows` — Elevation tokens: `cardSm`, `cardMd`, and primary glow shadow.

### Theme
* `BrayanTheme.light` and `BrayanTheme.dark` — Ready-to-use `ThemeData` objects that wire all tokens into Flutter's Material theme.

### Atoms
* `BrayanText` — Styled text widget with named variants (`headingLarge`, `headingMedium`, `bodyLarge`, `bodyMedium`, `labelMedium`, `price`).
* `BrayanButton` — Primary, secondary, and ghost button variants with loading state support.
* `BrayanIconButton` — Icon-only action button with optional filled background.
* `BrayanTextField` — Themed text input with label, hint, prefix/suffix icon, and error state.
* `BrayanBadge` — Numeric count badge for cart and notification indicators.
* `BrayanImage` — Network image atom with configurable aspect ratio, `BoxFit`, border radius, loading spinner, and error fallback.

### Molecules
* `BrayanSearchBar` — Search input with leading icon and `onChanged` / `onSubmitted` callbacks.
* `BrayanCategoryChip` — Selectable pill chip with selected/unselected visual states.
* `BrayanNavItem` — Single bottom-navigation item with icon, label, and active state.
* `BrayanSectionHeader` — Section title paired with an optional action link.

### Organisms
* `BrayanAppHeader` — App bar combining the store title, search bar, and cart badge.
* `BrayanProductCard` — Product card with network image, category label, title, price, hover/focus elevation animation, and add-to-cart action. Accepts a `BrayanProductData` model.
* `BrayanProductGrid` — Responsive `GridView` of `BrayanProductCard` widgets with configurable cross-axis count.
* `BrayanCategoryFilter` — Horizontally scrollable row of `BrayanCategoryChip` widgets.
* `BrayanBottomNav` — Bottom navigation bar built from `BrayanNavItem` widgets with active-index state management.

### Templates
* `BrayanStoreTemplate` — Full-page scaffold template that composes the app header, category filter, product grid, and bottom navigation into the standard store layout.

### Example app
* Showcase application with dedicated pages for every Atomic Design level: Atoms, Molecules, Organisms, Templates, and a full Pages demo (Brayan Store e-commerce flow).

