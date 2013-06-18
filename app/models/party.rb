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

class Party < ActiveRecord::Base
  attr_accessible :adjective, :member_noun, :name
  has_many :politicians

  def self.find_by_party_initial(initial)
    translation = case initial
    when 'D'
      self.find_by_name('Democratic Party')
    when 'R'
      self.find_by_name('Republican Party')
    when 'I'
      self.find_by_name('Independent')
    else
      puts 'Error in Party.find_by_party_initial: no such party initial'
    end
  end
end
