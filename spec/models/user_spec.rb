require 'spec_helper'

describe User do
  let!(:user) { FactoryGirl.create(:user) }

  describe "callbacks" do
    describe "#create_access_token" do
      it "returns a string" do
        expect(user.access_token).to be_an_instance_of String
      end
    end
  end
end
