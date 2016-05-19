require 'rails_helper'

RSpec.describe Question, type: :model do
  let(:question) { Question.create! title: "New Question Title", body: "New Question Body", resolved:false }#had resolved:false

  describe "attributes" do
    it "it has a title body and a booleian attributes" do
    expect(question).to have_attributes(title: "New Question Title", body: "New Question Body", resolved:false )
  end
  end





end
