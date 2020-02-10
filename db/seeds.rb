weworks = [
  {name: "Finsbury Pavement", 
   country: "UK", 
   address: "131 Finsbury Pavement",
   rent_per_floor: 18000,
   number_of_floors: 8
  }, 
  {name: "Chelsea HQ", 
   country: "US", 
   address: "29 West 28th Street",
   rent_per_floor: 20000,
   number_of_floors: 20
  }, 
  {name: "Broadway", 
   country: "US", 
   address: "85 Broadway",
   rent_per_floor: 25000,
   number_of_floors: 6
  }
]

weworks.each do |we|
  Building.create(we)
end

companies = [
  "Microsoft",
  "Flatiron",
  "Green Peace",
  "FinFund LLC",
  "Inc'd Comics",
  "Blue Apron",
  "Dog the Bounty Hunter LLC"
]

companies.each do |company|
  Company.create(name: company)
end

titles = [
  "CEO",
  "Engineer",
  "HR specialist",
  "Graphic designer",
  "CFO",
  "COO",
  "Instructor"
]

100.times do 
  Employee.create(
    name: Faker::Name.name_with_middle,
    title: titles.sample,
    company: Company.all.sample
  )
end

offices_array=[]
weworks.each do |building|
  floor_ar = (1..building[:number_of_floors]).to_a
  offices_array << floor_ar
end

buildings_array = (0..(Building.count-1)).to_a

(offices_array.flatten.count/2).times do 
  random_building = buildings_array.sample
  if offices_array[random_building].size <= 2
    buildings_array.delete(random_building)
    random_building = buildings_array.sample
  end
  random_floor = offices_array[random_building].delete(offices_array[random_building].sample)
  Office.create(
    company: Company.all.sample,
    building: Building.all[random_building],
    floor: random_floor
  )
end

puts "seeds done"