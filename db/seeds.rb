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
Post.find_or_create_by(
    title: 'Yaaaaa Im some random title',
    body: 'Yaaaaa Im some random body'

)
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

Comment.find_or_create_by(
  body: 'Yaaaaa Im some random body'
)
puts 'Seed finished'
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
