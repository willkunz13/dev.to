module Internal
  class EventsController < ApplicationController
    layout "internal"
    def index
      @events = Event.order("starts_at ASC")
    end

    def new
      @event = Event.new(
        location_name: "dev.to/live",
        location_url: "https://dev.to",
        description_markdown: "*Description* *Pre-requisites:* *Bio*"
      )
    end

    def create
      @event = Event.new(event_params)
      if @event.save!
        redirect_to(action: :index)
      else
        flash[:danger] = @event.errors.full_messages
        render "new.html.erb"
      end
    end

    def update
      @event = Event.find(params[:id])
      if @event.update(event_params)
        CacheBuster.new.bust "/live_articles"
        flash[:success] = "#{@event.title} was successfully updated"
        redirect_to "/internal/events"
      else
        flash[:danger] = @event.errors.full_messages
        @events = Event.order("starts_at ASC")
        render "index.html.erb"
      end
    end

    private

    def event_params
      params.require(:event).permit(:title,
                                  :category,
                                  :event_date,
                                  :starts_at,
                                  :ends_at,
                                  :location_name,
                                  :cover_image,
                                  :location_url,
                                  :description_markdown,
                                  :published,
                                  :host_name,
                                  :profile_image,
                                  :live_now)
    end
  end
end
