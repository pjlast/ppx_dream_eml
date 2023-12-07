(lang dune 3.11)

(name ppx_dream_eml)

(generate_opam_files true)

(source
 (github pjlast/ppx_dream_eml))

(authors "Petri-Johan Last")

(maintainers "Petri-Johan Last")

(license MIT)

(documentation https://github.com/pjlast/ppx_dream_eml)

(package
 (name ppx_dream_eml)
 (synopsis "PPX to process Dream's Embedded ML syntax")
 (description "ppx_dream_eml allows processing Dream's Embedded ML syntax inline without the need to create dune directives and separate files.")
 (depends ocaml dune ppxlib camlp-streams dream)
 (tags
  (http web dream html)))

; See the complete stanza docs at https://dune.readthedocs.io/en/stable/dune-files.html#dune-project
