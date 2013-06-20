require 'httparty'
require 'json'

reset_containers = false
reset_politicians = false
seed_start_time = Time.now

puts "\nBEGINNING SEED"
puts "-------------"
User.delete_all
if reset_politicians
  Politician.delete_all
else
  puts 'Politicians not deleted to save time.'
end
if reset_containers
  State.destroy_all
  Chamber.destroy_all
  Party.destroy_all
end
puts "\nOld records deleted."

#Seed two admin users and two test users
puts "\nSeeding Users..."
User.create(email: 'dylan.j.oshea@gmail.com', username: 'doshea', password: 'qwerty', password_confirmation: 'qwerty', is_admin: true)
User.create(email: 'jessica.gonchar@gmail.com', username: 'jgonchar', password: 'qwerty', password_confirmation: 'qwerty', is_admin: true)
User.create(email: 'test@gmail.com', username: 'test', password: 'qwerty', password_confirmation: 'qwerty', is_admin: false)
User.create(email: 'test2@gmail.com', username: 'test2', password: 'qwerty', password_confirmation: 'qwerty', is_admin: false)
puts "Users seeded."

if reset_containers
  #Seed all 50 states
  puts "\nSeeding States..."
  State.create(abbreviation: "AR",name: "Arkansas")
  State.create(abbreviation: "DE",name: "Delaware")
  State.create(abbreviation: "FL",name: "Florida")
  State.create(abbreviation: "GA",name: "Georgia")
  State.create(abbreviation: "KS",name: "Kansas")
  State.create(abbreviation: "LA",name: "Louisiana")
  State.create(abbreviation: "MD",name: "Maryland")
  State.create(abbreviation: "MO",name: "Missouri")
  State.create(abbreviation: "MS",name: "Mississippi")
  State.create(abbreviation: "NC",name: "North Carolina")
  State.create(abbreviation: "OK",name: "Oklahoma")
  State.create(abbreviation: "SC",name: "South Carolina")
  State.create(abbreviation: "TN",name: "Tennessee")
  State.create(abbreviation: "TX",name: "Texas")
  State.create(abbreviation: "WV",name: "West Virginia")
  State.create(abbreviation: "AL",name: "Alabama")
  State.create(abbreviation: "CT",name: "Connecticut")
  State.create(abbreviation: "IA",name: "Iowa")
  State.create(abbreviation: "IL",name: "Illinois")
  State.create(abbreviation: "IN",name: "Indiana")
  State.create(abbreviation: "ME",name: "Maine")
  State.create(abbreviation: "MI",name: "Michigan")
  State.create(abbreviation: "MN",name: "Minnesota")
  State.create(abbreviation: "NE",name: "Nebraska")
  State.create(abbreviation: "NH",name: "New Hampshire")
  State.create(abbreviation: "NJ",name: "New Jersey")
  State.create(abbreviation: "NY",name: "New York")
  State.create(abbreviation: "OH",name: "Ohio")
  State.create(abbreviation: "RI",name: "Rhode Island")
  State.create(abbreviation: "VT",name: "Vermont")
  State.create(abbreviation: "WI",name: "Wisconsin")
  State.create(abbreviation: "CA",name: "California")
  State.create(abbreviation: "CO",name: "Colorado")
  State.create(abbreviation: "NM",name: "New Mexico")
  State.create(abbreviation: "NV",name: "Nevada")
  State.create(abbreviation: "UT",name: "Utah")
  State.create(abbreviation: "AZ",name: "Arizona")
  State.create(abbreviation: "ID",name: "Idaho")
  State.create(abbreviation: "MT",name: "Montana")
  State.create(abbreviation: "ND",name: "North Dakota")
  State.create(abbreviation: "OR",name: "Oregon")
  State.create(abbreviation: "SD",name: "South Dakota")
  State.create(abbreviation: "WA",name: "Washington")
  State.create(abbreviation: "WY",name: "Wyoming")
  State.create(abbreviation: "HI",name: "Hawaii")
  State.create(abbreviation: "AK",name: "Alaska")
  State.create(abbreviation: "KY",name: "Kentucky")
  State.create(abbreviation: "MA",name: "Massachusetts")
  State.create(abbreviation: "PA",name: "Pennsylvania")
  State.create(abbreviation: "VA",name: "Virginia")
  puts "Voting States seeded."

  #Seed Washington DC and the other 5 nonvoting states
  State.create(abbreviation: "DC",name: "Washington, D.C.", nonvoting: true)
  State.create(abbreviation: "MP",name: "Northern Mariana Islands", nonvoting: true)
  State.create(abbreviation: "PR",name: "Puerto Rico", nonvoting: true)
  State.create(abbreviation: "AS",name: "American Samoa", nonvoting: true)
  State.create(abbreviation: "VI",name: "US Virgin Islands", nonvoting: true)
  State.create(abbreviation: "GU",name: "Guam", nonvoting: true)
  puts "Non-voting States seeded."

  #Seed the two main political parties and Independent
  puts "\nSeeding Parties..."
  Party.create(name: 'Democratic Party', adjective: 'Democratic', member_noun: 'Democrat')
  Party.create(name: 'Republican Party', adjective: 'Republican', member_noun: 'Republican')
  Party.create(name: 'Independent', adjective: 'Independent', member_noun: 'Independent')
  puts "Parties seeded."

  #Seed the two chambers of Congress
  puts "\nSeeding Chambers(House and Senate)..."
  Chamber.create(name: 'Senate', short_name: 'senate', male_title: 'senator', female_title: 'senator', neuter_title: 'senator')
  Chamber.create(name: 'House of Representatives', short_name: 'house', male_title: 'congressman', female_title: 'congresswoman', neuter_title: 'congressperson')
  puts "Chambers seeded."
