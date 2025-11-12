open! Core

type t = Notty.A.t [@@deriving equal]

let many attrs = List.fold attrs ~init:Notty.A.empty ~f:Notty.A.( ++ )
let bold = Notty.A.st Notty.A.bold
let italic = Notty.A.st Notty.A.italic
let underline = Notty.A.st Notty.A.underline
let blink = Notty.A.st Notty.A.blink
let empty = many []

module Color = struct
  type t = Notty.A.color

  let equal =
    (* Notty.A.color is an int under the hood, so phys_equal is fast and correct *)
    phys_equal
  ;;

  let rgb ~r ~g ~b =
    let r = Int.clamp_exn r ~min:0 ~max:255 in
    let g = Int.clamp_exn g ~min:0 ~max:255 in
    let b = Int.clamp_exn b ~min:0 ~max:255 in
    Notty.A.rgb_888 ~r ~g ~b
  ;;
end

let fg = Notty.A.fg
let bg = Notty.A.bg
let href url = Notty.A.href ~url

module Private = struct
  let type_equal : (t, Notty.A.t) Type_equal.t = T
end
