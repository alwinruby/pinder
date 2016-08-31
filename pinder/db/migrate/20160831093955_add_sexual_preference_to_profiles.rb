class AddSexualPreferenceToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :sexual_preference, :string
  end
end
