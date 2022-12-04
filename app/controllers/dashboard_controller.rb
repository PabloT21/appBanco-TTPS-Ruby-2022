class DashboardController < ApplicationController

def index 
end

def main
end

def profile
end

def indexUsers
    @users = User.where(rol: ["usuario"])
end

end
