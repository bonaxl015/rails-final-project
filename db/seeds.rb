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

Post.create(
  caption: 'Hello milky way galaxy',
  user_id: ordinary.id
)

Post.create(
  caption: 'Hello milky way galaxy 2',
  user_id: ordinary.id
)

Post.create(
  caption: 'Hello milky way galaxy 3',
  user_id: ordinary.id
)

event = Event.create(
  name: 'Sample Event',
  description: 'Sample Event Description',
  date: Time.zone.tomorrow,
  user_id: ordinary2.id
)

Attend.create(
  user_id: ordinary.id,
  event_id: event.id
)

Relationship.create(follower_id: ordinary2.id, followed_id: ordinary.id)
Relationship.create(follower_id: ordinary3.id, followed_id: ordinary.id)

User.find_each(&:save)
