class FuckRuby < ActiveRecord::Migration
  def change
    add_reference(:events, :user_id, index: true)
  end
end
