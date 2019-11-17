desc "This task is called by the Heroku scheduler add-on"
task :sitemap_refresh => :environment do
  heroku run rake sitemap:refresh
end