## Day 14 - Rails - Pagination - Bootstrap style

Lets make the pagination links to Bootstrap style with "will_paginate-bootstrap" gem
### Install will_paginate-bootstrap gem

add 'will_paginate-bootstrap' to Gemfile
```
# Bootstrap Pagination markup
gem 'will_paginate-bootstrap'
```
and do "bundle install" and restart the server


### Add Pagination markup to template
app/views/books/index.html.erb
```
<%= will_paginate @collection, renderer: BootstrapPagination::Rails %>

```

