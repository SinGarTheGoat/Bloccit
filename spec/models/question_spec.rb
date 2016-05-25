require 'rails_helper'
include RandomData
RSpec.describe Question, type: :model do
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

#
#
#       {Question.new(title:"New question title", body: "new question body",
#         resolved: false)}
#         it 'should respond to title' do
#             expect(question).to respond_to(:title)
#         end
#         it 'should respond body' do
#             expect(question).to respond_to(:body)
#         end
#         it 'should respond to resolved' do
#             expect(question).to respond_to(:resolved)
#         end
#     end
# end
