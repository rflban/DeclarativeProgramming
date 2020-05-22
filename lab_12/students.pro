domains
  person, institution, country = symbol.
predicates
  university(institution, country).
  student(person, institution).

  studies_in(person, country).
  is_crossed(institution, institution).

clauses
  university(bmstu, russia).
  university(msu, russia).
  university(hse, russia).

  university(mit, usa).
  university(berkley, usa).
  university(harvard, usa).

  university(tum, germany).
  university(tub, germany).

  student(michael, hse).
  student(michael, tum).
  student(dmitry, bmstu).
  student(alexander, hse).
  student(artem, bmstu).
  student(artem, berkley).
  student(john, mit).
  student(nial, harvard).
  student(dmitry, Usty) :- student(john, Usty).

  studies_in(Smb, Ctry) :-
    student(Smb, Usty),
    university(Usty, Ctry).

  is_crossed(Usty1, Usty2) :-
    student(Smb, Usty1),
    student(Smb, Usty2),
    not(Usty1 = Usty2).
goal
  is_crossed(Usty1, Usty2).

