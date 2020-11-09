# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
hospital1 = Hospital.create(name: "Sweedish American")
hospital2 = Hospital.create(name: "St. Anthony's")

# Doctors:

jim = hospital1.doctors.create(name: "Jim", speciality: "General Surgery", school: "Harvard University")
brian = hospital1.doctors.create(name: "Brian", speciality: "Pediatric Surgery", school: "Johns Hopkins University")
alex = hospital2.doctors.create(name: "Alex", speciality: "General Surgery", school: "Stanford University")
tim = hospital2.doctors.create(name: "Tim", speciality: "Attending Surgeon", school: "University of Pennsylvania")

# Patients:

austin = Patient.create(name: "Austin", age: 26)
jared = Patient.create(name: "Jared", age: 29)
greg = Patient.create(name: "Greg", age: 28)
mike = Patient.create(name: "Mike", age: 27)
