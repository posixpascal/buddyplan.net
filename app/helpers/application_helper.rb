module ApplicationHelper

  def with_icon(icon_name, label_tag)
    raw image_tag(icon_name, height: 25) + " " + label(label_tag, label_tag)
  end

  def small_icon(icon_name, opts = {height: 20})
    raw image_tag(icon_name, opts)
  end
  # (@location.last_weather_conditions["currently"]['temperature']).round %>° <%= image_tag @location.last_weather_conditions['currently']['icon'], height: 20, style: "position:relative;top:-2px" %>
  # <%= @location.last_weather_conditions['currently']['summary']
  def weather_for location
    return "" unless location and location.lat and location.lng
    raw "#{(location.last_weather_conditions["currently"]['temperature']).round}° " + image_tag(location.last_weather_conditions['currently']['icon'], height: 20, style: "position:relative;top:-2px")
  end
  def gmaps_link_for location
    return "" unless location and location.lat and location.lng
    raw "<a target='_blank' href='https://www.google.de/maps/place/BuddyPlan/@#{location.lat},#{location.lng},19z'>Google Maps</a>"
  end

  def participants(event_participants)
    out = event_participants.map do |ep|
      class_name = cycle("success", "info", "primary", "danger", "warning")
      "<span class='badge badge-pill text-uppercase badge-primary'>#{ep.actor.firstname[0]}#{ep.actor.lastname[0]}</span> "
    end

    raw out.join("")
  end

  def empty_resource(klass, opts)
    title = opts[:title]

    if title.nil?
      title = klass.to_s.pluralize.downcase
    end

    raw "<div class='alert alert-primary' role='alert'>
      <h4 class='alert-heading text-primary'>There are no #{title} as of now</h4>
      <p>#{opts[:info]}</p>
      <a href='#{opts[:cta]}' class='btn btn-sm btn-outline-primary'>create #{title}</a>
    </div>"
  end

  def bootstrap_class_for_flash(key)
    {
        :error => "danger",
        :success => "success",
        :notice => "info"
    }[key.to_sym] || "primary"
  end

  def breadcrumbs crumbs
    crumbs = crumbs.map do |group|
        "<li class='breadcrumb-item'><a href='#{group[0]}'>#{group[1]}</a></li>"
  end.join("")
    raw "<nav aria-label='breadcrumb'>
    <ol class='breadcrumb'>
      #{crumbs}
    </ol></div>"

  end
end
