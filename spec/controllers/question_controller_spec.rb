require 'rails_helper'
include RandomData
RSpec.describe QuestionController, type: :controller do
    # let (:question) { Question.create! }
    let(:my_question) do
        Question.create(
            id: 1,
            title: RandomData.random_sentence,
            body: RandomData.random_paragraph,
            resolved: false
        )
    end
    describe 'get #index' do
        it 'returns http success' do
            get :index
            expect(response).to have_http_status(:success)
        end
        it 'assignes my_question to @question' do
            get :index
            expect(assigns(:questions)).to eq([my_question])
        end
    end
end


# require 'rails_helper'
#
# RSpec.describe QuestionController, type: :controller do
#
  #
  # describe "GET #index" do
  #   it "returns http success" do
  #     get :index
  #     expect(response).to have_http_status(:success)
  #   end
  # end
  #
  # describe "GET #show" do
  #   it "returns http success" do
  #     get :show
  #     expect(response).to have_http_status(:success)
  #   end
  # end
  #
  # describe "GET #new" do
  #   it "returns http success" do
  #     get :new
  #     expect(response).to have_http_status(:success)
  #   end
  # end
  #
  # describe "GET #create" do
  #   it "returns http success" do
  #     get :create
  #     expect(response).to have_http_status(:success)
  #   end
  # end

#end
