
(** {2 Transient iterators, that abstract on a finite sequence of elements. *)

type 'a t
  (** Sequence abstract iterator type *)

(** {2 Build a sequence} *)

val from_iter : (('a -> unit) -> unit) -> 'a t
  (** Build a sequence from a iter function *)

(** {2 Use a sequence} *)

val iter : ('a -> unit) -> 'a t -> unit
  (** Consume the sequence, passing all its arguments to the function *)

val fold : ('b -> 'a -> 'b) -> 'b -> 'a t -> 'b
  (** Fold over elements of the sequence, consuming it *)

val map : ('a -> 'b) -> 'a t -> 'b t
  (** Map objects of the sequence into other elements, lazily *)

val filter : ('a -> bool) -> 'a t -> 'a t
  (** Filter on elements of the sequence *)

val concat : 'a t -> 'a t -> 'a t
  (** Concatenate two sequences *)

val take : int -> 'a t -> 'a t
  (** Take at most [n] elements from the sequence *)

val drop : int -> 'a t -> 'a t
  (** Drop the [n] first elements of the sequence *)

(** {2 Basic data structures converters} *)

module List :
  sig
    val of_seq : 'a t -> 'a list
    val to_seq : 'a list -> 'a t
  end

module Hashtbl :
  sig
    val of_seq : ('a * 'b) t -> ('a, 'b) Hashtbl.t
    val to_seq : ('a, 'b) Hashtbl.t -> ('a * 'b) t
  end
