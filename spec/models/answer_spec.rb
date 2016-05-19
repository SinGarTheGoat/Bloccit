require 'rails_helper'

RSpec.describe Answer, type: :model do
  let(:question) { Question.create! body: "New Question Body" }
  let (:answer) {Answer.create! body: "New Answer Body"}


  describe "attributes" do
    it "Answer has a body post" do
      expect(answer).to have_attributes(body: "New Answer Body")
    end

end
