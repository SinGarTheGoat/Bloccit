require 'rails_helper'

RSpec.describe Api::V1::TopicsController, type: :controller do
  let(:my_user) { create(:user) }
  let(:my_post) { create(:post) }

  context "unauthenticated user" do

       it "PUT update returns http unauthenticated" do
        put :update, id: my_post.id, post: {name: "Post Name", description: "Post Description"}
        expect(response).to have_http_status(401)
      end
      it "POST create returns http unauthenticated" do
        post :create, post: {name: "Post Name", description: "Post Description"}
        expect(response).to have_http_status(401)
      end

      it "DELETE destroy returns http unauthenticated" do
        delete :destroy, id: my_post.id
        expect(response).to have_http_status(401)
      end



     end

  context "unauthorized user" do
    before do
      controller.request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Token.encode_credentials(my_user.auth_token)
    end
    it "PUT update returns http unauthenticated" do
     put :update, id: my_post.id, post: {name: "Post Name", description: "Post Description"}
     expect(response).to have_http_status(401)
   end
   it "POST create returns http unauthenticated" do
     post :create, post: {name: "Post Name", description: "Post Description"}
     expect(response).to have_http_status(401)
   end

   it "DELETE destroy returns http unauthenticated" do
     delete :destroy, id: my_post.id
     expect(response).to have_http_status(401)
   end


  end


  context "authenticated and authorized users" do
    before do
      my_user.admin!
      controller.request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Token.encode_credentials(my_user.auth_token)
      @new_topic = build(:topic)
    end

    it "PUT update returns http unauthenticated" do
     put :update, id: my_post.id, post: {name: "Post Name", description: "Post Description"}
     expect(response).to have_http_status(401)
   end
   it "POST create returns http unauthenticated" do
     post :create, post: {name: "Post Name", description: "Post Description"}
     expect(response).to have_http_status(401)
   end

   it "DELETE destroy returns http unauthenticated" do
     delete :destroy, id: my_post.id
     expect(response).to have_http_status(401)
   end

  end

  end
