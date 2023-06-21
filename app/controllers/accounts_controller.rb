class AccountsController < ApplicationController
    def show
        @account = Account.find(1)
    end
end
