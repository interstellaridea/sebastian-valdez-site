class AddStateToTrait < ActiveRecord::Migration[5.1]
  def change
    add_column :traits, :state, :integer, default: 0
  end
end
