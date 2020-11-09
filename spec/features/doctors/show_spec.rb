require "rails_helper"

describe "As a visitor" do
  describe "when I visit a doctors show page" do
    before :each do
      @hospital1 = Hospital.create(name: "Sweedish American")
      @hospital2 = Hospital.create(name: "St. Anthony's")

      # Doctors:
      @jim = @hospital1.doctors.create(name: "Jim", speciality: "General Surgery", school: "Harvard University")
      @brian = @hospital2.doctors.create(name: "Brian", speciality: "Pediatric Surgery", school: "Johns Hopkins University")
      # Patients:
      @austin = Patient.create(name: "Austin", age: 26)
      @jared = Patient.create(name: "Jared", age: 29)
      @greg = Patient.create(name: "Greg", age: 28)
      @mike = Patient.create(name: "Mike", age: 27)

      DoctorPatient.create(doctor_id: @brian.id, patient_id: @mike.id)
      DoctorPatient.create(doctor_id: @brian.id, patient_id: @greg.id)
      DoctorPatient.create(doctor_id: @brian.id, patient_id: @jared.id)
      DoctorPatient.create(doctor_id: @jim.id, patient_id: @austin.id)
    end

    it "I see all of that doctor's information, the name of their hospital, and names of patients" do
      visit "/doctors/#{@jim.id}"

      expect(page).to have_content(@jim.name)
      
      within "#info-#{@jim.id}" do
        expect(page).to have_content(@jim.speciality)
        expect(page).to have_content(@jim.school)
        expect(page).to have_content(@jim.hospital.name)
      end
      within "#patients-#{@jim.id}" do
        expect(page).to have_content(@austin.name)
      end

      expect(page).to_not have_content(@brian.name)
      expect(page).to_not have_content(@brian.speciality)
      expect(page).to_not have_content(@brian.school)
      expect(page).to_not have_content(@brian.hospital.name)
      expect(page).to_not have_content(@mike.name)
      expect(page).to_not have_content(@greg.name)
      expect(page).to_not have_content(@jared.name)
    end
  end
end
