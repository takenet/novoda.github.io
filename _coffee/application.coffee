$(document).ready ->
  app.init()
  github.init()

app =
  init: ->
    @bind_events()
    @sticky_nav_bottom()

  bind_events: ->
    $(window).scroll ->
      app.sticky_nav_top()
      app.sticky_nav_bottom()

    # Anchor scrolling
    $(document).on 'click', '[data-anchor-link]', (e) ->
      e.preventDefault()
      anchor = $(this).attr('data-anchor-link')
      offset = $('[data-anchor="'+anchor+'"]').offset().top - 60
      $('html,body').animate
        scrollTop: offset + 'px'
      , 1000

    # More Button
    $(document).on 'click', '.btn-more', (e) ->
      e.preventDefault()
      offset = $('.main-header').height()
      $('html,body').animate
        scrollTop: offset + 'px'
      , 1000

  sticky_nav_top: ->
    if $(window).width() > 705
      offset_top = $(".main-header").height()
      if $(window).scrollTop() >= offset_top
        $(".main-nav").addClass("sticky-top")
        $(".sticky-spacer").show()
      else
        $(".main-nav").removeClass("sticky-top")
        $(".sticky-spacer").hide()

  sticky_nav_bottom: ->
    if $(window).width() > 705
      if $(".main-header").height() > $(window).height() - 60
        $(".main-nav").addClass("sticky-bottom")
        # console.log $(".main-header").outerHeight(), $(window).height()
        # console.log "Nav sticks to bottom now"
      scroll_offset = $(".main-header").height() - $(window).height() + 60
      if $(window).scrollTop() >= scroll_offset
        $(".main-nav").removeClass("sticky-bottom")
        # console.log $(".main-header").outerHeight(), $(window).height()
        # console.log "Nav doesn't stick on bottom now"


categories =
  'documentations':
    0: 29869246 # lime
    1: 104106362 # blip-docs
    2: 137491987 # blip-toolkit-docs
    3: 43025281 # Take.IO
    4: 107960458 # blip-webhook-samples
  'web':
    0: 48236052 # DefinitelyTyped
    1: 112517552 # parsemetadata
  'blip':
    0: 104934333 # blip-sdk-js
    1: 78526933 # blip-chat-ios
    2: 127461205 # blip-CLI
    3: 94437568 # blip-sdk-csharp
    4: 120639672 # blip-chat-widget
    5: 129412593 # blip-toolkit
    6: 124117021 # blip-chat-extension
    7: 78028475 # blip-chat-android
    8: 108291218 # blip-cards-ios
    9: 108877052 # blip-cards-vue-components
    10: 111943391 # blip-components
    11: 102865506 # blip-sdk-java
    12: 95885876 # blip-client-testing-csharp
  'messaging-libs':
    0: 13923445  # CorrectNumber
    1: 14797019 # libphonenumber-csharp
    2: 18225451 # lime-csharp
    3: 29746487 # lime-java  
    4: 44409566 # tangram-notification-listener
    5: 44410892 # tangram-notification-listener-bin
    6: 44615818 # tangram-flows-provisioning
    7: 47823021 # lime-js
    8: 48689508 # textc-csharp
    9: 60376320 # lime-js-transports
  'apps':
    0: 26484613 # TokenAutoComplete
    1: 28351385 # ormlite-android
    2: 28351416 # ormlite-core
    3: 29748747 # Org.Lucasr.TwoWayView-Xamarin-Binding
    4: 30649385 # emojicon
    5: 35505612 # SnackBar
    6: 36248158 # FreshMvvm
    7: 39843491 # Xamarin-Forms-Labs
  'tools':
    0: 13860708 # library.data
    1: 13864228 # library.logging
    2: 16308759 # Takenet.ScoreSystem
    3: 149455670 # feature-toggle-client
    4: 150332582 # monitoring-error-handler
    5: 32214523 # elephant
  'do-not-list':
    0: 15866473 # Takenet.Radar
    1: 31331508 # _takenet.github.io
    2: 34530604 # TakePonto
    3: 54596596 # science-lab-contact
    4: 65389115 # takenet.github.io
    5: 48433542 # messaginghub-docs
    6: 36456287 # SignalR
    7: 47768728 # messaginghub-client-csharp
    8: 48108328 # messaginghub-client-js
    9: 52841345 # messaginghub-client-java
    10: 48236052 # DefinitelyTyped
    11: 50101611 # rabbitmq-dotnet-client
    12: 18210631 # ServiceStack.Text

