---
title: Local Database Storage on iOS with Aaron Douglas
date: 2020-09-05 08:00
description: In this episode, Leo talks with Aaron Douglas from Automattic and Ray
  Wenderlich author on local database storage on iOS. Why you should do it? What the
  difference between SQLite and Core Data? ... and more
featuredImage: https://images.transistor.fm/file/transistor/images/episode/289487/full_1597693251-artwork.jpg
youtubeID: AJR_evPDxms
audioDuration: 3307
videoDuration: 3309
podcastID: f6092e38
---
<p><a href="https://www.youtube.com/watch?v=RMAczbuXgKo"><strong>Bonus! We talked about Automattic and Apple here...</strong></a></p><p><b>Guest</b></p><ul><li>
<a href="https://twitter.com/astralbodies"><strong>Aaron Douglas (@astralbodies)</strong></a><ul>
<li>
<a href="https://aaron.blog/">The Dangling Pointer</a> (homepage)</li>
<li><a href="https://store.raywenderlich.com/products/core-data-by-tutorials"><strong>Core Data by Tutorials</strong></a></li>
</ul>
</li></ul><p><b>Related Episodes</b></p><ul>
<li><a href="https://share.transistor.fm/s/14bb74b2"><strong>Episode 61 - Machine Learning and Core ML with Jameson Toole</strong></a></li>
<li><a href="https://share.transistor.fm/s/dfb18c54"><strong>Episode 57 - SwiftUI with Majid Jabrayilov - Part 2</strong></a></li>
<li><a href="https://share.transistor.fm/s/17f05dbf"><strong>Episode 49 - Vapor 4 with Tibor Bödecs</strong></a></li>
</ul><p><b>Related Links</b></p><ul>
<li><a href="https://www.donnywals.com/fetching-objects-from-core-data-in-a-swiftui-project/">Fetching objects from Core Data in a SwiftUI project by Donny Wals</a></li>
<li><a href="https://inessential.com/2020/05/18/why_netnewswire_is_fast">Why NetNewsWire Is Fast by Brent Simmons</a></li>
<li><a href="https://hibernate.org/">Hibernate</a></li>
<li>Libraries<ul>
<li><a href="https://github.com/stephencelis/SQLite.swift">stephencelis/SQLite.swift</a></li>
<li><a href="https://github.com/ccgus/fmdb">ccgus/fmdb</a></li>
<li>
<a href="https://github.com/groue/GRDB.swift">GRDB.swift</a> </li>
</ul>
</li>
<li>Tools<ul>
<li><a href="https://github.com/ChristianKienle/Core-Data-Editor">ChristianKienle/Core-Data-Editor</a></li>
<li><a href="https://simpholders.com">SimPholders</a></li>
</ul>
</li>
<li>Alternatives<ul>
<li>
<a href="https://realm.io/">Realm</a> </li>
<li><a href="https://parseplatform.org/">Parse</a></li>
</ul>
</li>
</ul><p><b>Sponsors</b></p><p><a href="https://appfigures.com/account/upgrade?p=empower3030"><strong>AppFigures</strong></a><strong><br></strong><em>The tools you need to monitor, optimize, and get more downloads.</em><strong></strong></p><p>If you want your app to succeed, there's never been a better time to read up on App Store Optimization and Appfigures provides that for you. </p><ul>
<li>Check out their <a href="https://appfigures.com/resources">great articles and guides on app store optimization </a>
</li>
<li>
<a href="https://appfigures.com/resources/tagged/aso-teardown">Brand new teardowns of specific apps</a>, like <a href="https://appfigures.com/resources/aso/optimization-teardown-spotify">Spotify</a> for instance or indie apps like <a href="https://appfigures.com/resources/aso/aso-teardown-fotmob">Fotmob</a>.</li>
<li>
<a href="https://appfigures.com/reports/competitors?utm_source=empowerapps">New competitor's report in the Appfigures dashboard</a> where you are able to view competitor downloads, build performance benchmarks, and see the new trends as they happen. <a href="https://appfigures.com/reports/competitors?utm_source=empowerapps">Check it out here.</a>
</li>
<li>Check out more of their resources at <a href="http://appfigures.com/resources">appfigures.com/resources</a>.</li>
</ul><p>The folks at Appfigures have <a href="https://appfigures.com/resources/aso">easy step-by-step guides and intuitive tools to do that</a>, which many indie developers are using to get more downloads:<br><a href="https://appfigures.com/resources/aso">https://appfigures.com/resources/aso</a></p><p>Also check out <a href="https://share.transistor.fm/s/15b7ff63">our episode with CEO Ariel Michaeli:<br>https://share.transistor.fm/s/15b7ff63</a></p><p><a href="https://appfigures.com/account/upgrade?p=empower3030">Try Appfigures for free, and if you like it use the special link to get 30% off for the next 3 months:</a><a href="https://www.linode.com/?r=97e09acbd5d304d87dadef749491d245e71c74e7"><br></a><a href="https://appfigures.com/account/upgrade?p=empower3030">https://appfigures.com/account/upgrade?p=empower3030</a></p><p><br><a href="https://transistor.fm/?via=empowerapps"><strong>Transistor.Fm</strong></a><br><em>Your podcast's publishing platform<br></em>Transistor not only hosts your podcast but also:</p><ul>
<li>
<strong>Help distribute your podcast with integrations</strong> to Apple Podcasts, Spotify, Google Podcasts, YouTube, and Mailchimp</li>
<li>
<strong>Deep analytics</strong> including average downloads per episode, popular podcast apps, number of subscribers, trends</li>
<li>
<strong>Professional support</strong> for creatives, businesses, and professional podcasters when it comes to hosting and analytics</li>
</ul><p><a href="https://transistor.fm/how-to-start-a-podcast/?via=empowerapps"><strong>How do you start a podcast?</strong></a><br><a href="https://transistor.fm/how-to-start-a-podcast/?via=empowerapps">https://transistor.fm/how-to-start-a-podcast/?via=empowerapps</a></p><p>Try it today with<a href="https://transistor.fm/?via=empowerapps"> this special link:</a><br><a href="https://transistor.fm/?via=empowerapps">https://transistor.fm/?via=empowerapps</a></p><p><b>Why Local Storage?</b></p><ul>
<li>Local cache is import for speed and being off-line</li>
<li>Benefits of a flat file vs local database</li>
<li>Why not run a server on your iPhone?</li>
</ul><p><b>Why SQLite</b></p><ul>
<li>How SQLite works?</li>
<li>What's missing from SQLite as opposed to a relational database server?</li>
<li>How to get started with SQLite in Swift?</li>
<li>Dealing with data types in SQLite</li>
<li>What is Journaling and Why not use it?</li>
</ul><p><b>Why CoreData</b></p><ul>
<li>What is Object Relational Mapping?</li>
<li>What is an Object Graph?</li>
<li>What is a Context?</li>
<li>Why use Core Data vs SQLite?</li>
<li>Challenges in Dealing with Migrations</li>
</ul><p><b>CoreData Tips and Tricks</b></p><ul>
<li>Optimizations in CoreData</li>
<li>How to Debug CoreData</li>
<li>Building for Cross-Platform</li>
<li>Testing Different Versions</li>
<li>How Syncing to makes your app more tolerant based on API changes</li>
<li>Dealing with CloudKit</li>
<li>Dealing with SwiftUI</li>
</ul><p><b>Social Media</b></p><p><strong>Email</strong><br>leo@brightdigit.com<br><a href="https://github.com/brightdigit">GitHub - @brightdigit</a></p><p><a href="https://twitter.com/brightdigit"><strong>Twitter </strong><br>BrightDigit - @brightdigit</a><br><a href="https://twitter.com/leogdion">Leo - @leogdion</a></p><p><a href="https://www.linkedin.com/company/bright-digit"><strong>LinkedIn</strong><br>BrightDigit</a><br><a href="https://www.linkedin.com/in/leogdion/">Leo</a></p><p><a href="https://www.instagram.com/brightdigit/">Instagram - @brightdigit</a><br><a href="https://www.patreon.com/empowerappsshow">Patreon - empowerappshow</a></p><p><b>Credits</b></p><p><a href="https://filmmusic.io/">Music from https://filmmusic.io</a><br><a href="https://incompetech.com/">"Blippy Trance" by Kevin MacLeod (https://incompetech.com)</a><br><a href="http://creativecommons.org/licenses/by/4.0/">License: CC BY (http://creativecommons.org/licenses/by/4.0/)</a></p><p><br></p><p><strong><a href="https://www.patreon.com/empowerappsshow" rel="payment" title="★ Support this podcast on Patreon ★">★ Support this podcast on Patreon ★</a></strong></p>
      
