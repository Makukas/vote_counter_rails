class VotesController < ApplicationController

    def new
        @vote = Vote.new
    end

    def create
        @vote = Vote.new(vote_params)
        @vote.save
        redirect_to '/new'
    end

    def vote
        @randomNumber = Vote.getRandomQuestion()
        @votes = Vote.where(:id => @randomNumber)
    end

    private

  def vote_params
      params.require(:vote).permit(:question, :answer1, :answer2)
    end

end
