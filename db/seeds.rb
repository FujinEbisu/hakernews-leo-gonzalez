require 'rest-client'
require "json"

puts "Deleting all posts..."
Post.destroy_all
Comment.destroy_all
puts "Seeding posts..."

response = RestClient.get 'https://hacker-news.firebaseio.com/v0/topstories.json'
@posts = JSON.parse(response)

@posts.first(10).each do |id|
  post_response = RestClient.get "https://hacker-news.firebaseio.com/v0/item/#{id}.json"
  post_data = JSON.parse(post_response)
  
  Post.create!(
    title: post_data['title'],
    url: post_data['url'],
    text: post_data['text'],
    vote: post_data['score'] || 0,
    by: post_data['by'],
    type_story: post_data['type']
  )
end
