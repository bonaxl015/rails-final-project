Post.delete_all
UserRole.delete_all
User.delete_all
Role.delete_all

admin = User.create(  email: 'admin@example.com',
                      password: 'testtest',
                      password_confirmation: 'testtest',
                      username: 'adminpogi',
                      first_name: 'admin',
                      last_name: 'admin'
                    )

moderator = User.create(  email: 'moderator@example.com',
                          password: 'testtest',
                          password_confirmation: 'testtest',
                          username: 'moderator',
                          first_name: 'moderator',
                          last_name: 'moderator'
                        )

ordinary = User.create( email: 'bon@example.com',
                        password: 'testtest',
                        password_confirmation: 'testtest',
                        username: 'bonaxlpogi',
                        first_name: 'Bon Axl',
                        last_name: 'Feeser'
)

ordinary2 = User.create( email: 'jane@example.com',
                         password: 'testtest',
                         password_confirmation: 'testtest',
                         username: 'janedoe',
                         first_name: 'Jane',
                         last_name: 'Doe')

admin_role = Role.create(role: 'Admin')
moderator_role = Role.create(role: 'Moderator')

UserRole.create( user_id: admin.id, role_id: admin_role.id )
UserRole.create( user_id: admin.id, role_id: moderator_role.id )
UserRole.create( user_id: moderator.id, role_id: moderator_role.id )

Post.create(
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
