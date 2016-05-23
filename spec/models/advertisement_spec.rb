require 'rails_helper'

RSpec.describe Advertisement, type: :model do
    let(:advertisement) { Advertisement.create! }
    describe 'attrabutes' do
        it 'responds to title' do
            expect(:advertisement).to respond_to(:title)
        end
        it 'responds to copy' do
            expect(:advertisement).to respond_to(:copy)
        end
        it 'responds to price' do
            expect(:advertisement).to respond_to(:price)
        end
    end
end
