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

brian = hospital1.doctors.create(name: "Brian", speciality: "General Surgery", school: "Johns Hopkins University")
tim = hospital2.doctors.create(name: "Tim", speciality: "General Surgery", school: "University of Pennsylvania")

# Patients:

austin = brian.patients.create(name: "Austin", age: 26)
jared = brian.patients.create(name: "Jared", age: 29)
greg = tim.patients.create(name: "Greg", age: 28)
mike = tim.patients.create(name: "Mike", age: 27)
