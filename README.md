`bundle install

`bundle exec ruby app.rb


# Live Search Example

client:

  when a user types a character

    issue an async POST request to "/search" w/ params: query = "input_text"

server:

  handle a POST request to "/search"

    search database for songs using query parameter

    return JSON with the relevant results

    ex.  "[{'title':'Clocks', 'artist':'Coldplay'}, {'title':'Baby', 'artist': 'Justin Bieber'}]"

client:

  when we get a response from the server...

    parse the JSON into objects (array of song hashes)

    for every song, we add it to a div on the page
