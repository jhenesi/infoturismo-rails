class GenerateData < ActiveRecord::Migration
  def up
  	Rake::Task['db:data:load'].invoke
  end
end
