**EXTENSION**

# `Node`
```swift
public extension Node where Context == HTML.ListContext
```

## Methods
### `li(for:at:)`

```swift
static func li(for name: String, at path: String? = nil) -> Node
```

Add an `<li>` HTML element within the current context.
- parameter nodes: The element's attributes and child elements.

#### Parameters

| Name | Description |
| ---- | ----------- |
| nodes | The element’s attributes and child elements. |

### `loremIpsumTestimonial()`

```swift
static func loremIpsumTestimonial() -> Node
```

### `loremIpsumArticle()`

```swift
static func loremIpsumArticle() -> Node
```

### `headerNav()`

```swift
static func headerNav() -> Node
```

Add an `<li>` HTML element within the current context.
- parameter nodes: The element's attributes and child elements.

#### Parameters

| Name | Description |
| ---- | ----------- |
| nodes | The element’s attributes and child elements. |

### `sectionForTestimonials()`

```swift
static func sectionForTestimonials() -> Node
```

### `sectionForHero()`

```swift
static func sectionForHero() -> Node
```

### `sectionForServices()`

```swift
static func sectionForServices() -> Node
```

### `year(fromDate:)`

```swift
static func year(fromDate date: Date = Date()) -> Self
```
