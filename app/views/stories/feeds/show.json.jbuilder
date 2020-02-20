article_attributes_to_include = %i[
  title path id user_id comments_count positive_reactions_count organization_id
  reading_time video_thumbnail_url video video_duration_in_minutes language
  experience_level_rating experience_level_rating_distribution main_image
]
article_methods_to_include = %i[
  readable_publish_date flare_tag class_name
  cloudinary_video_url video_duration_in_minutes published_at_int
  published_timestamp
]

json.array!(@stories) do |article|
  json.extract! article, *article_attributes_to_include
  json.user article.cached_user.as_json["table"]
  json.organization article.cached_organization.as_json["table"]
  json.tag_list article.cached_tag_list_array
  json.extract! article, *article_methods_to_include
end