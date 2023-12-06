open Ppxlib
open Eml

(** Processes a Dream Embedded ML input string and produces OCaml output.

    This is lifted almost exactly from the Dream library's [process_file] function, but adjusted to take a string as input and produce a string as output. *)
let process_string input_string =
  let input_stream = Stream.of_string input_string in

  Location.reset ();

  let x = ref "" in
  let append_output str =
      x := !x ^ str
  in

  let _ = input_stream
  |> Tokenizer.scan
  |> Transform.delimit
  |> Transform.unindent
  |> Transform.coalesce
  |> Transform.trim
  |> Generate.generate ~reason:false "" append_output in
  !x

let expand ~ctxt eml =
    let _loc = Expansion_context.Extension.extension_point_loc ctxt in
    let out = process_string eml in
    out |> Lexing.from_string |> Parse.expression

let ppx_dream_eml_extension = 
    Extension.V3.declare "eml" Extension.Context.expression
        Ast_pattern.(single_expr_payload (estring __))
        expand

let rule = Ppxlib.Context_free.Rule.extension ppx_dream_eml_extension
let () = Driver.register_transformation ~rules:[ rule ] "eml"
