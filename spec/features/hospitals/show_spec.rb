require "rails_helper"

describe "As a visitor" do
  describe "When I visit a hospitals show page" do
    before :each do
      @hospital1 = Hospital.create(name: "Sweedish American")
      @hospital2 = Hospital.create(name: "St. Anthony's")

      # Doctors:
      @jim = @hospital1.doctors.create(name: "Jim", speciality: "General Surgery", school: "Harvard University")
      @brian = @hospital2.doctors.create(name: "Brian", speciality: "Pediatric Surgery", school: "Johns Hopkins University")
      @tim = @hospital2.doctors.create(name: "Tim", speciality: "Attending Surgeon", school: "University of Pennsylvania")
    end

    it "I can see the hospital's information, doctors, and unique universities doctors attended" do
       visit "/hospitals/#{@hospital1.id}"

       expect(page).to have_content(@hospital1.name)
       expect(page).to have_content("Doctors: 1")
       expect(page).to have_content(@jim.school)
       expect(page).to have_content(@hospital1.doctors_school.to_sentence)

       expect(page).to_not have_content(@hospital2.name)
       expect(page).to_not have_content("Doctors: 2")
       expect(page).to_not have_content(@brian.school)
       expect(page).to_not have_content(@tim.school)
    end
  end
end
