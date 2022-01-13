---
title: Swift Package Index with Sven A. Schmidt
date: 2021-01-16 00:00
description: In this episode, Leo talks with Sven A. Schmidt, co-creator of the Swift
  Package Index. We talk about the challenges of supporting thousands of Swift Packages,
  dealing with metrics and site ops with Vapor, running CI for the site and the plethora
  of Swift packages as well as Apple Silicon support.
featuredImage: https://images.transistor.fm/file/transistor/images/episode/433918/full_1610317400-artwork.jpg
youtubeID: VqQTUM7-_64
audioDuration: 2788
videoDuration: 2790
---
<p><b>Guest</b></p><ul><li>
<a href="https://finestructure.co"><strong>Sven A. Schmidt - finestructure.co</strong></a><ul>
<li><a href="%20https://twitter.com/_sa_s">Twitter - @_sa_s</a></li>
<li><a href="https://www.linkedin.com/in/svenaschmidt">LinkedIn - Sven A. Schmidt </a></li>
</ul>
</li></ul><p><a href="https://youtu.be/VqQTUM7-_64"><strong>Youtube Video - https://youtu.be/VqQTUM7-_64</strong></a></p><p><b>Related Episodes</b></p><ul>
<li><a href="https://share.transistor.fm/s/a8b66b9f">Episode 75 - Year of the Server with Tim Condon - Part 2</a></li>
<li><a href="https://share.transistor.fm/s/a6728b43">Episode 74 - Year of the Server with Tim Condon - Part 1</a></li>
<li><a href="https://share.transistor.fm/s/e38854fe">Episode 46 - Developer Community - Part 2</a></li>
<li><a href="https://share.transistor.fm/s/46b2f52d">Episode 45 - Developer Community - Part 1</a></li>
<li><a href="https://share.transistor.fm/s/17f05dbf">Episode 49 - Vapor 4 with Tibor Bödecs</a></li>
<li><a href="https://share.transistor.fm/s/bf0516f2">Episode 34 - Server-Side Swift with Tim Condon</a></li>
<li><a href="https://share.transistor.fm/s/a14f868f">Episode 24 - Continuous Integration with Kyle Newsome</a></li>
</ul><p><b>Related Links</b></p><ul>
<li><a href="https://github.com/finestructure/Arena">Arena</a></li>
<li>
<a href="https://finestructure.co/hummingbird">Hummingbird</a> </li>
<li><a href="https://finestructure.co/revisor">Revisor (Xcode Extension)</a></li>
<li><a href="https://swiftpackageindex.com">Swift Package Index</a></li>
<li><a href="https://www.swiftbysundell.com/podcast/75/">Swift by Sundell #75 - The Swift package ecosystem</a></li>
<li><a href="https://vimeo.com/480555844/c2410e1f89">Swift Packages - Dependency Management of the Future - Leo Dion</a></li>
<li>
<a href="https://blog.swiftpackageindex.com/posts/the-swift-package-index-metadata-file-first-steps">The Swift Package Index Metadata File</a><ul>
<li><a href="https://github.com/pointfreeco/swift-composable-architecture/blob/main/.spi.yml">watchOS Support in Composable Architecture by PointFree</a></li>
<li><a href="https://github.com/brightdigit/MistKit/blob/main/.spi.yml">Docker Image Support in MistKit by Leo</a></li>
</ul>
</li>
<li>
<a href="https://shields.io">Shields.io</a> - badges for your README</li>
<li>
<a href="https://github.com/brightdigit/MistKit">MistKit</a> - CloudKit support outside of CloudKit framework (i.e. Linux)</li>
<li>
<a href="https://github.com/apple/swift-metrics">Swift Metrics</a> </li>
<li><a href="https://github.com/MrLotU/SwiftPrometheus">SwiftPrometheus</a></li>
<li><a href="https://github.com/pointfreeco/swift-snapshot-testing">Snapshot Testing by PointFree</a></li>
<li><a href="https://github.com/JohnSundell/Ink">Ink by John Sundell</a></li>
<li><a href="https://github.com/JohnSundell/Plot">Plot by John Sundell</a></li>
<li><a href="https://orchardnest.com">OrchardNest.com</a></li>
<li><a href="https://www.pointfree.co/episodes/ep16-dependency-injection-made-easy">PointFree Ep 16: Dependency Injection Made Easy</a></li>
<li><a href="https://vimeo.com/291588126">How To Control The World by Stephen Celis (from PointFree)</a></li>
<li><a href="https://grafana.com">Grafana</a></li>
<li><a href="https://finestructure.co/blog/rester">Rester for Smoke Testing</a></li>
<li><a href="https://finestructure.co/blog/2021/1/10/running-docker-on-apple-silicon-persistence">Running Docker on Apple Silicon M1 (persisted volume)</a></li>
<li><a href="https://forums.swift.org/t/extend-swiftpm-packagedescription-to-introduce-metadata/37722">Extend SwiftPM `PackageDescription` to introduce metadata</a></li>
<li><a href="https://learningswift.brightdigit.com/swift-package-continuous-integration-guide/">Swift Package Continuous Integration Guide by Leo</a></li>
<li><a href="https://developer.apple.com/documentation/virtualization">Virtualization Framework</a></li>
</ul><p><b>Sponsors</b></p><p><a href="https://appfigures.com/account/upgrade?p=empower3030"><strong>AppFigures</strong></a><strong><br></strong><em>The tools you need to monitor, optimize, and get more downloads.</em><strong></strong></p><p>There's a lot of demand for apps right now, so it's a really great time to give it a try. It's easier than you think.<br>The guys who run it are indie devs who had a need and created a tool. 11 years later, it's an all-in-one platform for developers who want to get more downloads and make more money with their apps.</p><p>The folks at Appfigures have <a href="https://appfigures.com/resources/aso">easy step-by-step guides and intuitive tools to do that</a>, which many indie developers are using to get more downloads:<br><a href="https://appfigures.com/resources/aso">https://appfigures.com/resources/aso</a></p><p>Also check out <a href="https://share.transistor.fm/s/15b7ff63">our episode with CEO Ariel Michaeli:<br>https://share.transistor.fm/s/15b7ff63</a></p><p><a href="https://appfigures.com/account/upgrade?p=empower3030">Try Appfigures for free, and if you like it use the special link to get 30% off for the next 3 months:</a><a href="https://www.linode.com/?r=97e09acbd5d304d87dadef749491d245e71c74e7"><br></a><a href="https://appfigures.com/account/upgrade?p=empower3030">https://appfigures.com/account/upgrade?p=empower3030</a></p><p><a href="https://www.linode.com/?r=97e09acbd5d304d87dadef749491d245e71c74e7"><strong>Linode</strong></a><br><em>A cloud experience developers love</em></p><ul>
<li>Great for Setting Up a Backend for Your App</li>
<li>Variety of VM Configurations and Settings</li>
<li>Reasonable Pricing Starting at $5 per month</li>
<li>Global Data Centers</li>
<li><strong>The Developer Cloud Simplified</strong></li>
</ul><p>Try it today with<a href="https://transistor.fm/?via=empowerapps"> </a><a href="https://www.linode.com/?r=97e09acbd5d304d87dadef749491d245e71c74e7">this special link:<br>https://www.linode.com/?r=97e09acbd5d304d87dadef749491d245e71c74e7</a></p><p>Check out <a href="https://orchardnest.com/">OrchardNest</a> Today:<br>https://orchardnest.com</p><p><b>Maintaining Swift Package Index</b></p><ul>
<li>Supporting Different Projects and Packages</li>
<li>Dealing with Schemes and Docker Images</li>
<li>Supporting Badges</li>
</ul><p><b>Server Side Support</b></p><ul>
<li>Snapshot Testing for the web page</li>
<li>Tracking Metrics and performance</li>
<li>Setting up CI on Gitlab and Github Actions</li>
<li>Making deployment easy</li>
</ul><p><b>Future of SPI</b></p><ul>
<li>Dealing with Apple Silicon</li>
<li>Running a Database Server on an M1</li>
<li>README Support Here</li>
<li>Improved Search Support</li>
<li>Category Support</li>
<li>More Metadata Support</li>
</ul><p><b>Social Media</b></p><p><strong>Email</strong><br>leo@brightdigit.com<br><a href="https://github.com/brightdigit">GitHub - @brightdigit</a></p><p><a href="https://twitter.com/brightdigit"><strong>Twitter </strong><br>BrightDigit - @brightdigit</a><br><a href="https://twitter.com/leogdion">Leo - @leogdion</a></p><p><a href="https://www.linkedin.com/company/bright-digit"><strong>LinkedIn</strong><br>BrightDigit</a><br><a href="https://www.linkedin.com/in/leogdion/">Leo</a></p><p><a href="https://www.instagram.com/brightdigit/">Instagram - @brightdigit</a><br><a href="https://www.patreon.com/empowerappsshow">Patreon - empowerappshow</a></p><p><b>Credits</b></p><p><a href="https://filmmusic.io/">Music from https://filmmusic.io</a><br><a href="https://incompetech.com/">"Blippy Trance" by Kevin MacLeod (https://incompetech.com)</a><br><a href="http://creativecommons.org/licenses/by/4.0/">License: CC BY (http://creativecommons.org/licenses/by/4.0/)</a></p><p><strong><a rel="payment" title="★ Support this podcast on Patreon ★" href="https://www.patreon.com/empowerappsshow">★ Support this podcast on Patreon ★</a></strong></p>
      