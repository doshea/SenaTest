# == Schema Information
#
# Table name: states
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  abbreviation :string(255)
#  nonvoting    :boolean          default(FALSE)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'spec_helper'

describe State do
  pending "add some examples to (or delete) #{__FILE__}"
end
