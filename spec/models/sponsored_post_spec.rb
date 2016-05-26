require 'rails_helper'

RSpec.describe SponsoredPost, type: :model do
  let(:title) {RandomData.random_sentence}
  let(:body) {RandomData.random_paragraph}
  let(:price) {RandomData.random_num}
  #let(:sponsoredpost) {Sponsoredpost.create!(title: title, body: body, price: price)}
  let(:topic) {Topic.create!(name: name, description: description)}
  let(:SponsoredPost) {topic.sponsored_post.create!(title: title, body: body, price: price)}

  it {is_expected.to belong_to(:topic)}
  describe "attributes" do
    it "has title, body, price attrabutes" do
      expect(sponsored_post).to have_attributes(title: title, body: body, price: price)
    end
  end


end
