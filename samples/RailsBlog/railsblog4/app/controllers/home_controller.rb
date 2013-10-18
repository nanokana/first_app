class HomeController < ApplicationController

  def index
    @entries = Entry.find(:all, :order => "created_at DESC", :limit => 5)
  end

  def archive
    @entries = Entry.find(:all, :order => "created_at DESC")
  end
end
