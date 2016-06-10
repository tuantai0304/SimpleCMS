﻿
INSERT INTO Posts (Title, Content, Created, Updated, Visible) VALUES ('A post about  Aenean vel purus massa', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam feugiat ante et metus malesuada, nec bibendum nisl hendrerit. Aenean vel purus massa. Suspendisse eget elementum tellus, at pellentesque neque. Phasellus sed eleifend nunc. Sed nulla dui, suscipit eget commodo vel, sollicitudin ac ipsum. Aliquam et eleifend arcu. Nam rhoncus tincidunt metus vitae finibus. Vivamus eu scelerisque ipsum, sed molestie mauris. Quisque fermentum erat eget purus gravida iaculis. Donec quis ante est. Maecenas orci mauris, vehicula sed odio non, iaculis imperdiet felis. Ut accumsan scelerisque metus, id bibendum ex faucibus ac. Suspendisse porta eleifend risus a iaculis. Proin semper rutrum ipsum, vehicula dignissim velit dignissim at.\n\nAliquam vitae odio ac felis lobortis egestas quis in magna. Donec tincidunt nulla ac mauris condimentum, lobortis aliquam mauris dictum. Nullam ut metus sed massa volutpat tincidunt. Sed scelerisque lacinia mi, eget sollicitudin dolor ultricies vitae. Donec sed laoreet sapien, ac lobortis odio. Duis eget scelerisque ipsum. Curabitur vulputate porttitor enim, vitae pretium arcu finibus quis. Sed et imperdiet dui, quis ultricies turpis. Mauris ac augue dignissim, elementum odio eu, aliquam nisl. Suspendisse dui orci, cursus vel est ultricies, convallis volutpat massa.', '2016-03-10 03:07:13', '2016-03-10 03:07:13', 1);
INSERT INTO Posts (Title, Content, Created, Updated, Visible) VALUES ('Another and Test Post About Stuff ', '<p style="text-align: justify; font-size: 11px; line-height: 14px; margin-bottom: 14px; padding: 0px; color: rgb(0, 0, 0); font-family: Arial, Helvetica, sans;">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer non lectus vel ex volutpat finibus. Morbi sit amet lectus felis. Sed justo mi, bibendum in turpis quis, porttitor <span style="font-style: italic;">cursus</span> nunc. Praesent vulputate efficitur dolor. Nam lacinia, diam quis iaculis efficitur, orci mauris mollis ante, quis faucibus lorem arcu eu dui. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Sed dignissim molestie arcu, at fermentum nulla ultricies vitae. Sed lacinia leo lacus, eu aliquet est accumsan non.</p><p style="text-align: justify; font-size: 11px; line-height: 14px; margin-bottom: 14px; padding: 0px; color: rgb(0, 0, 0); font-family: Arial, Helvetica, sans;">Etiam placerat porttitor nisl bibendum efficitur. Curabitur dolor risus, convallis sit amet massa id, lobortis congue purus. Ut scelerisque ut est in euismod. Donec nulla nulla, condimentum quis maximus volutpat, viverra eget lorem. Donec malesuada laoreet justo ultrices porta. Donec sagittis, ipsum at posuere elementum, orci dolor <span style="font-style: italic;">volutpat</span> <span style="font-style: italic;">nisl</span>, id gravida nulla erat ac ligula. Praesent commodo massa justo, at placerat nisl pellentesque sed.</p><div><br></div>', '2016-03-10 03:07:13', '2016-03-10 03:07:13', 1);
INSERT INTO Posts (Title, Content, Created, Updated, Visible) VALUES ('This is a post about nothing', '<p>Not much here. mm</p>', '2016-03-10 03:07:13', '2016-03-10 03:07:13', 1);
INSERT INTO Posts (Title, Content, Created, Updated, Visible) VALUES ('About this Blog', 'Welcome to the blog for addison.im! This blog will be used to document my side projects and share anything interesting I find.  The backend of the blog was built using <a href="http://laravel.com" target="_blank">Laravel 4</a>, a popular PHP framework. The framework uses a MVC design pattern which I am starting to feel comfortable with. In the past I have worked with <a href="http://rubyonrails.org/" target="_blank">Ruby on Rails</a> and found the MVC structure a bit confusing at first, but after reading the <a href="https://leanpub.com/laravel4cookbook" target="_blank">Laravel 4 Cookbook</a> and some other online tutorials I think I have it figured out. \r\n<br/><br/>\r\nUsing Laravel I was able to make this simple blog and CMS. New posts are created through the admin dashboard, where comments are approved and posts are edited as well. I haven''t created a way, besides a database seed class, for creating new users since I will be the only one making posts. A demo of the admin dashboard can be seen <a href="http://addison.im/blog/demo/dashboard.php" target="_blank">here</a>.\r\n<br/><br/>\r\nI wanted to keep Laravel and the blog on the /blog/ directory since I plan on hosting other projects on this domain so I ended up using RSS to link posts across the site (something I picked up from working with WordPress). An RSS feed is generated with <a href="https://github.com/jbenzshawel/addison.im.blog/blob/master/feed/index.php" target="_blank">some PHP</a> at <a href="http://addison.im/blog/feed/" target="_blank">addison.im/blog/feed/</a> and then read in the XML file, again with PHP, where ever I want to list the latest posts (this is how posts are listed on the addison.im page).\r\n<br/><br/>\r\nI ran into a problem of links to posts, similar to /blog/post/12/show/, being redirected to /post/12/show/ since the Laravel installation thinks it is configured at the root level. I decided to just write a <code>mod_rewrite</code> rule on the .htaccess file as seen below:\r\n<pre>\r\n<span style="color:#a4a4a4;"># redirect fix for posts from outside links</span>\r\n<span style="color:#26368b;">RewriteEngine</span> On\r\n<span style="color:#26368b;">RewriteRule</span> ^post/(.*)$  /blog/public/post/$1  [R=301,NE,L] \r\n\r\n</pre>\r\n<p style="width:80%;">The rewrite rule is pretty self explanatory. The <code>(.*)</code> in combination with <code>$1</code> takes everything past /post/ in the original URL and places it where the <code>$1</code> is, <code>R=301</code> means that the address bar will reflect the change in URL, and the <code>NE</code> ensures that the request is not escaped. The <code>L</code> flag means that if the rule matches, no further rules will be processed.</p>\r\n<p style="width:80%;">To look at the code for this blog check out the <a href="https://github.com/jbenzshawel/addison.im.blog" target="_blank">github repo here</a>. In the future I plan on writing about another side project I have been working on called <a href="http://addison.im/php_reddit/" target="_blank">PHP Reddit</a>.   \r\n\r\n', '2014-03-31 05:44:59', '2014-03-31 05:44:59', 1);
INSERT INTO Posts (Title, Content, Created, Updated, Visible) VALUES ('PHP Reddit - a side project I''ve been chipping away at ', 'Over winter break I started work on a project that was inspired by a subreddit called <a href="http://reddit.com/r/40daysofruby" target="_blank">/r/40daysofruby</a> where the premise was to learn Ruby on Rails in 40 days. Since I had a few weeks off I thought this would be a good project. I decided the end goal would be to recreate reddit in the RoR MVC framework. \r\n<br/><br/>\r\nLearning the basics of ruby wasn''t too hard but about half way through <a href="http://ruby.railstutorial.org/ruby-on-rails-tutorial-book" target="_blank">this tutorial</a> by Michael Hartl I decided I was not learning much and had created the example apps without really understanding MVC. \r\n<br/><br/>\r\nSince I still wanted to finish the project, and also was looking for a new project to work on, I decided to build the back end of the site in PHP/MySQL instead of Ruby on Rails/SQLite. Having not really understood the MVC framework at the time I did not follow any design pattern besides trying to keep the site <a href="http://en.wikipedia.org/wiki/Representational_state_transfer" target="_blank">RESTful</a>. \r\n<br/><br/>\r\nI plan on going back and reworking the structure of the site to follow a MVC design pattern in the future. As of now there is a basic version of the site up at <a href="http://addison.im/php_reddit">addison.im/php_reddit</a> and as always a <a href="http://github.com/jbenzshawel/php_reddit/" target="+blank">github repo</a>. \r\n<br/><br/>\r\nCheck back later for updates to this post about the site!   ', '2014-04-14 08:44:00', '2014-04-14 08:44:00', 1);
INSERT INTO Posts (Title, Content, Created, Updated, Visible) VALUES ('OneK - A challenge to create a webapp in under 1,000 Bytes of data', 'Earlier this week I saw a <a href="http://www.reddit.com/r/webdev/comments/23kbjz/1kb_challenge/" target="_blank">post on Reddit</a> about <a href="http://onekb.net/" target="_blank">onekb.net</a> where you can "Get one KiloByte of free webspace for just 0.00000001 bitcoin per hour!" The goal of the post was to see what you could create in under 1 KB of data. I came up with the idea of making a Reddit RSS reader (unoriginal idea, I know). </p>\r\n\r\n<p>After I finished a version to host I realized that I cannot use any PHP in the site, just JS/HTML. I plan on making a version in JS in the future but right now it is in either PHP/XSL or just PHP. The latest version is being hosted on my site at <a href="http://addison.im/oneK/" target="_blank">addison.im/oneK/</a> and I also have <a href="http://reddit.onekb.net/" target="_blank">reddit.onekb.net/</a> for another couple of hours. </p>\r\n\r\n<p>Once on the site you can search by subreddit but just adding it on like it is another directory. For example to list only posts in <code>/r/webdev/</code> you would write <code>/oneK/webdev/</code></p>\r\n\r\n<p>The site pulls in content from the RSS feed at <a href="http://reddit.com/.rss" target="_blank">http://reddit.com/.rss</a> using a combination of PHP and XSLT (<a href="https://developer.mozilla.org/en-US/docs/Web/XSLT" target="_blank">Extensible Stylesheet Language Transformations</a>). The website I help develop at work uses RSS feeds to pass content around the site since WordPress automatically generates them for posts. At work today for some reason RSS feeds were not working inside of the building''s network. When I noticed my site wasn''t working I thought there was an issue with the XML to XSLT transformation so I rewrote the site to only use PHP (I actually prefer using just PHP to parse XML feeds but I thought using XSLT would be more concise, which I was wrong about), but the error persisted. \r\n</p>\r\n\r\n<p>Here is the <a href="http://github.com/jbenzshawel/oneK/" target="_blank">github repo</a> for the site. The live version is way over the 1,000 Byte limit since I chose to add the subreddit feature. I plan on having a new version, under 1 KB in just PHP/CSS  up soon as well as adding some more styles to the current version like a header/menu with subreddits. </p>', '2014-04-24 06:21:15', '2014-04-24 06:21:15', 1);
INSERT INTO Posts (Title, Content, Created, Updated, Visible) VALUES ('Migrating a WordPress Multisite into AWS with EC2 + RDS', 'In the midst of finals week, graduation, finishing my work at my previous job, and starting a new job I have not had time to post in a while. In my last few weeks of work at my previous position I was in charge of migrating the organization’s WP Multisite into a sandbox environment in <a href="http://aws.amazon.com/" target="_blank">Amazon Web Services</a>. For performance and ease of maintenance we decided to use an <a href="http://aws.amazon.com/ec2/" target="_blank">EC2 instance</a> to run the WordPress site with the database set up in <a href="http://aws.amazon.com/rds/" target="_blank">RDS</a>.  Since I was leaving once the sandbox environment was set up I tried my best to document the setup process, <a href="https://github.com/givetoiowa/ct3.5/tree/master/aws_migration" target="_blank">which can be seen here</a>. </p>\r\n\r\n<p>Overall I am really impressed with AWS and the sandbox environment. The customer service is helpful, the amount of control over the servers is awesome, and the new site is fast. Page load times went from eight seconds (I know way too slow) to three seconds. Most of this is due to using <a href="http://requirejs.org/" target="_blank">Require.js</a> and asynchronus calls with JS to parse RSS feeds, however I think moving from GoDaddy helped.</p>\r\n\r\n\r\n', '2014-07-08 08:56:14', '2016-03-10 03:07:39', 1);
INSERT INTO Posts (Title, Content, Created, Updated, Visible) VALUES ('Compilation of songs I know on acoustic guitar', 'I did this all in one take on purpose since I normally spend way too long trying to get things the way I like it. I am rushing pretty bad the whole time so I plan on using a metronome, as well as writing some transitions, for the next take.</p>\r\n\r\n<p>Due to the record being done with my phone it is not the best quality and needs to be turned up in order to hear. I left the recording pretty much raw except for doing a noise reduction to get rid of a static/clicking sound which helped the quality but made it even softer.</p>\r\n \r\n<iframe width="100%" height="200" scrolling="no" frameborder="no" src="https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/158590642&auto_play=false&hide_related=false&show_comments=true&show_user=true&show_reposts=false&visual=true"></iframe>\r\n\r\n<p>Check back for updates as to where this project is going. This list of side projects is only getting bigger, however I hope to finish this one over the summer.</p>', '2014-07-14 10:09:02', '2016-03-06 20:45:40', 1);
INSERT INTO Posts (Title, Content, Created, Updated, Visible) VALUES ('Summertime - A recording of one of my favorite standards ', 'I haven''t been playing the trumpet much over the past year or so since I''ve been really busy with work, however I am trying to get back into playing more music. This is a take I did of one of my favorite standards, Summertime.</p>\r\n\r\n<iframe width="100%" height="200" scrolling="no" frameborder="no" src="https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/159507971&amp;auto_play=false&amp;hide_related=false&amp;show_comments=true&amp;show_user=true&amp;show_reposts=false&amp;visual=true"></iframe>', '2014-07-20 23:27:28', '2014-07-20 23:27:28', 0);
INSERT INTO Posts (Title, Content, Created, Updated, Visible) VALUES ('So What - Another trumpet improv take ', 'A take I did on So What by Miles Davis. Since it''s been a while since I''ve improved I am sticking with some simple charts at first. After the solo I honestly didn''t think it turned out very well, however after listening to it the take is starting to grow on me.</p>\r\n\r\n<iframe width="100%" height="200" scrolling="no" frameborder="no" src="https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/160030527&amp;auto_play=false&amp;hide_related=false&amp;show_comments=true&amp;show_user=true&amp;show_reposts=false&amp;visual=true"></iframe>', '2014-07-24 10:43:49', '2014-07-24 10:43:49', 0);

SELECT * FROM Posts;