### Repository IDs
13860708  # library.data
13864228 # library.logging
13923445  # CorrectNumber
14797019 # libphonenumber-csharp
15866473  # Takenet.Radar
16308759 # Takenet.ScoreSystem
18210631 # ServiceStack.Text
18225451 # lime-csharp
26484613 # TokenAutoComplete
28351385 # ormlite-android
28351416 # ormlite-core
29059471 # java-client *
29746487 # lime-java
29748747 # Org.Lucasr.TwoWayView-Xamarin-Binding
29869246 # lime
30649385 # emojicon
31331508 # _takenet.github.io
32214523 # elephant
32340836 # pop-recarga-woocommerce-plugin
34530604 # TakePonto
35505612  # SnackBar
36248158 # FreshMvvm
36456287 # SignalR
39843491 # Xamarin-Forms-Labs
43025281 # Take.IO
44409566 # tangram-notification-listener
44410892 # tangram-notification-listener-bin
44615818 # tangram-flows-provisioning
47768728 # messaginghub-client-csharp
47823021 # lime-js
48108328 # messaginghub-client-js
48236052 # DefinitelyTyped
48433542 # messaginghub-docs
48689508 # textc-csharp
49142034 # markdocs
49263482 # MarkdownSharp-GithubCodeBlocks
50101611 # rabbitmq-dotnet-client
52841345 # messaginghub-client-java
54596596 # science-lab-contact
60376320 # lime-js-transports
65389115 # takenet.github.io
104106362 # blip-docs
137491987 # blip-toolkit-docs
104934333 # blip-sdk-js
4369522 # blip-chat-ios
127461205 # blip-CLI
94437568 # blip-sdk-csharp
120639672 # blip-chat-widget
129412593 # blip-toolkit
124117021 # blip-chat-extension
78028475 # blip-chat-android
108291218 # blip-cards-ios
111943391 # blip-components
108877052 # blip-cards-vue-components
102865506 # blip-sdk-java
107960458 # blip-webhook-samples
95885876 # blip-client-testing-csharp
60376320 # lime-js-transports
149455670 # feature-toggle-client
150332582 # monitoring-error-handler
112517552 # parsemetadata
###


github =
  username: "takenet"
  api_url: "https://api.github.com"
  at: "077be9086e2ef3479e91c8b7682dfb2fcd0d0112"
  cat_temp: ''
  cat_key_temp: ''
  repo_count: 0
  contributor_count: 0

  init: ->
    @get_repositories()

  get_repositories: ->
    endpoint = @api_url + '/orgs/' + @username + '/repos?type=public&per_page=100&access_token=' + @at
    @fetch endpoint, @list_repositories

  list_repositories: (repos) ->
    repos = github.sort_object repos, 'stargazers_count'
    github.repo_count = repos.length
    $.each repos, (key, val) ->
      cat = github.get_category val
      unless cat is 'do-not-list'
        if cat is ''
          cat = 'default'
        # console.log val
        repo = '<div class="repo" data-rid="'+val.id+'"><h3>'+(val.language or "Script")+'</h3><h2><a href="'+val.html_url+'">'+val.name+'</a></h2><p>'+(val.description or "You can find more information on GitHub.")+'</p><div class="repo-contributors"></div><div class="repo-meta"><a href="https://github.com/'+github.username+'/'+val.name+'/stargazers"><span class="entypo-star"></span> '+val.stargazers_count+'</a><!--<a href="https://github.com/'+github.username+'/'+val.name+'/forks"><span class="entypo-flow-branch"></span> '+val.forks+'</a>--></div></div>'
        $('.repos[data-category="'+cat+'"] .loading').hide()
        $('.repos[data-category="'+cat+'"]').append repo
        github.get_contributors val.name, val.id

  get_category: (repo) ->
    github.cat_temp = ''
    github.cat_key_temp = ''
    $.each categories, (key, val) ->
      github.cat_key_temp = key
      $.each val, (i, d) ->
        # Check if repo is in this category
        if d is repo.id
          github.cat_temp = github.cat_key_temp
    github.cat_temp

  get_contributors: (repo_name, repo_id) ->
    endpoint = @api_url + '/repos/' + @username + '/' + repo_name + '/contributors?access_token=' + @at
    @fetch endpoint, @list_contributors, repo_id

  list_contributors: (contributors, repo_id) ->
    if contributors
      contributors = github.sort_object contributors, 'contributions'
      github.contributor_count += contributors.length
      repo = $('.repo[data-rid="'+repo_id+'"]')
      i = 0
      while i < 5
        if contributors[i]
          c = '<a href="https://github.com/'+contributors[i].login+'"><img src="'+contributors[i].avatar_url+'" alt="" title="'+contributors[i].login+'" /></a>'
          $('.repo-contributors', repo).append c
        i++
    github.display_stats()

  display_stats: ->
    $('.repo-count').html github.repo_count
    $('.contributor-count').html github.contributor_count

  sort_object: (data, property) ->
    byProperty = (prop) ->
      (a, b) ->
        if typeof a[prop] == 'number'
          b[prop] - (a[prop])
        else
          if a[prop] < b[prop] then -1 else if a[prop] > b[prop] then 1 else 0
    return data.sort(byProperty(property))

  fetch: (url, callback, callback_param = '') ->
    $.ajax(
      method: 'GET'
      url: url
    ).done (data) ->
      if callback_param is ''
        callback data
      else
        callback data, callback_param
