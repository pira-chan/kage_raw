desc "This task is called by the Heroku scheduler add-on"
task :sitemaprefresh => :environment do
  heroku run rake sitemap:refresh
  
end