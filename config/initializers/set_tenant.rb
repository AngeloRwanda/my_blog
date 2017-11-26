# Warden::Manager.after_set_user except: :fetch do |user, auth, opts|
#   #your custom code

#   redirect_to landing_path(:subdomain => current_user.subdomain)
# end