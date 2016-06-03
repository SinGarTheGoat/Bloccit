FactoryGirl.define do
  factory :labels do
    name RandomData.random_sentence
    # do I need to associeate my lable with a user & topic?
    # and if so how
    topic
    user
  end
end
