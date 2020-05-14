
	def show
		@collection = CollectionList.find(params(:id)) 
	end

	def create
		collection = CollectionList.new(collection_list_params)
		if collection.save
			true
		else
			false
		end
	end


	def destroy
		collection = CollectionList.where( user_id: current_user.id).find(params(:id))
		if collection.nil?
			false
		else
			collection.destroy
			true
		end
	end

	def update
		collection = CollectionList.update(collection_list_params)
		if collection.save
			true
		else
			false
		end
	end

	private

	def collection_list_params
		params.permit(
			:name
		).merge(user_id: current_user.id)
	end

			





	# CollectionListArticles

	def create
		collection = CollectionList.find(params(:id))
		article = Article.find(params(:article_id))
		collection.articles << article
		collection.save
	end

	def destroy
		collection = CollectionList.find(params(:id))
		article = Article.find(params(:article_id))
		collection.articles.delete(article)	
		collection.save
	end
