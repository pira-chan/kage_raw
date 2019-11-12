SitemapGenerator::Sitemap.default_host = "https://www.kage-raw.com/"
# SitemapGenerator::Sitemap.sitemaps_host = "https://s3-ap-northeast-1.amazonaws.com/#{ENV['S3_BUCKET_NAME']}"
SitemapGenerator::Sitemap.sitemaps_host = "https://s3-ap-northeast-1.amazonaws.com/#{ENV['S3_BUCKET_NAME']}/sitemaps"
SitemapGenerator::Sitemap.sitemaps_path = "sitemaps"
SitemapGenerator::Sitemap.adapter = SitemapGenerator::AwsSdkAdapter.new(
  'kage-raw',
  aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],
  aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
  aws_region: 'ap-northeast-1'
)


# SitemapGenerator::Sitemap.default_host = 'https://39ce892b3d9b469f866285455fa206f4.vfs.cloud9.ap-southeast-1.amazonaws.com/' # ホスト名
# SitemapGenerator::Sitemap.sitemaps_path = 'sitemaps/' # 保存先（この場合 /public/sitemaps/以下になる）


SitemapGenerator::Sitemap.create do
  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host
  #
  # Examples:
  #
  # Add '/articles'
  #
  #   add articles_path, :priority => 0.7, :changefreq => 'daily'
  #
  # Add all articles:
  #
  #   Article.find_each do |article|
  #     add article_path(article), :lastmod => article.updated_at
  #   end
  
  Item.find_each do |item|
    add items_path(item), :lastmod => item.created_at
    # items? それとも　item?
  end
  

  

  
end
