require "rails_helper"

RSpec.describe GambisController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/gambis").to route_to("gambis#index")
    end

    it "routes to #show" do
      expect(get: "/gambis/1").to route_to("gambis#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/gambis").to route_to("gambis#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/gambis/1").to route_to("gambis#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/gambis/1").to route_to("gambis#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/gambis/1").to route_to("gambis#destroy", id: "1")
    end
  end
end
