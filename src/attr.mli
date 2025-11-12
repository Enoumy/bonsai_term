open! Core

type t [@@deriving equal]

val empty : t
val many : t list -> t

module Color : sig
  type t [@@deriving equal]

  (** NOTE: The below colors are "ANSI" "true" 24-bit colors.

      https://en.wikipedia.org/wiki/ANSI_escape_code#Colors *)
  val rgb : r:int -> g:int -> b:int -> t
end

(** [fg color] sets the "foreground color" (i.e. the color of the letters) to [color]. *)
val fg : Color.t -> t

(** [bg color] sets the "background color" to [color]. *)
val bg : Color.t -> t

val bold : t
val italic : t
val underline : t
val blink : t

(** [href url] creates a clickable hyperlink to [url]. *)
val href : string -> t

module Private : sig
  val type_equal : (t, Notty.A.t) Type_equal.t
end
