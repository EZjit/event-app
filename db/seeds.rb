if Rails.env.development?
  Attend.delete_all
  Event.delete_all
  User.delete_all
end

#creating users
(1..10).each do |i|
  user = User.new
  user.email = "user#{i}@gmail.com"
  user.password = "pwd#{i}"
  user.password_confirmation = "pwd#{i}"
  user.save
end

# creating events
(1..100).each do |i|
  user = User.all.sample
  event_type = [true, false].sample
  flag = event_type ? 'OPEN' : 'PRIVATE'
  title = "Event number #{i}. #{flag}"
  description = "Some description, bla-bla-bla, #{i}"
  location = 'Minsk'
  event_date = (-100..100).to_a.sample.days.from_now
  Event.create(user_id: user.id,
               title: title,
               description: description,
               location: location,
               event_date: event_date,
               event_type: event_type)
end

#attending_events
Event.all.each do |event|
  5.times do
    user = User.all.sample
    Attend.create(attendee_id: user.id, event_id: event.id) unless user == event.creator
  end
end