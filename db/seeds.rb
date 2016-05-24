require 'random_data'

# Create Posts
50.times do
# #1
  Post.create!(
# #2
    title:  RandomData.random_sentence,
    body:   RandomData.random_paragraph
  )
end
posts = Post.all

# Create Comments
# #3
100.times do
  Comment.create!(
# #4
    post: posts.sample,
    body: RandomData.random_paragraph
  )
end

puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
puts "#{Advertisement.count} Advertisements created"

50.times do
  Advertisement.create!(
  title: RandomData.random_sentence,
  copy:  RandomData.random_paragraph,
  price: 3.50 #I need about 3.50
  )
end

puts "advertisement seed finished"
puts "#{Advertisement.count} Advertisements created"
