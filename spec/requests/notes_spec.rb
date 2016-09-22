require 'rails_helper'

RSpec.describe "Notes", type: :request do
  describe "GET /api/v1/notes" do
    it "gets all notes for current user" do
      get '/api/v1/notes'
      expect(response).to have_http_status(200)
    end
  end
end
