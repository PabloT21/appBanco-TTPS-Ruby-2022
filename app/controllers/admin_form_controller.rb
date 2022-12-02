class AdminFormController < ApplicationController
    user = User.new
    respond_to do |format|
        format.html { render :new, locals:{ user: user} }
      end

      


end
