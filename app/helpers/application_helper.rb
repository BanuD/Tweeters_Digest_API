module ApplicationHelper

  def current_user
    User.find_by(id: params[:user_id])# !!!!! should be the devise token.
  end

end
