host "nucleus.com.ua"

sitemap :site do
  url root_url, last_mod: Time.now, change_freq: "daily", priority: 1.0
  url sitemap_html_url, last_mod: Time.now, change_freq: "daily", priority: 1.0
  url privacy_policy_url, last_mod: Time.now, change_freq: "daily", priority: 1.0
  url terms_of_use_url, last_mod: Time.now, change_freq: "daily", priority: 1.0
  url about_us_url, last_mod: Time.now, change_freq: "daily", priority: 1.0
  url contacts_url, last_mod: Time.now, change_freq: "daily", priority: 1.0
  url faqs_url, last_mod: Time.now, change_freq: "daily", priority: 1.0
  url reviews_url, last_mod: Time.now, change_freq: "daily", priority: 1.0
  Review.all.each do |review|
  	url review_url(review), last_mod: review.updated_at, priority: 1.0
  end
  Post.all.each do |post|
  	url show_post_url(post), last_mod: post.updated_at, priority: 1.0
  end
  Category.all.each do |category|
    url show_category_url(category), last_mod: category.updated_at, priority: 1.0
    category.pod_categories.each do |pod_category|
	    url show_pod_category_url(:category_id => category, :id => pod_category), last_mod: pod_category.updated_at, priority: 1.0
   	  pod_category.products.each do |product|
	      url show_product_url(:category_id => category, :pod_category_id => pod_category, :id => product), last_mod: product.updated_at, priority: 1.0
	    end
	  end
  end
  
end

ping_with "https://#{host}/sitemap.xml"