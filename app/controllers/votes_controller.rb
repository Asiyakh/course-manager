class VotesController < ApplicationController

    def create 
        post_id = params[:post_id]
        vote = Vote.new
        vote.post_id = params[:post_id]
        vote.like = params[:like]
        vote.account_id = current_account.id

        existing_vote = Vote.where(account_id: current_account.id, post_id: post_id)

        respond_to do |format|
            format.js{

                if existing_vote.size > 0
                    existing_vote.first.destroy
                else
                    if vote.save 
                        @success = true
                    else 
                        @success = false
                    end                
 
                end

                @post = Post.find(post_id)
                @is_like = params[:like]
                render "votes/create"

            }
        end
    end

    private

    def vote_params
        params.require(:vote).permit(:like, :post_id)
    end
end