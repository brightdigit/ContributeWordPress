---
title: Year of the Server with Tim Condon - Part 2
date: 2020-12-29 00:00
description: In this second part of our interview with Tim Condon, we follow up on
  Async/Await and Vapor 5, Amazon and server-side Swift, hosting, frameworks, development,
  and what we look forward to in 2021.
featuredImage: https://images.transistor.fm/file/transistor/images/episode/427316/full_1609204740-artwork.jpg
youtubeID: VMNvZtw9OyU
audioDuration: 2138
videoDuration: 2140
---
<p><b>Guest</b></p><ul><li>
<a href="https://www.timc.dev/"><strong>Tim Condon</strong></a><ul><li><a href="https://twitter.com/0xtim?s=21">Twitter @0xTim</a></li></ul>
</li></ul><p><a href="https://youtu.be/VMNvZtw9OyU"><strong>Youtube Video - https://youtu.be/VMNvZtw9OyU</strong></a></p><p><b>Related Episodes</b></p><ul>
<li><a href="https://share.transistor.fm/s/a6728b43">Episode 74 - Year of the Server with Tim Condon - Part 1</a></li>
<li><a href="https://share.transistor.fm/s/b203049d">Episode 72 - Functional Programming with Daniel Steinberg</a></li>
<li><a href="https://share.transistor.fm/s/17f05dbf">Episode 49 - Vapor 4 with Tibor Bödecs</a></li>
<li><a href="https://share.transistor.fm/s/bf0516f2">Episode 34 - Server-Side Swift with Tim Condon</a></li>
<li><a href="https://share.transistor.fm/s/ffcb9fc1">Episode 8 - Choosing the Right Backend with Erik Gillespie</a></li>
</ul><p><b>Related Links</b></p><ul>
<li><a href="https://www.timc.dev/posts/future-of-server-side-swift/">The Future of Swift on the Server by Tim</a></li>
<li><a href="https://www.serversideswift.info/speakers/simonpilkington">Building the next version of the Smoke Framework by Simon Pilkington</a></li>
<li><a href="https://swift.org/server/">Swift Server Work Group</a></li>
<li><a href="https://developer.apple.com/videos/play/wwdc2020/10644/">Use Swift on AWS Lambda with Xcode - WWDC 2020</a></li>
<li><a href="https://www.enekoalonso.com/2020/12/06/getting-started-with-async-await-in-swift.html">Getting started with async/await in Swift by Eneko Alonso</a></li>
<li><a href="https://github.com/soto-project/soto">Soto for AWS</a></li>
<li><a href="https://github.com/amzn/smoke-framework">Smoke Framework</a></li>
<li><a href="https://www.serversideswift.info/speakers/simonpilkington">Building the next version of the Smoke Framework by Simon Pilkington</a></li>
<li><a href="https://www.kitura.dev">Kitura</a></li>
<li><a href="https://chaqmoq.dev">Chaqmoq</a></li>
<li><a href="https://github.com/apple/swift-log">Swift Log</a></li>
<li><a href="https://github.com/apple/swift-metrics">Swift Metrics</a></li>
<li><a href="https://github.com/apple/swift-distributed-tracing">Swift Tracing</a></li>
<li><a href="https://github.com/vapor/queues">Vapor Queues</a></li>
<li><a href="https://github.com/m-barthelemy/vapor-queues-fluent-driver">Vapor Queues Fluent Driver</a></li>
<li><a href="https://www.raywenderlich.com/8325890-a-complete-guide-to-swift-development-on-linux">A Complete Guide to Swift Development on Linux By Jari Koopman</a></li>
<li><a href="https://github.com/pwsacademy/swift-setup">Swift Setup from Steven Van Impe and PWS Academy</a></li>
<li>
<a href="https://www.iosdevhappyhour.com">iOS Developer Happy Hour</a> by <a href="https://twitter.com/codeine_coding?s=21">Allen W</a>
</li>
<li><a href="https://appforce1.net/podcast/">AppForce1 Podcast</a></li>
</ul><p><b>Sponsors</b></p><p><a href="https://appfigures.com/account/upgrade?p=empower3030"><strong>AppFigures</strong></a><strong><br></strong><em>The tools you need to monitor, optimize, and get more downloads.</em><strong></strong></p><p>There's a lot of demand for apps right now, so it's a really great time to give it a try. It's easier than you think.<br>The guys who run it are indie devs who had a need and created a tool. 11 years later, it's an all-in-one platform for developers who want to get more downloads and make more money with their apps.</p><p>The folks at Appfigures have <a href="https://appfigures.com/resources/aso">easy step-by-step guides and intuitive tools to do that</a>, which many indie developers are using to get more downloads:<br><a href="https://appfigures.com/resources/aso">https://appfigures.com/resources/aso</a></p><p>Also check out <a href="https://share.transistor.fm/s/15b7ff63">our episode with CEO Ariel Michaeli:<br>https://share.transistor.fm/s/15b7ff63</a></p><p><a href="https://appfigures.com/account/upgrade?p=empower3030">Try Appfigures for free, and if you like it use the special link to get 30% off for the next 3 months:</a><a href="https://www.linode.com/?r=97e09acbd5d304d87dadef749491d245e71c74e7"><br></a><a href="https://appfigures.com/account/upgrade?p=empower3030">https://appfigures.com/account/upgrade?p=empower3030</a></p><p><a href="https://www.linode.com/?r=97e09acbd5d304d87dadef749491d245e71c74e7"><strong>Linode</strong></a><br><em>A cloud experience developers love</em></p><ul>
<li>Great for Setting Up a Backend for Your App</li>
<li>Variety of VM Configurations and Settings</li>
<li>Reasonable Pricing Starting at $5 per month</li>
<li>Global Data Centers</li>
<li><strong>The Developer Cloud Simplified</strong></li>
</ul><p>Try it today with<a href="https://transistor.fm/?via=empowerapps"> </a><a href="https://www.linode.com/?r=97e09acbd5d304d87dadef749491d245e71c74e7">this special link:<br>https://www.linode.com/?r=97e09acbd5d304d87dadef749491d245e71c74e7</a></p><p>Check out <a href="https://orchardnest.com/">OrchardNest</a> Today:<br>https://orchardnest.com</p><p><b>Vapor 5 and Async/Await</b></p><ul>
<li>How Async/Await affects SwiftNIO</li>
<li>How Async/Await affects EventLoopFuture</li>
<li>Performances vs Maintainability </li>
<li>What is the timeline on Async/Await</li>
</ul><p><b>Amazon and Server-Side Swift</b></p><ul>
<li>What is Soto?</li>
<li>What Amazon web services Soto supports?</li>
<li>How to integrate Soto into your sever-side Swift project?</li>
<li>What is Smoke?</li>
</ul><p><b>Important Server-Side Frameworks</b></p><ul>
<li>Smoke, Kitura, and Chaqmoq</li>
<li>Logging and Metrics</li>
<li>Job and Queue Management</li>
<li>Swift Tracing</li>
</ul><p><b>Server-Side Swift in the Real World</b></p><ul>
<li>Where to Host Your Server-Side App</li>
<li>Is Server-Side Swift Production Ready</li>
<li>Growth of Server-Side Acceptance in 2020</li>
<li>Differences from iOS Development</li>
<li>Scaling Your Server-Side Application</li>
<li>Can You Develop in Swift outside of Xcode?</li>
</ul><p><b>Social Media</b></p><p><strong>Email</strong><br>leo@brightdigit.com<br><a href="https://github.com/brightdigit">GitHub - @brightdigit</a></p><p><a href="https://twitter.com/brightdigit"><strong>Twitter </strong><br>BrightDigit - @brightdigit</a><br><a href="https://twitter.com/leogdion">Leo - @leogdion</a></p><p><a href="https://www.linkedin.com/company/bright-digit"><strong>LinkedIn</strong><br>BrightDigit</a><br><a href="https://www.linkedin.com/in/leogdion/">Leo</a></p><p><a href="https://www.instagram.com/brightdigit/">Instagram - @brightdigit</a><br><a href="https://www.patreon.com/empowerappsshow">Patreon - empowerappshow</a></p><p><b>Credits</b></p><p><a href="https://filmmusic.io/">Music from https://filmmusic.io</a><br><a href="https://incompetech.com/">"Blippy Trance" by Kevin MacLeod (https://incompetech.com)</a><br><a href="http://creativecommons.org/licenses/by/4.0/">License: CC BY (http://creativecommons.org/licenses/by/4.0/)</a></p><p><br></p><p><strong><a rel="payment" title="★ Support this podcast on Patreon ★" href="https://www.patreon.com/empowerappsshow">★ Support this podcast on Patreon ★</a></strong></p>
      