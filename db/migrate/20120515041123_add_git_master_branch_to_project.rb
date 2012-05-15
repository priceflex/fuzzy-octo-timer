class AddGitMasterBranchToProject < ActiveRecord::Migration
  def change
    add_column :projects, :git_master_branch, :string
  end
end
