require Rails.root.join("lib/seeder")

seeder = Seeder.new

SEEDS_MULTIPLIER = [1, 5].max


################################Users################################
num_users = 2 * SEEDS_MULTIPLIER

users_in_random_order = seeder.create_if_none(User, num_users) do
    roles = %i[teacher student]

    num_users.times do |i|
        fname = Faker::Name.unique.first_name
        # Including "\\:/" to help with identifying local issues with
        # character escaping.
        lname = Faker::Name.unique.last_name
        name = [fname, "\"The #{fname}\"", lname, " \\:/"].join(" ")
        username = "#{fname} #{lname}"
        
        user = User.create!(
            email: Faker::Internet.email(
                name: Faker::Name.unique.first_name, separators: "+", domain: Faker::Internet.domain_word.first(20),
            ),
            password: "password",
            password_confirmation: "password",
            name: name,
            username: username
        )

        if i.zero?
            next
        elsif i == num_users - 1
            next # guarantee at least one user with no role
        else
            role_index = rand(0..roles.length)
            user.add_role(roles[role_index]) if role_index != roles.length # increases chance of more no-role users
        end
      
    end
end

seeder.create_if_doesnt_exist(User, "email", "admin@local.local") do
    user = User.create!(
      email: "admin@local.local",
      password: "password",
      password_confirmation: "password",
    )
  
    user.add_role(:admin)
  end