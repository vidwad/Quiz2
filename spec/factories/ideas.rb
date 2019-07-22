FactoryBot.define do
  factory :idea do

    title { Faker::Job.title }
    body { Faker::Job.field }

    
    

    association(:user, factory: :user)
    


    
  end
end
