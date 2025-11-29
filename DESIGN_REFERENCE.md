# 🎯 TruthChain - Quick Visual Reference Guide

## 📐 Standard Page Layout

```
┌─────────────────────────────────────────────────────────────┐
│  NAVIGATION (Fixed at top, black bg, green accents)        │
│  Height: ~64px                                              │
└─────────────────────────────────────────────────────────────┘
                         ↓ mt-20 (80px gap)
┌─────────────────────────────────────────────────────────────┐
│                      ↑ pt-12 (48px)                         │
│  ┌───────────────────────────────────────────────────────┐  │
│  │                                                       │  │
│  │  CONTENT CONTAINER (max-w-7xl, centered)             │  │
│  │                                                       │  │
│  │  • Headers                                            │  │
│  │  • Cards                                              │  │
│  │  • Grids                                              │  │
│  │                                                       │  │
│  └───────────────────────────────────────────────────────┘  │
│  ← px-6 (24px) →                         ← px-6 (24px) →   │
│                      ↓ pb-12 (48px)                         │
└─────────────────────────────────────────────────────────────┘
```

## 🎨 Color Palette

```
┌──────────────────┬──────────────────────────────────────┐
│ Color            │ Usage                                │
├──────────────────┼──────────────────────────────────────┤
│ #000000 (Black)  │ Page background                      │
│ #00ff41 (Green)  │ Primary buttons, accents, links      │
│ #ffffff (White)  │ Headings, important text             │
│ #858585 (Gray)   │ Body text, descriptions              │
│ #666666 (Gray)   │ Muted text, placeholders             │
│ #141414 (Gray)   │ Borders, dividers, card backgrounds  │
└──────────────────┴──────────────────────────────────────┘
```

## 📏 Spacing System

```
┌─────────┬────────┬──────────────────────────────────────┐
│ Class   │ Value  │ Usage                                │
├─────────┼────────┼──────────────────────────────────────┤
│ mt-20   │ 80px   │ Top margin (clear navigation)        │
│ pt-12   │ 48px   │ Section top padding                  │
│ pb-12   │ 48px   │ Section bottom padding               │
│ px-6    │ 24px   │ Horizontal padding (responsive)      │
│ mb-12   │ 48px   │ Section gaps                         │
│ gap-4   │ 16px   │ Tight grids (stats, features)        │
│ gap-6   │ 24px   │ Normal grids (cards, content)        │
│ space-y-6│ 24px  │ Vertical spacing in forms            │
└─────────┴────────┴──────────────────────────────────────┘
```

## 🏗️ Component Structure

### Standard Page
```tsx
<div className="min-h-screen bg-black">
  <Navigation />
  
  <section className="mt-20 pt-12 pb-12 px-6">
    <div className="mx-auto max-w-7xl">
      
      {/* Header */}
      <div className="text-center mb-12">
        <div className="inline-flex items-center gap-2 px-3 py-1.5 rounded bg-black border border-primary-500/30 mb-6">
          <Icon className="w-4 h-4 text-primary-500" />
          <span className="text-xs font-semibold text-primary-500 tracking-wider uppercase">
            Badge Text
          </span>
        </div>
        <h1 className="text-4xl md:text-5xl font-bold mb-4 text-white">
          Page Title
        </h1>
        <p className="text-xl text-secondary-400">
          Description text
        </p>
      </div>

      {/* Content */}
      <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
        <div className="card">Card content</div>
        <div className="card">Card content</div>
      </div>
      
    </div>
  </section>
</div>
```

### Standard Card
```tsx
<div className="card">
  {/* 24px padding built-in */}
  <h3 className="text-lg font-semibold text-white mb-2">
    Card Title
  </h3>
  <p className="text-sm text-secondary-400">
    Card description
  </p>
</div>
```

### Standard Button
```tsx
{/* Primary */}
<button className="btn btn-primary flex items-center gap-2">
  <Icon className="w-5 h-5" />
  Button Text
</button>

{/* Outline */}
<button className="btn btn-outline flex items-center gap-2">
  <Icon className="w-5 h-5" />
  Button Text
</button>
```

### Standard Input
```tsx
<div>
  <label className="block text-sm font-semibold text-white mb-2">
    Label Text
  </label>
  <input
    type="text"
    placeholder="Placeholder"
    className="input"
  />
</div>
```

## 📱 Responsive Breakpoints

```
┌────────────┬─────────┬──────────────────────────────┐
│ Breakpoint │ Width   │ Changes                      │
├────────────┼─────────┼──────────────────────────────┤
│ sm         │ 640px   │ Container max-width          │
│ md         │ 768px   │ 2-column grids               │
│ lg         │ 1024px  │ 3-column grids               │
│ xl         │ 1280px  │ Full max-w-7xl               │
└────────────┴─────────┴──────────────────────────────┘
```

## ✅ Checklist for New Pages

When creating a new page, ensure:

- [ ] Use `<div className="min-h-screen bg-black">`
- [ ] Include `<Navigation />`
- [ ] Use `<section className="mt-20 pt-12 pb-12 px-6">`
- [ ] Use `<div className="mx-auto max-w-7xl">` for content
- [ ] Use `text-white` for headings
- [ ] Use `text-secondary-400` for descriptions
- [ ] Use `border-secondary-900` for borders
- [ ] Use `gap-6` for card grids
- [ ] Use `mb-12` for section spacing
- [ ] Test on mobile (responsive)

## 🚫 Common Mistakes to Avoid

❌ **DON'T:**
- Add container classes to layout.tsx
- Use old blue/purple gradients
- Use inconsistent spacing values
- Use `bg-gradient-to-b from-slate-950...`
- Add multiple `max-w-7xl` containers
- Use `text-slate-300` (use `text-secondary-400`)

✅ **DO:**
- Use standard page structure
- Use black/green color scheme
- Use standard spacing values
- Use `bg-black`
- Use single container per section
- Use `text-secondary-400` for body text

## 🎯 Quick Reference

**Page Background:** `bg-black`
**Section Spacing:** `mt-20 pt-12 pb-12 px-6`
**Container:** `mx-auto max-w-7xl`
**Headings:** `text-white`
**Body Text:** `text-secondary-400`
**Borders:** `border-secondary-900`
**Primary Color:** `text-primary-500` or `bg-primary-500`
**Card Gaps:** `gap-6`
**Section Gaps:** `mb-12`
