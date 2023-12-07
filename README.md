# ppx_dream_eml

A very straightforward extension that allows you to write [Dream](https://aantron.github.io/dream)'s .eml [templates](https://aantron.github.io/dream/#templates) directly in your OCaml code without the need to add directives to dune.

This also has the benefit of playing nice with your syntax highlighting and code editor, since the code produced will be valid OCaml.

The processing code is lifted directly from the [Dream repository](https://github.com/aantron/dream).

## Usage

Install the library:

```bash
opam install ppx_dream_eml
```

Add the ppx to your dune file:

```
...
  (preprocess (pps ... ppx_dream_eml))
...
```

And then use the `eml` extension in your OCaml code and write .eml templates as you normally would, except put the template part inside the extension:

```ocaml
let render message = {%eml|
<html>
<body>
  <p>The message is <b><%s message %></b>!</p>
</body>
</html>
|}
```

## Known issues

Errors won't quite map to the right places in your eml. Could perhaps be fixed with a more complicated implementation.
