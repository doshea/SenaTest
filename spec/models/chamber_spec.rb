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

require 'spec_helper'

describe Chamber do
  pending "add some examples to (or delete) #{__FILE__}"
end
