require 'httparty'
require 'json'

State.delete_all
Chamber.delete_all
Party.delete_all
Politician.delete_all

#Seed all 50 states
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

#Seed Washington DC and the other 5 nonvoting states
State.create(abbreviation: "DC",name: "Washington, D.C.", nonvoting: true)
State.create(abbreviation: "MP",name: "Northern Mariana Islands", nonvoting: true)
State.create(abbreviation: "PR",name: "Puerto Rico", nonvoting: true)
State.create(abbreviation: "AS",name: "American Samoa", nonvoting: true)
State.create(abbreviation: "VI",name: "US Virgin Islands", nonvoting: true)
State.create(abbreviation: "GU",name: "Guam", nonvoting: true)


#Seed the two main political parties and Independent
Party.create(name: 'Democratic Party', adjective: 'Democratic', member_noun: 'Democrat')
Party.create(name: 'Republican Party', adjective: 'Republican', member_noun: 'Republican')
Party.create(name: 'Independent', adjective: 'Independent', member_noun: 'Independent')

#Seed the two chambers of Congress
senate = Chamber.create(name: 'Senate', short_name: 'senate', male_title: 'senator', female_title: 'senator', neuter_title: 'senator')
house_of_reps = Chamber.create(name: 'House of Representatives', short_name: 'house', male_title: 'congressman', female_title: 'congresswoman', neuter_title: 'congressperson')

#Seed the members of both houses of Congress
Chamber.all.each do |chamber|
  settings = {
      chamber: chamber.short_name,
      apikey: '70eed932c7f24f8ea250b6685851838e',
      per_page: 50,
      page: 0
  }
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
                              seniority: p_h['state_rank'],
                              name_suffix: p_h['name_suffix']
                            )
      State.find_by_abbreviation(p_h['state']).politicians << politician
      Party.find_by_party_initial(p_h['party']).politicians << politician
      chamber.politicians << politician
    end
    counter += 1
  end
  puts "#{chamber.name} seeded."
end