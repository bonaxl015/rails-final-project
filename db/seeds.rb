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

admin_role = Role.create(role: 'Admin')
moderator_role = Role.create(role: 'Moderator')

UserRole.create( user_id: admin.id, role_id: admin_role.id )
UserRole.create( user_id: admin.id, role_id: moderator_role.id )
UserRole.create( user_id: moderator.id, role_id: moderator_role.id )

Post.create(
  caption: 'Hello milky way galaxy',
  image: '',
  user_id: ordinary.id
)

Post.create(
  caption: 'Hello milky way galaxy 2',
  image: '',
  user_id: ordinary.id
)

Post.create(
  caption: 'Hello milky way galaxy 3',
  image: '',
  user_id: ordinary.id
)