class ChangeColumnDefault < ActiveRecord::Migration[6.1]
  def change
    change_column_default :customers, :is_deleted, default: true
  end
end
