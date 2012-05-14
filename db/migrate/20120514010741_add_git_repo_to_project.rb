class AddGitRepoToProject < ActiveRecord::Migration
  def change
    add_column :projects, :git_repo, :string
  end
end
