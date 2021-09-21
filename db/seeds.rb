Attend.delete_all
Event.delete_all
Post.delete_all
Like.delete_all
UserRole.delete_all
User.delete_all
Role.delete_all

admin = User.create(  email: 'admin@example.com',
                      password: 'testtest',
                      password_confirmation: 'testtest',
                      username: 'adminpogi',
                      first_name: 'admin',
                      last_name: 'admin',
                      slug: 'adminpogi'
                    )

moderator = User.create(  email: 'moderator@example.com',
                          password: 'testtest',
                          password_confirmation: 'testtest',
                          username: 'moderator',
                          first_name: 'moderator',
                          last_name: 'moderator',
                          slug: 'moderator'
                        )

ordinary = User.create( email: 'bon@example.com',
                        password: 'testtest',
                        password_confirmation: 'testtest',
                        username: 'bonaxlpogi',
                        first_name: 'Bon Axl',
                        last_name: 'Feeser',
                        slug: 'bonaxlpogi'
)

ordinary2 = User.create( email: 'jane@example.com',
                         password: 'testtest',
                         password_confirmation: 'testtest',
                         username: 'janedoe',
                         first_name: 'Jane',
                         last_name: 'Doe',
                         slug: 'janedoe')

ordinary3 = User.create( email: 'juan@example.com',
                         password: 'testtest',
                         username: 'juandcruz',
                         first_name: 'Juan',
                         last_name: 'Dela Cruz',
                         slug: 'juandcruz')

admin_role = Role.create(role: 'Admin')
moderator_role = Role.create(role: 'Moderator')

UserRole.create( user_id: admin.id, role_id: admin_role.id )
UserRole.create( user_id: admin.id, role_id: moderator_role.id )
UserRole.create( user_id: moderator.id, role_id: moderator_role.id )

post = Post.create(
  caption: 'Hello milky way galaxy',
  image: nil,
  user_id: ordinary.id
)

Post.create(
  caption: 'Hello milky way galaxy 2',
  image: nil,
  user_id: ordinary.id
)

Post.create(
  caption: 'Hello milky way galaxy 3',
  image: nil,
  user_id: ordinary.id
)

Comment.create(
  content: 'Sample Comment',
  post_id: post.id,
  user_id: ordinary2.id
)

Like.create(
  user_id: ordinary3.id,
  post_id: post.id
)

event = Event.create(
  name: 'Jane Event',
  description: 'Jane Event Description',
  start_date: 10.years.from_now,
  end_date: 10.years.from_now.tomorrow,
  user_id: ordinary2.id
)

event2 = Event.new(
  name: 'Bon Event',
  description: 'Bon Event Description',
  start_date: Time.zone.now.yesterday,
  end_date: 2.hours.from_now.yesterday,
  user_id: ordinary.id
)

event3 = Event.new(
  name: 'Juan Sample Ongoing Event',
  description: 'Juan Event Description',
  start_date: 1.second.ago,
  end_date: 10.years.from_now,
  user_id: ordinary3.id
)

[event2, event3].each do |event|
  event.save(validate: false)
end

Attend.create(
  user_id: ordinary.id,
  event_id: event.id
)

Attend.create(
  user_id: ordinary3.id,
  event_id: event2.id
)

Relationship.create(follower_id: ordinary2.id, followed_id: ordinary.id)
Relationship.create(follower_id: ordinary3.id, followed_id: ordinary.id)

User.find_each(&:save)
