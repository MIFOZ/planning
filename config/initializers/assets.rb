# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# %w( plans, tasks).each do |controller|
#   Rails.application.config.assets.precompile += ["#{controller}.js", "#{controller}.css"]
# end  

%w(plans tasks).each do |controller|
  Rails.application.config.assets.precompile += ["#{controller}.js"]
end


Rails.application.config.assets.precompile += %w( ganttUtilities.js  ganttTask.js ganttDrawer.js ganttDrawerSVG.js ganttGridEditor.js ganttMaster.js gantt/gantt.css)
Rails.application.config.assets.precompile += %w( platform.js gantt/platform.css )
Rails.application.config.assets.precompile += %w( jquery.svg.css )
Rails.application.config.assets.precompile += %w( jquery.JST.js )
Rails.application.config.assets.precompile += %w( date.js )
Rails.application.config.assets.precompile += %w( i18nJs.js )
Rails.application.config.assets.precompile += %w( dateField/jquery.dateField.js dateField/jquery.dateField.css )
Rails.application.config.assets.precompile += %w( jquery.livequery.min.js )
Rails.application.config.assets.precompile += %w( jquery.timers.js )

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
