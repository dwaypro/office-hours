# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# user = User.new
# user.email = "a@email.com"
# user.password = "valid_password"
# user.password_confirmation = "valid_password"
# user.save!

user = User.find_or_initialize_by(email: 'a@email.com')
user.password = user.password_confirmation = 'valid_password' && user.save! unless user.persisted?


# project = Project.find_or_initialize_by(title: "Proposal Title", description: "This is a sample description")
# unless project.persisted?
#   project.subject = 1
#   project.staff = user
#   project.save!
# end

update = Update.find_or_initialize_by(user: user, project: project, title: "First update", description: "Made my first update")
unless update.persisted?
  update.status = 1
  update.save!
end


student = User.find_or_initialize_by(email: "jerry@gmail.com", username: "jarypie", phone: 222-222-2222)
student.password = "password" and student.password_confirmation = 'password' and student.save! unless student.persisted?

staff = User.find_or_initialize_by(email: "staff@staff.com", username: "staff", phone: 333-333-3333, admin: true)
staff.password = "password" and staff.password_confirmation = 'password' and staff.save! unless staff.persisted?

project = Project.create(title: "Marine layer project",description: "study of marine micro-organism above and below the marine layer", subject: 2, staff: staff, student: student)

