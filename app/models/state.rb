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

class State < ActiveRecord::Base
  attr_accessible :abbreviation, :name, :nonvoting
  has_many :politicians

end
