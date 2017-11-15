
User.create!(
	name: 'Sebastian Valdez',
	phone: '4152994331',
	email: 'seb@test.com',
	password: 'asdfasdf',
	password_confirmation: 'asdfasdf',
	role: 'admin'
)
puts "admin created!\n"

User.create!(
	name: 'Allegra',
	phone: '4152994331',
	email: 'beebee@test.com',
	password: 'asdfasdf',
	password_confirmation: 'asdfasdf',
	role: 'editor'
)
puts "Editor created!\n"

User.create!(
	name: 'Joe Shmoe',
	phone: '5552224343',
	email: 'user@test.com',
	password: 'asdfasdf',
	password_confirmation: 'asdfasdf'
)

puts "user created"


# create blogs for test
20.times do |blog|
	Blog.create!(
		title: "Blog_title_#{blog}",
		content: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nihil eveniet nobis quibusdam eos beatae voluptates dignissimos iusto, voluptatem soluta magnam velit adipisci nostrum. Dolorem tempore laborum sapiente eos porro quae!'
	)
end

puts 'Created 20 blogs!'