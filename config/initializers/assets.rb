# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')

# Unused, Remove Later?
Rails.application.config.assets.precompile += %w[form_helper_functions.js]
Rails.application.config.assets.precompile += %w[pickadate/form_datepicker.js]
Rails.application.config.assets.precompile += %w[user_form_helper_functions.js]
Rails.application.config.assets.precompile += %w[common_form_helper_functions.js]

# Precompile landing page assets
Rails.application.config.assets.precompile += %w[landing_page/bootstrap.min.css landing_page/overwrite.css landing_page/stylesheet.css landing_page/icons.css landing_page/jssor-slider.css landing_page/jwgslider.css landing_page/prettyPhoto.css landing_page/owl.carousel.css landing_page/owl.theme.css landing_page/owl.transitions.css landing_page/masonry.css landing_page/style.css landing_page/default.css]
Rails.application.config.assets.precompile += %w[landing_page/*]
Rails.application.config.assets.precompile += %w[delivery_address_modal.js]
# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( admin.js admin.css )
