# NerdzDate

> **Archived.** This package is no longer developed here. It lives on as the `NerdzDate` product inside
> [NerdzUtils](https://github.com/nerdzlab/NerdzUtils), from version 2.0.0.

This repository stays public and keeps resolving, so existing dependencies do not break. It receives no
further fixes, including the correctness fixes listed below.

## Moving to NerdzUtils

Change the package URL and the product name:

```swift
// Before
.package(url: "https://github.com/nerdzlab/NerdzDate.git", from: "1.0.0")
.product(name: "NerdzDate", package: "NerdzDate")

// After
.package(url: "https://github.com/nerdzlab/NerdzUtils.git", from: "2.0.0")
.product(name: "NerdzDate", package: "NerdzUtils")
```

The import stays `import NerdzDate` and every symbol keeps its name.

You cannot depend on both at once. Swift Package Manager rejects two packages that vend the same product
name, so the dependency on this repository has to be removed in the same change.

## What you gain by moving

Three defects were fixed in NerdzUtils 2.0.0 and are still present here:

- `start(of:)` and `end(of:)` returned a date in the **previous** unit for `.month`, `.year`, `.quarter` and
  `.era`, because the implementation wrote zero into one based calendar fields. On 13 September 2020,
  `start(of: .month)` returned 31 August 2020.
- `.nz.customISO8601` was declared on a type that never conformed to the namespace protocol, so it could not
  be called at all.
- `Calendar.Component.nz.allComponents` listed `.timeZone` twice and omitted `.weekdayOrdinal`.

If your code compensates for the first one, for example by adding a day, remove that compensation when you
move.

## Documentation

API reference for the current version is published at
[nerdzlab.github.io/NerdzUtils/nerdzdate](https://nerdzlab.github.io/NerdzUtils/nerdzdate/documentation/nerdzdate/).

## License

MIT. See [LICENSE](LICENSE).
