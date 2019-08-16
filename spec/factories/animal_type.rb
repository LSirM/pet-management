animal_types = ['Cavalo', 'Cachorro', 'Papagaio', 'Lhama', 'Iguana', 'Ornitorrinco', 'Peixe', 'Pato', 'Tartaruga', 'Andorinha']

FactoryBot.define do
  factory :animal_type do
    animal_type { animal_types.sample }
  end
end