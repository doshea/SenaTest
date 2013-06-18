# == Schema Information
#
# Table name: politicians
#
#  id           :integer          not null, primary key
#  first_name   :string(255)
#  middle_name  :string(255)
#  last_name    :string(255)
#  nickname     :string(255)
#  state_id     :integer
#  in_office    :boolean
#  gender       :string(255)
#  senate_class :integer
#  birthday     :date
#  govtrack_id  :integer
#  seniority    :boolean
#  name_suffix  :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'spec_helper'

describe Politician do
  pending "add some examples to (or delete) #{__FILE__}"
end
