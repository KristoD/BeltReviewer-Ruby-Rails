class IFuckingHateRuby < ActiveRecord::Migration
  def change
    add_reference(:events, :user, index: true)
  end
end
