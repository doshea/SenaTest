# == Schema Information
#
# Table name: chambers
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  male_title   :string(255)
#  female_title :string(255)
#  neuter_title :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Chamber < ActiveRecord::Base
  attr_accessible :female_title, :male_title, :name, :neuter_title
end
