domains
  name = symbol
  phonenumber = string
predicates
  phonebook(name, phonenumber).
clauses
  phonebook(olga, "+7 440-02-97").
  phonebook(igor, "+7 727-09-35").
  phonebook(ivan, "+7 934-56-69").
  phonebook(stas, "+7 402-44-56").
  phonebook(petr, "+7 877-18-41").
  phonebook(igor, "+7 314-82-53").
goal
  phonebook(igor, Phone).