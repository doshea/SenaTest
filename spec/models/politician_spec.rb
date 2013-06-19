# == Schema Information
#
# Table name: politicians
#
#  id             :integer          not null, primary key
#  first_name     :string(255)
#  middle_name    :string(255)
#  last_name      :string(255)
#  nickname       :string(255)
#  name_suffix    :string(255)
#  gender         :string(255)
#  birthday       :date
#  seniority      :boolean
#  in_office      :boolean
#  senate_class   :integer
#  govtrack_id    :integer
#  state_id       :integer
#  chamber_id     :integer
#  party_id       :integer
#  govtrack_image :text
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'spec_helper'

describe Politician do
  pending "add some examples to (or delete) #{__FILE__}"
end
