require_relative "spec_helper"
require_relative "../mooc_material_builder.rb"

def app
  MoocMaterialBuilder
end

describe MoocMaterialBuilder do
  it "responds with a welcome message" do
    get '/'

    last_response.body.must_include 'Welcome to the Sinatra Template!'
  end
end
