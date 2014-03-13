require 'spec_helper'

describe ApiController do
  let!(:user) { FactoryGirl.build :user }

  describe "POST /api/register" do
    context "Given correct details" do
      it "creates a user" do
        expect do
          post(:register, { email: user.email,
                            password: user.password })
        end.to change(User, :count).by(1)
      end

      it "returns a success message" do
        post(:register, { email: user.email,
                          password: user.password })

        parsed_json = JSON(response.body)
        expect(parsed_json["status"]).to eq(200)
      end

      it "returns access token" do
        post(:register, { email: user.email,
                          password: user.password })

        parsed_json = JSON(response.body)
        expect(parsed_json["access_token"]).to be_an_instance_of String
      end
    end

    context "Given incorrect details" do
      it "does not create a user" do
        expect do
          post(:register, { email: nil,
                            password: user.password })
        end.to change(User, :count).by(0)
      end

      it "returns a error message" do
        post(:register, { email: nil,
                          password: user.password })

        parsed_json = JSON(response.body)
        expect(parsed_json["status"]).to eq(403)
      end
    end

    context "Given the user is created already" do
      before :each do
        user.save
      end

      it "returns an error message" do
        post(:register, { email: user.email,
                          password: user.password })

        parsed_json = JSON(response.body)
        expect(parsed_json["status"]).to eq(403)
      end
    end
  end

  describe "POST /api/login" do
    before :each do
      user.save
    end

    context "Give correct details" do
      it "returns a success message" do
        post(:login, { email: user.email,
                          password: user.password })

        parsed_json = JSON(response.body)
        expect(parsed_json["status"]).to eq(200)
      end

      it "returns access token"
    end

    context "Given incorrect details" do
      it "returns an error message"
    end

    context "Given the user is already logged in" do
      it "returns an error message"
    end
  end
end
