module ApplicationCable
  class Connection < ActionCable::Connection::Base
    # identified_by :current_member
    #
    # def connect
    #   self.current_member = find_verified_member
    #   # self.current_user = find_verified_member
    #   logger.add_tags 'AcctionCable', current_member.email
    # end
    #
    # private
    # def find_verified_member
    #   cookies_signed = cookies.signed
    #   admin_user_id = cookies_signed['admin_user.id']
    #   if admin_user_id
    #     AdminUser.find(admin_user_id)
    #   else
    #     User.find(cookies_signed['user.id'])
    #   end
    # end
  end
end
