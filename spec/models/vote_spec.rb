require 'rails_helper'

RSpec.describe Vote, :type => :model do
    it "is not valid without a question" do
        vote = Vote.create(question: nil)
        expect(vote).not_to be_valid
        expect(vote.errors.messages[:question]).to eq ["can't be blank"]
    end

    it "is not valid without an answer1" do
        vote = Vote.create(answer1: nil)
        expect(vote).not_to be_valid
        expect(vote.errors.messages[:answer1]).to eq ["can't be blank"]
    end

    it "is not valid without an answer2" do
        vote = Vote.create(answer2: nil)
        expect(vote).not_to be_valid
        expect(vote.errors.messages[:answer2]).to eq ["can't be blank"]
    end

    it "is not valid if question length is more than 255 characters" do
        vote = Vote.create(:answer1 => "1", :answer2 => "1", :question => "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
        expect(vote).not_to be_valid
    end

    it "is not valid if answer1 length is more than 255" do
        vote = Vote.create(:answer2 => "1", :question => "1", :answer1 => "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
        expect(vote).not_to be_valid
    end

    it "is not valid if answer2 length is more than 255" do
        vote = Vote.create(:answer1 => "1", :question => "1", :answer2 => "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
        expect(vote).not_to be_valid
    end
end