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

class Politician < ActiveRecord::Base
  belongs_to :state
  belongs_to :chamber
  belongs_to :party
  attr_accessible :birthday, :first_name, :gender, :govtrack_id, :in_office, :last_name, :middle_name, :name_suffix, :nickname, :senate_class, :seniority, :state_id, :chamber_id, :party_id, :govtrack_image, :remote_govtrack_image_url

  mount_uploader :govtrack_image, GovtrackImageUploader

  def get_govtrack_image
    url = "http://www.govtrack.us/congress/members/#{self.govtrack_id}"
    doc = Nokogiri::HTML(open(url))
    photo_div = doc.css('.photo img')
    rel_photo = photo_div.first['src'] if photo_div.present?
    abs_photo = ("http://www.govtrack.us" + rel_photo) if rel_photo.present?
  end

  def get_govtrack_image!
    self.update_attributes(remote_govtrack_image_url: self.get_govtrack_image)
  end

end
