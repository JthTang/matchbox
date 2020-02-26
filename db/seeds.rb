# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
puts 'Destroying Seeds'
Booking.destroy_all
WorkHistory.destroy_all
Skill.destroy_all
User.destroy_all

puts "Creating seeds"

PROVIDERS = []
BOOKERS = []
PSKILLS = []

START_TIME = Faker::Time.between(from: DateTime.now - 1, to: DateTime.now)

yann = User.create!(
  email: "yann@gmail.com",
  password: "123123",
  first_name: "Yann",
  second_name: "Klein",
  city: "Tokyo",
  bio: "Curiosity, creativity and people empowerment are the 3 things I value the most.
I combined them to develop embedded systems in Asia, to lead software projects and innovation for a global company and to develop a VR startup in Canada.
I use the best of these values today to help people reach their dream future at Le Wagon Kyoto."
)

css = Skill.create!(
  name: "CSS",
  description: "Cool for that",
  user: yann
)

java = Skill.create!(
  name: "Java Script",
  description: "1. Select a element, 2. Listen to an event, 3. change DOM",
  user: yann
)

WorkHistory.create!(
    company_name: "Le wagon",
    description: "the driver for part-time bootcamp.",
    start_date: Date.today,
    end_date: Date.today + rand(100..10000),
    job_title: "Driver",
    user: yann
)

doug = User.create!(
  email: "doug@gmail.com",
  password: "123123",
  first_name: "Douglas",
  second_name: "Berkley",
  city: "Tokyo",
  bio: "A web developer and director at Le Wagon Japan"
)

ruby = Skill.create!(
  name: "Ruby",
  description: "Flash card is super important",
  user: doug
)

WorkHistory.create!(
  company_name: "Le wagon",
  description: "A web developer and director at Le Wagon Japan",
  start_date: Date.today,
  end_date: Date.today + rand(100..10000),
  job_title: "Driver",
  user: doug
)

Booking.create!(
  date: Date.today - rand(1..10),
  start_time: START_TIME,
  end_time: START_TIME + rand(1..2).hours,
  status: ['accepted', 'rejected', 'pending'].sample,
  skill: ruby,
  user: yann,
  user_comment: Faker::TvShows::Simpsons.quote,
  provider_comment: Faker::TvShows::Simpsons.quote
)

Booking.create!(
  date: Date.today - rand(1..10),
  start_time: START_TIME,
  end_time: START_TIME + rand(1..2).hours,
  status: ['accepted', 'rejected', 'pending'].sample,
  skill: css,
  user: doug,
  user_comment: Faker::TvShows::Simpsons.quote,
  provider_comment: Faker::TvShows::Simpsons.quote
)




3.times do
  user = User.create!(
    email: Faker::Internet.email,
    password: "123123",
    first_name: Faker::Name.first_name,
    second_name: Faker::Name.last_name,
    city: Faker::Address.city,
    bio: Faker::Hipster.paragraphs
    )
  PROVIDERS << user


  skill = Skill.create!(
    name: Faker::Educator.degree,
    description: Faker::TvShows::TheFreshPrinceOfBelAir.quote,
    user: user
    )
  PSKILLS << skill

  WorkHistory.create!(
    company_name: Faker::Company.name,
    description: Faker::Movies::HarryPotter.quote,
    start_date: Date.today,
    end_date: Date.today + rand(100..10000),
    job_title: Faker::Job.title,
    user: user
    )
end

3.times do
  user = User.create!(
    email: Faker::Internet.email,
    password: "123123",
    first_name: Faker::Name.first_name,
    second_name: Faker::Name.last_name,
    city: Faker::Address.city,
    bio: Faker::Hipster.paragraphs
    )
  BOOKERS << user


  Skill.create!(
    name: Faker::Educator.degree,
    description: Faker::TvShows::TheFreshPrinceOfBelAir.quote,
    user: user
    )

  WorkHistory.create!(
    company_name: Faker::Company.name,
    description: Faker::Movies::HarryPotter.quote,
    start_date: Date.today,
    end_date: Date.today + rand(100..10000),
    job_title: Faker::Job.title,
    user: user
    )
end

3.times do
  Booking.create!(
    date: Date.today - rand(1..10),
    start_time: START_TIME,
    end_time: START_TIME + rand(1..2).hours,
    status: ['accepted', 'rejected', 'pending'].sample,
    skill: PSKILLS.sample,
    user: BOOKERS.sample,
    user_comment: Faker::TvShows::Simpsons.quote,
    provider_comment: Faker::TvShows::Simpsons.quote
    )
  end

puts 'finished'


