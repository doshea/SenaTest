# == Schema Information
#
# Table name: politicians
#
#  id           :integer          not null, primary key
#  first_name   :string(255)
#  middle_name  :string(255)
#  last_name    :string(255)
#  nickname     :string(255)
#  name_suffix  :string(255)
#  gender       :string(255)
#  birthday     :date
#  seniority    :boolean
#  in_office    :boolean
#  senate_class :integer
#  govtrack_id  :integer
#  state_id     :integer
#  chamber_id   :integer
#  party_id     :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Politician < ActiveRecord::Base
  belongs_to :state
  belongs_to :chamber
  belongs_to :party
  attr_accessible :birthday, :first_name, :gender, :govtrack_id, :in_office, :last_name, :middle_name, :name_suffix, :nickname, :senate_class, :seniority, :state_id, :chamber_id, :party_id

end
