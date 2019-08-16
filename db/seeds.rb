# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

animal_types = ['Cavalo', 'Cachorro', 'Papagaio', 'Lhama', 'Iguana', 'Ornitorrinco']
animal_types.each{|animal_tp| AnimalType.create(animal_type: animal_tp) }

people = [
  {name: 'Johnny Cash', document: '555555555', dt_birth: '26 de fevereiro de 1932'},
  {name: 'Sid Vicious', document: '555555555', dt_birth: '10 de maio de 1957'},
  {name: 'Axl Rose', document: '555555555', dt_birth: '6 de fevereiro de 1962'},
  {name: 'Joey Ramone', document: '555555555', dt_birth: '19 de maio de 1951'},
  {name: 'Bruce Dickinson', document: '555555555', dt_birth: '7 de agosto de 1958'},
  {name: 'Kurt Cobain', document: '555555555', dt_birth: '20 de fevereiro de 1967'},
  {name: 'Elvis Presley', document: '555555555', dt_birth: '17 de agosto de 2008'}
]

animals = [
  {name: 'Pé de Pano', monthly_cost: '199,99', animal_type: 'Cavalo', person: 'Johnny Cash'},
  {name: 'Rex', monthly_cost: '99,99', animal_type:	'Cachorro', person: 'Sid Vicious'},
  {name: 'Ajudante do Papai Noel',	monthly_cost: '99,99', animal_type: 'Cachorro', person: 'Axl Rose'},
  {name: 'Rex', monthly_cost: '103,99', animal_type: 'Papagaio', person: 'Joey Ramone'},
  {name: 'Flora',	monthly_cost: '103,99', animal_type: 'Lhama',	person: 'Bruce Dickinson'},
  {name: 'Dino', monthly_cost: '177,99', animal_type: 'Iguana', person: 'Kurt Cobain'},
  {name: 'Lassie', monthly_cost: '407,99', animal_type: 'Ornitorrinco', person: 'Elvis Presley'}
]

people.each do |person_hsh|
  person = Person.new
  person.name = person_hsh[:name]
  person.dt_of_birth = person_hsh[:dt_birth]
  person.document = person_hsh[:document]
  person.save!
end

animals.each do |animal_hsh|
  person = Person.find_by(name: animal_hsh[:person])
  animal_type = AnimalType.find_by(animal_type: animal_hsh[:animal_type])
  Animal.create({name: animal_hsh[:name], monthly_cost: animal_hsh[:monthly_cost], person: person, animal_type: animal_type})
end

