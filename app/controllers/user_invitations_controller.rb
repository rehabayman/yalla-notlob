class UserInvitationsController < ApplicationController
    
    def update
        @invitation = UserInvitedToOrder.find(params[:invitation])
        @notice = ''

        if params[:user_action] == 'accept'
            @invitation.status = 'accepted'
            @notice = 'You Accepted the Invitation'
            UserJoinOrder.create order_id: @invitation.order_id, user_id: @invitation.guest_id
        else
            @invitation.status = 'rejected'
            @notice = 'You Rejected the Invitation'
        end
        @invitation.save
        respond_to do |format|
            format.html { redirect_to notifications_path, notice: @notice, invitation_status: @invitation.status }
        end
    end
end