<h1 align="center">html</h1>
<div align="center">
  <strong>
    Type-safe HTML support for Rust
  </strong>
</div>

<br />

<div align="center">
  <!-- Crates version -->
  <a href="https://crates.io/crates/html">
    <img src="https://img.shields.io/crates/v/html.svg?style=flat-square"
    alt="Crates.io version" />
  </a>
  <!-- Downloads -->
  <a href="https://crates.io/crates/html">
    <img src="https://img.shields.io/crates/d/html.svg?style=flat-square"
      alt="Download" />
  </a>
  <!-- docs.rs docs -->
  <a href="https://docs.rs/html">
    <img src="https://img.shields.io/badge/docs-latest-blue.svg?style=flat-square"
      alt="docs.rs docs" />
  </a>
</div>

<div align="center">
  <h3>
    <a href="https://docs.rs/html">
      API Docs
    </a>
    <span> | </span>
    <a href="https://github.com/yoshuawuyts/html/releases">
      Releases
    </a>
    <span> | </span>
    <a href="https://github.com/yoshuawuyts/html/blob/master.github/CONTRIBUTING.md">
      Contributing
    </a>
  </h3>
</div>


## Philosophy

HTML is easy to get started with, but hard to get right. There are several
hundred element kinds, element attributes, and deeply nested hierachies - with
some relationships even being conditional on each other. Remembering all of this
is difficult and error-prone, but luckily we don't have to remember any of this
by using the type system! Rust's type system enables us to model the entire HTML
spec, allowing us to catch all errors ahead of time during compilation.

This project comes in layers. The bottom-most layer is the HTML spec itself. We
download it, and parse it into definition files. We then take these definitions,
and use it to generate the `html-sys` crate. This crate is semantically correct,
and knows how to render itself to string representations. We then combine
`html-sys` with `web-sys` (wip) to create a higher-level HTML interface,
complete with support for events. This can be used to manipulate HTML both in
browser (wip) and non-browser contexts.

# Examples
We can create HTML structures one-by-one:

```rust
#![recursion_limit = "512"]

use html::text_content::OrderedList;
let tree = OrderedList::builder()
    .list_item(|li| li.text("nori").class("cat"))
    .list_item(|li| li.text("chashu").class("cat"))
    .build();
let string = tree.to_string();
```

But we can also use Rust's native control flow structures such as loops to
iterate over items and create HTML:

```rust
#![recursion_limit = "512"]

use html::text_content::OrderedList;
let mut ol = OrderedList::builder();
for name in ["hello", "world"] {
    ol.list_item(|li| li.text(name));
}
let tree = ol.build();
```

We can also create elements separately and append them later:
```rust
#![recursion_limit = "512"]

use html::text_content::{OrderedList, ListItem};
let mut ol = OrderedList::builder();
let li = ListItem::builder().text("hello").build();
ol.push(li);
let tree = ol.build();
```

## Building the project

To fetch, scrape, parse, and generate code; clone the project and then run:

```bash
$ cargo xtask all
```

This will run all stages of the `html-bindgen` crate, and create a fresh copy of
all generated code. If you make a change to any of the codegen stages, please
re-run xtask to update the generated code.

## References

- [Using HTML as a Compile Target (2023)](https://blog.yoshuawuyts.com/compiled-html/)
- [`web-sys`](https://docs.rs/web-sys/latest/web_sys/)

## Installation
```sh
$ cargo add html
```

## Safety
This crate uses ``#![deny(unsafe_code)]`` to ensure everything is implemented in
100% Safe Rust.

## Contributing
Want to join us? Check out our ["Contributing" guide][contributing] and take a
look at some of these issues:

- [Issues labeled "good first issue"][good-first-issue]
- [Issues labeled "help wanted"][help-wanted]

[contributing]: https://github.com/yoshuawuyts/html/blob/master.github/CONTRIBUTING.md
[good-first-issue]: https://github.com/yoshuawuyts/html/labels/good%20first%20issue
[help-wanted]: https://github.com/yoshuawuyts/html/labels/help%20wanted

## License

<sup>
Licensed under either of <a href="LICENSE-APACHE">Apache License, Version
2.0</a> or <a href="LICENSE-MIT">MIT license</a> at your option.
</sup>

<br/>

<sub>
Unless you explicitly state otherwise, any contribution intentionally submitted
for inclusion in this crate by you, as defined in the Apache-2.0 license, shall
be dual licensed as above, without any additional terms or conditions.
</sub>
