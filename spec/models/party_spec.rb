# == Schema Information
#
# Table name: parties
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  adjective   :string(255)
#  member_noun :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'spec_helper'

describe Party do
  pending "add some examples to (or delete) #{__FILE__}"
end
