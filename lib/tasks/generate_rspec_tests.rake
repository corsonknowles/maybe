namespace :generate_rspec do
  desc "Generate RSpec tests for all models"
  task models: :environment do
    Rails.application.eager_load! # Load all models

    ApplicationRecord.descendants.each do |model|
      model_name = model.name.underscore
      puts "Generating RSpec for model: #{model_name}"
      system("rails generate rspec:model #{model_name}")
    end
  end

  desc "Generate RSpec tests for all controllers"
  task controllers: :environment do
    Dir.glob(Rails.root.join("app", "controllers", "**", "*_controller.rb")).each do |file|
      controller_name = File.basename(file, ".rb")
      puts "Generating RSpec for controller: #{controller_name}"
      system("rails generate rspec:controller #{controller_name}")
    end
  end

  desc "Generate RSpec tests for both models and controllers"
  task all: [ :models, :controllers ]
end
