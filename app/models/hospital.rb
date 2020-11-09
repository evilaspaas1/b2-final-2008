class Hospital < ApplicationRecord
  has_many :doctors

  def doctors_school
    doctors.select(:school).distinct.pluck(:school).to_sentence
  end
end
