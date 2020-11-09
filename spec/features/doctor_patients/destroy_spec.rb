require "rails_helper"

describe "As a visitor" do
  describe "when I visit a doctors show page" do
    before :each do
      @hospital1 = Hospital.create(name: "Sweedish American")
      @hospital2 = Hospital.create(name: "St. Anthony's")

      @jim = @hospital1.doctors.create(name: "Jim", speciality: "General Surgery", school: "Harvard University")

      @austin = @jim.patients.create(name: "Austin", age: 26)
      @jared = @jim.patients.create(name: "Jared", age: 29)
      @greg = @jim.patients.create(name: "Greg", age: 28)
    end

    it "I can remove a patient from a doctor's caseload on the doctor's show page" do
      visit "/doctors/#{@jim.id}"

      within "#patients-#{@austin.id}" do
       click_link "Remove Patient From Caseload"
      end

      expect(current_path).to eq("/doctors/#{@jim.id}")
      expect(page).to_not have_content("#{@austin.name}")
      expect(page).to have_content("#{@jared.name}")
      expect(page).to have_content("#{@greg.name}")
    end
  end
end
