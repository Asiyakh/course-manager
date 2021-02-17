class SubscriptionsController < ApplicationController

    def create
        @subscription = Subscription.new(subscription_params)
        @subscription.account_id = current_account.id
        @subscription.save
        redirect_to course_path(@subscription.course_id)
    end

    def subscription_params
        params.require(:subscription).permit(:course_id)
    end
end
