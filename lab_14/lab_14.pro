domains
  lastname, city, street, carbrand, color, bankname = symbol.
  phonenum, housenum, apartnum, price, account, deposit = integer.
  address = address(city, street, housenum, apartnum).
predicates
  phonebook(lastname, phonenum, address).
  car(lastname, carbrand, color, price).
  depositor(lastname, bankname, account, deposit).

  search(carbrand, color, lastname, city, phonenum, bankname).
clauses
  phonebook(petrov, 74400297,
            address(moscow,    lenina,       4,  2)).
  phonebook(igorev, 77270935,
            address(moscow,    marksa,       3,  5)).
  phonebook(ivanov, 79345669,
            address(moscow,    pushkinskaya, 11, 1)).
  phonebook(stasov, 74024456,
            address(spb,       marksa,       4,  4)).
  phonebook(alkema, 73148253,
            address(ekb,       marksa,       6,  8)).
  phonebook(igorev, 73243243,
            address(volgograd, lenina,       9,  9)).

  car(petrov, ford,    pink,   24000).
  car(petrov, ferrari, red,    55000).
  car(ivanov, ford,    pink,   25000).
  car(igorev, tesla,   purple, 44000).
  car(stasov, bmw,     green,  3700).
  car(alkema, lexus,   yellow, 14000).

  depositor(petrov, agricole, 5, 52150322).
  depositor(igorev, paribas,  4, 32242424).
  depositor(ivanov, sberbank, 6, 442423123).
  depositor(stasov, sberbank, 1, 423424233).
  depositor(igorev, paribas,  3, 41424214).
  depositor(igorev, sberbank, 8, 421342352).

  search(Carbrand, Color, Lastname, City, Phonenum, Bankname) :-
    car(Lastname, Carbrand, Color, _),
    phonebook(Lastname, Phonenum, address(City, _, _, _)),
    depositor(Lastname, Bankname, _, _).
goal
  search(ford, pink, Lastname, City, Phonenum, Bankname).
