# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "https://malt-mate.jp/"

SitemapGenerator::Sitemap.create do
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host

  add root_path, priority: 1.0, changefreq: 'daily'
  add whiskeys_path, priority: 0.7, changefreq: 'daily'
  Whiskey.find_each do |whiskey|
    add whiskey_path(whiskey), lastmod: whiskey.updated_at
  end
  add drink_ways_path, changefreq: 'daily'
  add snacks_path, changefreq: 'daily'
  add flavors_path, changefreq: 'daily'
  
end
