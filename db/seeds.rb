def self.fab_badge
    fab_badge_sampler.sample
end

def self.fab_badge_sampler
    [
        "info",
        "success",
        "warning",
        "danger",
    ]
end

def self.fab_boolean
    [true, false].sample
end

def self.fab_code
    "puts \"Hello World\""
end

def self.fab_country
    fab_country_sampler.sample
end

def self.fab_country_sampler
    [
        "US",
        "UK",
        "CH",
        "IE",
        "IN",
        "IT",
    ]
end

def self.fab_external_image
    "https://picsum.photos/#{40 + rand(40)}/#{40 + rand(40)}"
end

def self.fab_gravatar
    fab_gravatar_sampler.sample
end

def self.fab_gravatar_sampler
    [
        "alpha@example.com",
        "bravo@example.com",
        "charlie@example.com",
        "delta@example.com",
        "echo@example.com",
        "foxtrot@example.com",
    ]
end

def self.fab_markdown
    "markdown"
end

def self.fab_number
    rand(100)
end

def self.fab_password
    "password"
end

def self.fab_progress_bar
    rand(100)
end

def self.fab_status
    fab_status_sampler.sample
end

def self.fab_status_sampler
    [
        "done",
        "complete",
        "waiting",
        "running",
        "failed",
    ]
end

def self.fab_text
    "text"
end

def self.fab_textarea
    "textarea"
end

def self.fab_trix
    "trix"
end

def self.fab_date
    Date.today + rand(1000)
end

def self.fab_date_time
    DateTime.now + rand(1000)
end

def self.fab_item
    Item.new(
        demo_badge: fab_badge,
        demo_boolean: fab_boolean,
        demo_code: fab_code,
        demo_country: fab_country,
        demo_date: fab_date,
        demo_date_time: fab_date_time,
        demo_external_image: fab_external_image,
        demo_gravatar: fab_gravatar,
        demo_markdown: fab_markdown,
        demo_number: fab_number,
        demo_password: fab_password,
        demo_progress_bar: fab_progress_bar,
        demo_status: fab_status,
        demo_text: fab_text,
        demo_textarea: fab_textarea,
        demo_trix: fab_trix,
    )
end

100.times do
    item = fab_item
    puts item
    item.save!
end
