require 'rails_helper'

RSpec.describe "ScheduleComments", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/schedule_comments/index"
      expect(response).to have_http_status(:success)
    end
  end

end
