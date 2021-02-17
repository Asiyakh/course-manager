module VotesHelper
    def is_liked post
        account_signed_in? && current_account.liked_post_ids.include?(post.id) ? " active" : ""
    end

    def is_disliked post
        account_signed_in? && current_account.disliked_post_ids.include?(post.id) ? " active" : ""
    end
end