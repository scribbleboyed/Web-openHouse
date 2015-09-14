# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

EventAgent.delete_all
EventListing.delete_all
EventProspect.delete_all
Event.delete_all
Prospect.delete_all
OpenHouse.delete_all
Listing.delete_all
Agent.delete_all

Agent.create ({
	first_name: "Edward",
	last_name: "Yeh",
	phone: "626-236-3322",
	email: "edyeh@ucla.edu",
	password: "Password1",
	password_confirmation: "Password1"
	})

Event.create ({
	title: "Listing Presentation",
	date: "9/23/2015",
	start_time: "11:00 AM",
	end_time: "12:00 PM",
	notes: "Prepare presentation and example listing documents"
	})

Listing.create ({
	address_1: "264 North Madison Ave. #104",
    address_2: nil,
    city: "Pasadena",
    state: "CA",
    zip_code: "91101",
    sqft: 1782,
    bed: 3,
    bath: 2.5,
    description: "This lovely, exquisitely upgraded corner unit in highly regarded Madison Walk features 3 bedrooms, 2.5 bathrooms, set within a well-designed floor plan. This beautifully decorated unit features newer engineered wood flooring, high ceilings, in unit laundry, crown moldings, a security system and an upgraded kitchen with newer appliances, designer light fixtures, center island, maple wood cabinets and Corian counter tops. Upstairs offers upgraded carpeting with upgraded padding, a large master bedroom suite with two professionally designed California Closets, and two guest bedrooms. Two full bathrooms offer granite counter tops and distinctive designer touches. A wonderful wrap around back patio offers an uncommon degree of outdoor space. This unit is in a superb location as the complex is a few minutes stroll from South Lake, Paseo Colorado, and Old Town Pasadena with quick access onto the 134 and 210 freeways.",
    image_url: "https://ssl.cdn-redfin.com/photo/45/bigphoto/256/AR15182256_1_1.jpg",
    agent_id: Agent.first.id,
    status: "Sold",
    price: 749950
	})

OpenHouse.create ({
	listing_id: Listing.first.id,
	agent_id: Agent.first.id,
	date: "9/30/2015",
	start_time: "2:00 PM",
	end_time: "5:00 PM",
	notes: "Need to bring flyer stand"
	})


Prospect.create ({
	first_name: "Teddy",
    last_name: "Baker",
    phone: "(626) 470-9908",
    email: "tbaker24@gmail.com",
    open_house_id: OpenHouse.first.id,
    notes: "Looking for a 2 bed 2 bath in the middle of downtown",
    agent_id: Agent.first.id
	})

EventAgent.create ({
	event_id: Event.first.id,
	agent_id: Agent.first.id
	})

EventProspect.create ({
	event_id: Event.first.id,
	prospect_id: Prospect.first.id
	})