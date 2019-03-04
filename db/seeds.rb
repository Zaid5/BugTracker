User.create!(
	email: "admin@admin.com",
	password: "zaid",
	password_confirmation: "zaid",
	role: 2
)

puts "1 Admin user created"

User.create!(
	email: "dev@dev.com",
	password: "zaid",
	password_confirmation: "zaid",
	role: 1
)

puts "1 dev user created"

User.create!(
	email: "pm@pm.com",
	password: "zaid",
	password_confirmation: "zaid",
	role: 0
)

puts "1 pm user created"

10.times do |bug|
	Bug.create!(
		title: " Bug Post #{bug}",
		description: "A software bug is an error, flaw, failure or fault in a computer program or system that causes it to produce an incorrect or unexpected result, or to behave in unintended ways. The process of finding and fixing bugs is termed ""debugging"" and often uses formal techniques or tools to pinpoint bugs.",
		user_id: 1
		)
end

puts "10 bugs created"