end

#Seed the members of both houses of Congress
Chamber.all.each do |chamber|
  settings = {
    chamber: chamber.short_name,
    apikey: ENV['SUNLIGHT_KEY'],
    per_page: 50,
    page: 0
  }
  puts "\nSeeding #{chamber.neuter_title}s..."
  counter = 1
  total_results = nil
  while total_results.nil? || (counter <= total_results)
    page_start = settings[:per_page] * (settings[:page]-1)
    page_end = settings[:per_page] * settings[:page]
    if counter > page_end
      settings[:page] += 1
      page_start = settings[:per_page] * (settings[:page]-1)
      page_end = settings[:per_page] * settings[:page]
      url = "http://congress.api.sunlightfoundation.com/legislators?chamber=#{settings[:chamber]}&apikey=#{settings[:apikey]}&per_page=#{settings[:per_page]}&page=#{settings[:page]}"
      data = HTTParty.get(url)
      total_results ||= data['count']
      results = data['results']
    end
    p_h = results[counter-page_start-1]
    if reset_politicians || Politician.find_by_govtrack_id(p_h['govtrack_id']).nil?
      state = State.find_by_abbreviation(p_h['state'])
      if state.present?
        politician = Politician.create(
          first_name: p_h['first_name'],
          last_name: p_h['last_name'],
          middle_name: p_h['middle_name'],
          nickname: p_h['nickname'],
          gender: p_h['gender'],
          in_office: p_h['in_office'],
          senate_class: p_h['senate_class'],
          birthday: p_h['birthday'],
          govtrack_id: p_h['govtrack_id'],
          seniority: p_h['state_rank'] == 'senior',
          name_suffix: p_h['name_suffix']
        )
        State.find_by_abbreviation(p_h['state']).politicians << politician
        Party.find_by_party_initial(p_h['party']).politicians << politician
        chamber.politicians << politician
      end
    end
    counter += 1
  end
  puts "#{chamber.neuter_title.capitalize}s seeded."
end

#Add images to each rep from Govtrack
new_counter = 1
needs_image = reset_politicians ? Politician.all : Politician.where('image = ?', nil)
needs_image.each do |p|
  # if new_counter < 20
  puts "\nAdding image to #{new_counter.ordinalize} politician"
  puts "#{p.first_name} #{p.last_name}"
  p.get_govtrack_image!
  new_counter += 1
  # end
end


puts "\n-------------"
puts "SEED COMPLETE"
puts "\nSeeding took ~ #{distance_of_time_in_words_to_now(seed_start_time, true)}" #this line required an import of the DateHelper in the Rakefile
