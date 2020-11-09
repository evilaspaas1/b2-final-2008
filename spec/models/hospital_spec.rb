require 'rails_helper'

RSpec.describe Hospital do
  describe 'Relationships' do
    it {should have_many :doctors}
  end

  describe "instance methods" do
    before :each do
      @hospital1 = Hospital.create(name: "Sweedish American")
      @hospital2 = Hospital.create(name: "St. Anthony's")

      @jim = @hospital1.doctors.create(name: "Jim", speciality: "General Surgery", school: "Harvard University")
      @brian = @hospital1.doctors.create(name: "Brian", speciality: "Pediatric Surgery", school: "Johns Hopkins University")
      @alex = @hospital2.doctors.create(name: "Alex", speciality: "General Surgery", school: "Stanford University")
      @tim = @hospital2.doctors.create(name: "Tim", speciality: "Attending Surgeon", school: "University of Pennsylvania")
    end

    it "#doctors_school" do
      expect(@hospital1.doctors_school).to eq([@jim.school, @brian.school])
    end
  end
end
