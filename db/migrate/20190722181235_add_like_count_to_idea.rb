class AddLikeCountToIdea < ActiveRecord::Migration[5.2]
  def change
    add_column :ideas, :like_count, :string
  end
end
