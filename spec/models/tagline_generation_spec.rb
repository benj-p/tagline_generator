require 'rails_helper'

RSpec.describe TaglineGeneration, type: :model do
  it "has a valid factory" do
    expect(FactoryBot.build(:tagline_generation)).to be_valid
  end

  it "is valid with a parameters and response" do
    expect(FactoryBot.build(:tagline_generation)).to be_valid
  end
  
  it "is invalid without a parameters" do
    tagline_generation = FactoryBot.build(:tagline_generation, parameters: nil)
    tagline_generation.valid?
    expect(tagline_generation.errors[:parameters]).to include("can't be blank")
  end

  it "is invalid if parameters is not a hash" do
    tagline_generation = FactoryBot.build(:tagline_generation, parameters: "Test parameters")
    tagline_generation.valid?
    expect(tagline_generation.errors[:parameters]).to include("must be a hash")
  end

  it "is invalid without a response" do
    tagline_generation = FactoryBot.build(:tagline_generation, response: nil)
    tagline_generation.valid?
    expect(tagline_generation.errors[:response]).to include("can't be blank")
  end

  it "is invalid if response is not a hash" do
    tagline_generation = FactoryBot.build(:tagline_generation, response: "Test response")
    tagline_generation.valid?
    expect(tagline_generation.errors[:response]).to include("must be a hash")
  end

  it "returns the input text" do
    expect(FactoryBot.build(:tagline_generation).input_text).to eq("Write a tagline for ice cream shop")
  end
end
